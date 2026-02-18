CREATE TABLE Building (
    id BIGINT PRIMARY KEY,
    occupant_gender CHAR(1) NOT NULL
);

CREATE TABLE Bedspace (
    id BIGINT PRIMARY KEY,
    building_id BIGINT NOT NULL,
    apartment SMALLINT NOT NULL,
    room TINYINT NOT NULL,
    bed CHAR(1) NOT NULL,
    FOREIGN KEY (building_id) REFERENCES Building(id)
);

CREATE TABLE Camp (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Person (
    id BIGINT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    bedspace_id BIGINT NOT NULL,
    FOREIGN KEY (bedspace_id) REFERENCES Bedspace(id)
);

CREATE TABLE Employee (
    id BIGINT PRIMARY KEY,
    role_type TEXT NOT NULL CHECK (role_type IN ('HA', 'CA')),
    keyset_id BIGINT NOT NULL,
    FOREIGN KEY (id) REFERENCES Person(id)
);

CREATE TABLE Guest (
    id BIGINT PRIMARY KEY,
    camp_id BIGINT NOT NULL,
    arrival_date DATE NOT NULL,
    departure_date DATE NOT NULL,
    checked_in INTEGER NOT NULL CHECK (checked_in IN (0, 1)),
    FOREIGN KEY (id) REFERENCES Person(id),
    FOREIGN KEY (camp_id) REFERENCES Camp(id)
);

CREATE TABLE Counselor (
    id BIGINT PRIMARY KEY,
    role_type TEXT NOT NULL CHECK (role_type IN ('Counselor', 'Assistant Coordinator', 'Coordinator', 'Medical Coordinator')),
    FOREIGN KEY (id) REFERENCES Guest(id)
);

CREATE TABLE Participant (
    id BIGINT PRIMARY KEY,
    counselor_id BIGINT NOT NULL,
    FOREIGN KEY (id) REFERENCES Guest(id),
    FOREIGN KEY (counselor_id) REFERENCES Counselor(id)
);
