CREATE TABLE students (
    id serial PRIMARY KEY,
    full_name varchar NOT NULL UNIQUE ,
    age int NOT NULL CHECK ( age >= 17 ),
    birth_date timestamp NOT NULL,
    is_male boolean NOT NULL, -- if true then male, else then female
    average_grade float NOT NULL CHECK (average_grade > 0 and average_grade < 5),
    about text NOT NULL, --information about yourself
    need_dorm boolean NOT NULL, --the need for a dormitory
    add_info text --additional info
);
CREATE TABLE instructors (
    id serial PRIMARY KEY,
    full_name varchar NOT NULL UNIQUE,
    experience int NOT NULL CHECK ( experience >= 2 ),
    remote_lessons boolean
);
CREATE TABLE lessons (
    id serial PRIMARY KEY,
    lesson_title varchar NOT NULL UNIQUE ,
    instructor varchar NOT NULL REFERENCES instructors(full_name), -- teaching instructor
    room_number int NOT NULL
);
CREATE TABLE studying (
    lesson varchar NOT NULL REFERENCES lessons(lesson_title),
    student varchar NOT NULL REFERENCES students(full_name),
    start_time timestamp NOT NULL,
    end_time timestamp NOT NULL,
    PRIMARY KEY (lesson, student)
);
CREATE TABLE languages (
    language varchar NOT NULL,
    instructor varchar NOT NULL REFERENCES instructors(full_name),
    level varchar NOT NULL,
    speak_duration int,
    PRIMARY KEY (language, instructor)
);