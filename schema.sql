CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    realname TEXT,
    username TEXT UNIQUE,
    password TEXT,
    rights TEXT DEFAULT 'student'
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    realname TEXT,
    username TEXT UNIQUE,
    password TEXT,
    rights TEXT DEFAULT 'teacher'
);

CREATE TABLE usernames (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    rights TEXT
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name TEXT UNIQUE,
    credits INTEGER,
    contents TEXT,
    teacher_name TEXT,
    teacher_username TEXT
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(id),
    course_name TEXT,
    student_username TEXT REFERENCES students(username),
    teacher_username TEXT REFERENCES teachers(username)
);

CREATE TABLE questions (
    id SERIAL PRIMARY KEY,
    course_id INTEGER,
    course_name TEXT,
    question TEXT,
    answer TEXT,
    is_correct BOOLEAN
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    course_name TEXT REFERENCES courses(course_name),
    student_username TEXT REFERENCES students(username),
    points INTEGER,
    max_points INTEGER
);