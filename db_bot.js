import "dotenv/config";
import path from "path";
import { fileURLToPath } from "url";
import fs from "fs";
import Database from "better-sqlite3";
import OpenAI from "openai";

// SQLite Database Setup - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Function to get the path of a given file, joins the current directory with the filename
function getPath(fname) {
  return path.join(__dirname, fname);
}

// Define paths for the database and SQL setup scripts
const dbPath = getPath("aidb.sqlite");
const setupSqlPath = getPath("setup.sql");
const setupSqlDataPath = getPath("setupData.sql");

// If the database already exists, delete it to start fresh
if (fs.existsSync(dbPath)) {
  fs.unlinkSync(dbPath);
}

// Create the new database
const db = new Database(dbPath);

// Read the SQL scripts
const setupSqlScript = fs.readFileSync(setupSqlPath, "utf-8");
const setupSqlDataScript = fs.readFileSync(setupSqlDataPath, "utf-8");

// Run the SQL scripts
db.exec(setupSqlScript);
db.exec(setupSqlDataScript);

function runSql(query) {
  const stmt = db.prepare(query);
  const result = stmt.all();
  return result;
}

// OpenAI Setup - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const openAIClient = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

// Check to make sure the API key is valid (basically just pings the API to see if it works)
async function testApiKey() {
  try {
    const models = await openAIClient.models.list();
    console.log("✅ OpenAI API key is valid");
  } catch (error) {
    console.error("❌ API key failed:", error.message);
  }
}

await testApiKey();

const getSQLInstructions =
  "Give me a sqlite select statement that answers the question. Only respond with sqlite syntax. If there is an error do not explain it!";
const getFriendlyResponseInstructions =
  "Please, just give a concise response in a more friendly way? Please do not give any other suggests or chatter.";

// instructions is the developer instructions, input is the user input (the question)
async function getChatGptResponse(content, instructions) {
  const response = await openAIClient.responses.create({
    model: "gpt-4.1-mini",
    instructions: instructions,
    input: content,
  });

  return response.output_text;
}

// Pulls out the SQL code and throws out the rest of the response. If no SQL code is found, returns a message saying so.
// async function sanitizeForJustSQL(content) {
//   const marker = "```";
//   const startIndex = content.indexOf(marker);
//   const endIndex = content.lastIndexOf(marker);

//   if (startIndex !== -1 && endIndex !== -1 && startIndex !== endIndex) {
//     return content.substring(startIndex + marker.length, endIndex).trim();
//   }
//   return "No SQL code found in the response.";
// }
function sanitizeForJustSQL(content) {
  if (!content) return "";

  // Step 1: Trim whitespace
  let cleaned = content.trim();

  // Step 2: Extract code block if it exists (```sql ... ```)
  const codeBlockMatch = cleaned.match(/```[\s\S]*?```/);

  if (codeBlockMatch) {
    cleaned = codeBlockMatch[0]
      .replace(/```[a-zA-Z]*\n?/, "") // remove ```sql or ```sqlite
      .replace(/```/, "") // remove closing ```
      .trim();
  }

  // Step 3: Remove accidental leading "sql" if model still includes it
  if (cleaned.toLowerCase().startsWith("sql")) {
    cleaned = cleaned.slice(3).trim();
  }

  // Step 4: Remove trailing semicolon duplicates/newlines noise
  cleaned = cleaned.replace(/^\s+|\s+$/g, "");

  return cleaned;
}

const questions = [
  "What is the average age of all people staying in the dorms?",
  "How many participants are participating in FSY 1A?",
  "In which buildings are medical coordinators housed?",
  "What is the most common birth year of male participants?",
  "Which counselors have the most participants assigned to them?",
  "As a percentage, how many guests have not checked in yet?",
  "Which people staying in Building 3 were born in July?",
  "Will anyone be staying in the dorms on their birthday?",
  "As a percentage, how many FSY 1B participants are female?",
];

const strategies = {
  zero_shot: setupSqlScript,
  single_domain_single_shot:
    setupSqlScript +
    "\n\n" +
    "Example Question: How many counselors were born in 2002?\n" +
    "Example SQL Response: SELECT COUNT(*) FROM Person WHERE strftime('%Y', birthdate) = '2002' AND id IN (SELECT id FROM Counselor);",
};

async function run() {
  const allResults = [];
  for (const strategy in strategies) {
    console.log(`Running strategy: ${strategy}`);

    const results = {
      strategy: strategy,
      prompt_prefix: strategies[strategy],
      questions: [],
    };

    for (const question of questions) {
      console.log(`Processing question: ${question}`);

      let sqlResponse = "";
      let justSql = "";
      let queryResult = null;
      let friendlyResponse = "";
      let error = "None";

      try {
        sqlResponse = await getChatGptResponse(
          `${strategies[strategy]}

User Question: ${question}`,
          getSQLInstructions,
        );
        console.log("Raw SQL Response:", sqlResponse);

        justSql = await sanitizeForJustSQL(sqlResponse);

        // Fallback if no code block was returned (sometimes the SQL query is just returned without being in a code block)
        if (justSql === "No SQL code found in the response.") {
          justSql = sqlResponse.trim();
        }

        console.log("Just SQL:", justSql);

        queryResult = runSql(justSql);
        console.log("Query Result:", queryResult);

        let friendlyPrompt = `Question: ${question}
SQL Result: ${JSON.stringify(queryResult)}
Original SQL Query: ${justSql}
Database Schema: ${setupSqlScript}`;

        friendlyResponse = await getChatGptResponse(
          friendlyPrompt,
          getFriendlyResponseInstructions,
        );
      } catch (err) {
        error = err.message;
        console.error("Error executing SQL query:", error);
      }

      results.questions.push({
        question: question,
        sql_raw_response: sqlResponse,
        sql_extracted: justSql,
        query_result: queryResult,
        friendly_response: friendlyResponse,
        error: error,
      });
    }
    const filename = `response_${strategy}_${Date.now()}.json`;
    fs.writeFileSync(getPath(filename), JSON.stringify(results, null, 2));

    console.log(`Saved results to ${filename}`);
    allResults.push(results);
  }

  return allResults;
}

await run();
