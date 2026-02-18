import "dotenv/config";
import path from "path";
import { fileURLToPath } from "url";
import fs from "fs";
import Database from "better-sqlite3";
import OpenAI from "openai";

// SQLite Database Setup
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

// OPENAI API Setup
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

// instructions is the developer instructions, input is the user input (the question)
async function getChatGptResponse(content) {
  const response = await openAIClient.responses.create({
    model: "gpt-4.1-mini",
    instructions: "You are a coding assistant that talks like a pirate",
    input: content,
  });

  return response.output_text;
}
