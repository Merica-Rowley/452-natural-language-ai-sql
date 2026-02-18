-- ============================================================
-- SEED DATA
-- ============================================================

-- ------------------------------------------------------------
-- Buildings (2 male, 2 female)
-- ------------------------------------------------------------
INSERT INTO Building (id, occupant_gender) VALUES
    (3,  'M'),
    (4,  'M'),
    (7,  'F'),
    (10, 'F');

-- ------------------------------------------------------------
-- Bedspaces
-- Buildings 3 & 7:  Apt 1101-1103 (3 rooms, 2 beds each = 6 beds/apt)
--                   Apt 1105 (1 room, 2 beds) → HA
--                   Apt 2215 (1 room, 2 beds) → CA
--                   Total: 20 beds each
-- Buildings 4 & 10: Apt 1101-1103 (3 rooms, 2 beds each = 6 beds/apt)
--                   Total: 18 beds each
-- Grand total: 76 bedspaces
-- ------------------------------------------------------------
INSERT INTO Bedspace (id, building_id, apartment, room, bed) VALUES
    -- Building 3 (Male) — Apt 1101 (counselors)
    (1,  3, 1101, 1, 'A'),
    (2,  3, 1101, 1, 'B'),
    (3,  3, 1101, 2, 'A'),
    (4,  3, 1101, 2, 'B'),
    (5,  3, 1101, 3, 'A'),
    (6,  3, 1101, 3, 'B'),
    -- Building 3 (Male) — Apt 1102 (participants)
    (7,  3, 1102, 1, 'A'),
    (8,  3, 1102, 1, 'B'),
    (9,  3, 1102, 2, 'A'),
    (10, 3, 1102, 2, 'B'),
    (11, 3, 1102, 3, 'A'),
    (12, 3, 1102, 3, 'B'),
    -- Building 3 (Male) — Apt 1103 (participants)
    (13, 3, 1103, 1, 'A'),
    (14, 3, 1103, 1, 'B'),
    (15, 3, 1103, 2, 'A'),
    (16, 3, 1103, 2, 'B'),
    (17, 3, 1103, 3, 'A'),
    (18, 3, 1103, 3, 'B'),
    -- Building 3 (Male) — Apt 1105 (HA)
    (19, 3, 1105, 1, 'A'),
    (20, 3, 1105, 1, 'B'),
    -- Building 3 (Male) — Apt 2215 (CA)
    (21, 3, 2215, 1, 'A'),
    (22, 3, 2215, 1, 'B'),

    -- Building 4 (Male) — Apt 1101 (counselors)
    (23, 4, 1101, 1, 'A'),
    (24, 4, 1101, 1, 'B'),
    (25, 4, 1101, 2, 'A'),
    (26, 4, 1101, 2, 'B'),
    (27, 4, 1101, 3, 'A'),
    (28, 4, 1101, 3, 'B'),
    -- Building 4 (Male) — Apt 1102 (participants)
    (29, 4, 1102, 1, 'A'),
    (30, 4, 1102, 1, 'B'),
    (31, 4, 1102, 2, 'A'),
    (32, 4, 1102, 2, 'B'),
    (33, 4, 1102, 3, 'A'),
    (34, 4, 1102, 3, 'B'),
    -- Building 4 (Male) — Apt 1103 (participants)
    (35, 4, 1103, 1, 'A'),
    (36, 4, 1103, 1, 'B'),
    (37, 4, 1103, 2, 'A'),
    (38, 4, 1103, 2, 'B'),
    (39, 4, 1103, 3, 'A'),
    (40, 4, 1103, 3, 'B'),

    -- Building 7 (Female) — Apt 1101 (counselors)
    (41, 7, 1101, 1, 'A'),
    (42, 7, 1101, 1, 'B'),
    (43, 7, 1101, 2, 'A'),
    (44, 7, 1101, 2, 'B'),
    (45, 7, 1101, 3, 'A'),
    (46, 7, 1101, 3, 'B'),
    -- Building 7 (Female) — Apt 1102 (participants)
    (47, 7, 1102, 1, 'A'),
    (48, 7, 1102, 1, 'B'),
    (49, 7, 1102, 2, 'A'),
    (50, 7, 1102, 2, 'B'),
    (51, 7, 1102, 3, 'A'),
    (52, 7, 1102, 3, 'B'),
    -- Building 7 (Female) — Apt 1103 (participants)
    (53, 7, 1103, 1, 'A'),
    (54, 7, 1103, 1, 'B'),
    (55, 7, 1103, 2, 'A'),
    (56, 7, 1103, 2, 'B'),
    (57, 7, 1103, 3, 'A'),
    (58, 7, 1103, 3, 'B'),
    -- Building 7 (Female) — Apt 1105 (HA)
    (59, 7, 1105, 1, 'A'),
    (60, 7, 1105, 1, 'B'),
    -- Building 7 (Female) — Apt 2215 (CA)
    (61, 7, 2215, 1, 'A'),
    (62, 7, 2215, 1, 'B'),

    -- Building 10 (Female) — Apt 1101 (counselors)
    (63, 10, 1101, 1, 'A'),
    (64, 10, 1101, 1, 'B'),
    (65, 10, 1101, 2, 'A'),
    (66, 10, 1101, 2, 'B'),
    (67, 10, 1101, 3, 'A'),
    (68, 10, 1101, 3, 'B'),
    -- Building 10 (Female) — Apt 1102 (participants)
    (69, 10, 1102, 1, 'A'),
    (70, 10, 1102, 1, 'B'),
    (71, 10, 1102, 2, 'A'),
    (72, 10, 1102, 2, 'B'),
    (73, 10, 1102, 3, 'A'),
    (74, 10, 1102, 3, 'B'),
    -- Building 10 (Female) — Apt 1103 (participants)
    (75, 10, 1103, 1, 'A'),
    (76, 10, 1103, 1, 'B'),
    (77, 10, 1103, 2, 'A'),
    (78, 10, 1103, 2, 'B'),
    (79, 10, 1103, 3, 'A'),
    (80, 10, 1103, 3, 'B');

-- ------------------------------------------------------------
-- Camps
-- FSY 1A: Buildings 3 (M) and 10 (F)
-- FSY 1B: Buildings 4 (M) and 7 (F)
-- ------------------------------------------------------------
INSERT INTO Camp (id, name) VALUES
    (1, 'FSY 1A'),
    (2, 'FSY 1B'),
    (3, 'Boys Basketball 2A');

-- ------------------------------------------------------------
-- Persons
--
-- ID allocation:
--   1:       Male HA         (Building 3, Apt 1105, age 25+)
--   2:       Male CA         (Building 3, Apt 2215, age 18-24)
--   3-8:     Male Counselors (Building 3, Apt 1101, age 20-25) → FSY 1A
--   9-12:    Male Counselors (Building 4, Apt 1101, age 20-25) → FSY 1B
--   13-24:   Male Participants (Building 3, Apts 1102-1103, age 13-17) → FSY 1A
--   25-36:   Male Participants (Building 4, Apts 1102-1103, age 13-17) → FSY 1B
--   37:      Female HA       (Building 7, Apt 1105, age 25+)
--   38:      Female CA       (Building 7, Apt 2215, age 18-24)
--   39-44:   Female Counselors (Building 7, Apt 1101, age 20-25) → FSY 1B
--   45-48:   Female Counselors (Building 10, Apt 1101, age 20-25) → FSY 1A
--   49-60:   Female Participants (Building 7, Apts 1102-1103, age 13-17) → FSY 1B
--   61-72:   Female Participants (Building 10, Apts 1102-1103, age 13-17) → FSY 1A
-- ------------------------------------------------------------
INSERT INTO Person (id, first_name, last_name, birthdate, gender, bedspace_id) VALUES
    -- Male HA (Building 3, Apt 1105, bed A, age 25+)
    (1,  'James',    'Whitfield',  '1988-03-15', 'M', 19),
    -- Male CA (Building 3, Apt 2215, bed A, age 18-24)
    (2,  'Marcus',   'Delgado',    '2002-07-22', 'M', 21),

    -- Male Counselors (Building 3, Apt 1101, age 20-25)
    (3,  'Ethan',    'Holloway',   '2001-05-10', 'M', 1),
    (4,  'Noah',     'Castillo',   '2000-11-28', 'M', 2),
    (5,  'Liam',     'Okafor',     '2002-08-03', 'M', 3),
    (6,  'Daniel',   'Reyes',      '2003-02-17', 'M', 4),
    (7,  'Tyler',    'Nguyen',     '2001-06-25', 'M', 5),
    (8,  'Carlos',   'Fletcher',   '2000-09-14', 'M', 6),
    -- Male Counselors (Building 4, Apt 1101, age 20-25)
    (9,  'Andre',    'Washington', '2002-01-30', 'M', 23),
    (10, 'Patrick',  'Sullivan',   '2001-04-12', 'M', 24),
    (11, 'Ryan',     'Nakamura',   '2003-07-08', 'M', 25),
    (12, 'Diego',    'Morales',    '2000-10-21', 'M', 26),

    -- Male Participants (Building 3, Apt 1102, age 13-17)
    (13, 'Caleb',    'Jensen',     '2009-03-04', 'M', 7),
    (14, 'Mason',    'Patel',      '2010-08-19', 'M', 8),
    (15, 'Owen',     'Brooks',     '2008-12-11', 'M', 9),
    (16, 'Logan',    'Griffin',    '2011-05-27', 'M', 10),
    (17, 'Hunter',   'Simmons',    '2009-09-03', 'M', 11),
    (18, 'Brayden',  'Coleman',    '2010-02-14', 'M', 12),
    -- Male Participants (Building 3, Apt 1103, age 13-17)
    (19, 'Gavin',    'Pearson',    '2008-06-22', 'M', 13),
    (20, 'Connor',   'Hardy',      '2011-11-09', 'M', 14),
    (21, 'Aiden',    'Fitzgerald', '2009-04-16', 'M', 15),
    (22, 'Nolan',    'Chambers',   '2010-07-31', 'M', 16),
    (23, 'Blake',    'Cunningham', '2008-01-25', 'M', 17),
    (24, 'Eli',      'Caldwell',   '2011-03-07', 'M', 18),
    -- Male Participants (Building 4, Apt 1102, age 13-17)
    (25, 'Jaxon',    'Barrett',    '2009-10-13', 'M', 29),
    (26, 'Wyatt',    'Hicks',      '2010-05-28', 'M', 30),
    (27, 'Miles',    'Garrett',    '2008-08-06', 'M', 31),
    (28, 'Sawyer',   'Lyons',      '2011-01-17', 'M', 32),
    (29, 'Cole',     'Haynes',     '2009-06-24', 'M', 33),
    (30, 'Spencer',  'Floyd',      '2010-11-02', 'M', 34),
    -- Male Participants (Building 4, Apt 1103, age 13-17)
    (31, 'Landon',   'Stephens',   '2008-03-19', 'M', 35),
    (32, 'Tristan',  'Chavez',     '2011-08-30', 'M', 36),
    (33, 'Brody',    'Watkins',    '2009-02-07', 'M', 37),
    (34, 'Damien',   'Grant',      '2010-04-23', 'M', 38),
    (35, 'Parker',   'Webb',       '2008-09-15', 'M', 39),
    (36, 'Austin',   'Stone',      '2011-12-01', 'M', 40),

    -- Female HA (Building 7, Apt 1105, bed A, age 25+)
    (37, 'Priya',    'Sharma',     '1990-04-08', 'F', 59),
    -- Female CA (Building 7, Apt 2215, bed A, age 18-24)
    (38, 'Claire',   'Fontaine',   '2003-12-01', 'F', 61),

    -- Female Counselors (Building 7, Apt 1101, age 20-25)
    (39, 'Sofia',    'Brennan',    '2001-01-19', 'F', 41),
    (40, 'Aisha',    'Mensah',     '2002-07-30', 'F', 42),
    (41, 'Leila',    'Yamamoto',   '2000-10-05', 'F', 43),
    (42, 'Grace',    'Kowalski',   '2003-03-22', 'F', 44),
    (43, 'Hannah',   'Thornton',   '2001-08-14', 'F', 45),
    (44, 'Natalie',  'Abrams',     '2002-05-31', 'F', 46),
    -- Female Counselors (Building 10, Apt 1101, age 20-25)
    (45, 'Jasmine',  'Crawford',   '2000-02-26', 'F', 63),
    (46, 'Camille',  'Ortega',     '2003-09-11', 'F', 64),
    (47, 'Vivian',   'Petersen',   '2001-06-03', 'F', 65),
    (48, 'Destiny',  'Hoover',     '2002-11-18', 'F', 66),

    -- Female Participants (Building 7, Apt 1102, age 13-17)
    (49, 'Emma',     'Payne',      '2009-02-08', 'F', 47),
    (50, 'Olivia',   'Hudson',     '2010-06-23', 'F', 48),
    (51, 'Ava',      'Mcbride',    '2008-10-17', 'F', 49),
    (52, 'Isabella', 'Cobb',       '2011-03-04', 'F', 50),
    (53, 'Mia',      'Blackwell',  '2009-07-29', 'F', 51),
    (54, 'Charlotte','Vance',      '2010-12-15', 'F', 52),
    -- Female Participants (Building 7, Apt 1103, age 13-17)
    (55, 'Amelia',   'Osborne',    '2008-05-06', 'F', 53),
    (56, 'Harper',   'Ramsey',     '2011-09-21', 'F', 54),
    (57, 'Evelyn',   'Becker',     '2009-01-14', 'F', 55),
    (58, 'Abigail',  'Acosta',     '2010-04-30', 'F', 56),
    (59, 'Ella',     'Mccarthy',   '2008-08-12', 'F', 57),
    (60, 'Scarlett', 'Cannon',     '2011-11-27', 'F', 58),
    -- Female Participants (Building 10, Apt 1102, age 13-17)
    (61, 'Chloe',    'Frost',      '2009-03-09', 'F', 69),
    (62, 'Penelope', 'Higgins',    '2010-07-24', 'F', 70),
    (63, 'Layla',    'Bauer',      '2008-11-18', 'F', 71),
    (64, 'Riley',    'Cross',      '2011-04-05', 'F', 72),
    (65, 'Zoey',     'Wolfe',      '2009-08-20', 'F', 73),
    (66, 'Nora',     'Barker',     '2010-01-13', 'F', 74),
    -- Female Participants (Building 10, Apt 1103, age 13-17)
    (67, 'Lily',     'Mcgee',      '2008-06-07', 'F', 75),
    (68, 'Eleanor',  'Estrada',    '2011-10-22', 'F', 76),
    (69, 'Hannah',   'Salazar',    '2009-04-15', 'F', 77),
    (70, 'Stella',   'Pratt',      '2010-09-28', 'F', 78),
    (71, 'Paisley',  'Gibbs',      '2008-02-03', 'F', 79),
    (72, 'Savannah', 'Lindsey',    '2011-07-16', 'F', 80);

-- ------------------------------------------------------------
-- Employees
-- ------------------------------------------------------------
INSERT INTO Employee (id, role_type, keyset_id) VALUES
    (1,  'HA', 101),   -- James Whitfield  (Male HA)
    (2,  'CA', 102),   -- Marcus Delgado   (Male CA)
    (37, 'HA', 103),   -- Priya Sharma     (Female HA)
    (38, 'CA', 104);   -- Claire Fontaine  (Female CA)

-- ------------------------------------------------------------
-- Guests
-- FSY 1A (camp 1): Buildings 3 (M) and 10 (F)
--   Male guests:   counselors 3-8, participants 13-24
--   Female guests: counselors 45-48, participants 61-72
-- FSY 1B (camp 2): Buildings 4 (M) and 7 (F)
--   Male guests:   counselors 9-12, participants 25-36
--   Female guests: counselors 39-44, participants 49-60
-- ------------------------------------------------------------
INSERT INTO Guest (id, camp_id, arrival_date, departure_date, checked_in) VALUES
    -- FSY 1A — Male Counselors (Building 3)
    (3,  1, '2025-06-15', '2025-06-28', 1),
    (4,  1, '2025-06-15', '2025-06-28', 1),
    (5,  1, '2025-06-15', '2025-06-28', 1),
    (6,  1, '2025-06-15', '2025-06-28', 1),
    (7,  1, '2025-06-15', '2025-06-28', 0),
    (8,  1, '2025-06-15', '2025-06-28', 1),
    -- FSY 1A — Male Participants (Building 3)
    (13, 1, '2025-06-16', '2025-06-28', 1),
    (14, 1, '2025-06-16', '2025-06-28', 1),
    (15, 1, '2025-06-16', '2025-06-28', 0),
    (16, 1, '2025-06-16', '2025-06-28', 1),
    (17, 1, '2025-06-16', '2025-06-28', 1),
    (18, 1, '2025-06-16', '2025-06-28', 1),
    (19, 1, '2025-06-16', '2025-06-28', 0),
    (20, 1, '2025-06-16', '2025-06-28', 1),
    (21, 1, '2025-06-16', '2025-06-28', 1),
    (22, 1, '2025-06-16', '2025-06-28', 1),
    (23, 1, '2025-06-16', '2025-06-28', 0),
    (24, 1, '2025-06-16', '2025-06-28', 1),
    -- FSY 1A — Female Counselors (Building 10)
    (45, 1, '2025-06-15', '2025-06-28', 1),
    (46, 1, '2025-06-15', '2025-06-28', 1),
    (47, 1, '2025-06-15', '2025-06-28', 0),
    (48, 1, '2025-06-15', '2025-06-28', 1),
    -- FSY 1A — Female Participants (Building 10)
    (61, 1, '2025-06-16', '2025-06-28', 1),
    (62, 1, '2025-06-16', '2025-06-28', 1),
    (63, 1, '2025-06-16', '2025-06-28', 1),
    (64, 1, '2025-06-16', '2025-06-28', 0),
    (65, 1, '2025-06-16', '2025-06-28', 1),
    (66, 1, '2025-06-16', '2025-06-28', 1),
    (67, 1, '2025-06-16', '2025-06-28', 1),
    (68, 1, '2025-06-16', '2025-06-28', 1),
    (69, 1, '2025-06-16', '2025-06-28', 0),
    (70, 1, '2025-06-16', '2025-06-28', 1),
    (71, 1, '2025-06-16', '2025-06-28', 1),
    (72, 1, '2025-06-16', '2025-06-28', 1),

    -- FSY 1B — Male Counselors (Building 4)
    (9,  2, '2025-06-15', '2025-06-28', 1),
    (10, 2, '2025-06-15', '2025-06-28', 1),
    (11, 2, '2025-06-15', '2025-06-28', 0),
    (12, 2, '2025-06-15', '2025-06-28', 1),
    -- FSY 1B — Male Participants (Building 4)
    (25, 2, '2025-06-16', '2025-06-28', 1),
    (26, 2, '2025-06-16', '2025-06-28', 1),
    (27, 2, '2025-06-16', '2025-06-28', 1),
    (28, 2, '2025-06-16', '2025-06-28', 0),
    (29, 2, '2025-06-16', '2025-06-28', 1),
    (30, 2, '2025-06-16', '2025-06-28', 1),
    (31, 2, '2025-06-16', '2025-06-28', 1),
    (32, 2, '2025-06-16', '2025-06-28', 1),
    (33, 2, '2025-06-16', '2025-06-28', 0),
    (34, 2, '2025-06-16', '2025-06-28', 1),
    (35, 2, '2025-06-16', '2025-06-28', 1),
    (36, 2, '2025-06-16', '2025-06-28', 1),
    -- FSY 1B — Female Counselors (Building 7)
    (39, 2, '2025-06-15', '2025-06-28', 1),
    (40, 2, '2025-06-15', '2025-06-28', 1),
    (41, 2, '2025-06-15', '2025-06-28', 1),
    (42, 2, '2025-06-15', '2025-06-28', 0),
    (43, 2, '2025-06-15', '2025-06-28', 1),
    (44, 2, '2025-06-15', '2025-06-28', 1),
    -- FSY 1B — Female Participants (Building 7)
    (49, 2, '2025-06-16', '2025-06-28', 1),
    (50, 2, '2025-06-16', '2025-06-28', 1),
    (51, 2, '2025-06-16', '2025-06-28', 1),
    (52, 2, '2025-06-16', '2025-06-28', 0),
    (53, 2, '2025-06-16', '2025-06-28', 1),
    (54, 2, '2025-06-16', '2025-06-28', 1),
    (55, 2, '2025-06-16', '2025-06-28', 0),
    (56, 2, '2025-06-16', '2025-06-28', 1),
    (57, 2, '2025-06-16', '2025-06-28', 1),
    (58, 2, '2025-06-16', '2025-06-28', 1),
    (59, 2, '2025-06-16', '2025-06-28', 0),
    (60, 2, '2025-06-16', '2025-06-28', 1);

-- ------------------------------------------------------------
-- Counselors
-- Only plain 'Counselor' role_type is eligible for participant assignment.
-- Per camp, male side: 1 Coordinator, 1 Medical Coordinator (FSY 1A only),
--   1 Assistant Coordinator, rest plain Counselors.
-- Per camp, female side: 1 Coordinator, 1 Medical Coordinator (FSY 1B only),
--   1 Assistant Coordinator, rest plain Counselors.
-- ------------------------------------------------------------
INSERT INTO Counselor (id, role_type) VALUES
    -- Male counselors, FSY 1A (Building 3)
    (3,  'Coordinator'),
    (4,  'Medical Coordinator'),
    (5,  'Counselor'),
    (6,  'Counselor'),
    (7,  'Assistant Coordinator'),
    (8,  'Counselor'),
    -- Male counselors, FSY 1B (Building 4)
    (9,  'Counselor'),
    (10, 'Counselor'),
    (11, 'Coordinator'),
    (12, 'Counselor'),
    -- Female counselors, FSY 1B (Building 7)
    (39, 'Coordinator'),
    (40, 'Medical Coordinator'),
    (41, 'Counselor'),
    (42, 'Counselor'),
    (43, 'Assistant Coordinator'),
    (44, 'Counselor'),
    -- Female counselors, FSY 1A (Building 10)
    (45, 'Counselor'),
    (46, 'Counselor'),
    (47, 'Assistant Coordinator'),
    (48, 'Counselor');

-- ------------------------------------------------------------
-- Participants
-- Only assigned to Counselors with role_type = 'Counselor'.
-- Eligible male counselors:   5, 6, 8 (FSY 1A), 9, 10, 12 (FSY 1B)
-- Eligible female counselors: 41, 42, 44 (FSY 1B), 45, 46, 48 (FSY 1A)
-- 4 participants per counselor across 12 counselors = 48 total.
-- ------------------------------------------------------------
INSERT INTO Participant (id, counselor_id) VALUES
    -- FSY 1A male participants (13-24) → counselors 5, 6, 8
    (13, 5),
    (14, 5),
    (15, 5),
    (16, 5),
    (17, 6),
    (18, 6),
    (19, 6),
    (20, 6),
    (21, 8),
    (22, 8),
    (23, 8),
    (24, 8),
    -- FSY 1B male participants (25-36) → counselors 9, 10, 12
    (25, 9),
    (26, 9),
    (27, 9),
    (28, 9),
    (29, 10),
    (30, 10),
    (31, 10),
    (32, 10),
    (33, 12),
    (34, 12),
    (35, 12),
    (36, 12),
    -- FSY 1B female participants (49-60) → counselors 41, 42, 44
    (49, 41),
    (50, 41),
    (51, 41),
    (52, 41),
    (53, 42),
    (54, 42),
    (55, 42),
    (56, 42),
    (57, 44),
    (58, 44),
    (59, 44),
    (60, 44),
    -- FSY 1A female participants (61-72) → counselors 45, 46, 48
    (61, 45),
    (62, 45),
    (63, 45),
    (64, 45),
    (65, 46),
    (66, 46),
    (67, 46),
    (68, 46),
    (69, 48),
    (70, 48),
    (71, 48),
    (72, 48);