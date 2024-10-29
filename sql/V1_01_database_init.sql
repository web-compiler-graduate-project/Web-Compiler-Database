CREATE TABLE app_user (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    role VARCHAR(50),
    password_part1 VARCHAR(255)
);

CREATE TABLE task (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT
);

CREATE TABLE task_solution (
    id SERIAL PRIMARY KEY,
    comments TEXT
);

CREATE TABLE compilation_result (
    id SERIAL PRIMARY KEY,
    code TEXT,
    output TEXT,
    user_id INT REFERENCES app_user(id) ON DELETE CASCADE
);

CREATE TABLE user_task (
    user_id INT REFERENCES app_user(id) ON DELETE CASCADE,
    task_id INT REFERENCES task(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, task_id)
);

CREATE TABLE user_task_solution (
    user_id INT REFERENCES app_user(id) ON DELETE CASCADE,
    task_solution_id INT REFERENCES task_solution(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, task_solution_id)
);