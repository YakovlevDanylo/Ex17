# Create table homework
CREATE TABLE Homework (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

# Create table lesson
CREATE TABLE Lesson (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    updatedAt TIMESTAMP,
    homework_id INT UNIQUE,
    FOREIGN KEY (homework_id) REFERENCES Homework(id)
);

# Create table schedule
CREATE TABLE Schedule(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    updateAt TIMESTAMP
);

# Create table schedule_lesson to connect tables schedule and lesson by many-to-many
CREATE TABLE Schedule_Lesson(
    id INT AUTO_INCREMENT PRIMARY KEY,
    schedule_id INT NOT NULL,
    lesson_id INT NOT NULL,
    FOREIGN KEY (schedule_id) REFERENCES Schedule(id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson(id)
);

# Add test data to table homework
INSERT INTO homework (name, description)
VALUES ('Homework 1', 'Description for Homework 1'),
       ('Homework 2', 'Description for Homework 2'),
       ('Homework 3', 'Description for Homework 3'),
       ('Homework 4', 'Description for Homework 4'),
       ('Homework 5', 'Description for Homework 5');

# Add test data to table lesson
INSERT INTO lesson (name, updatedAt, homework_id)
VALUES ('Lesson 1', '2024-06-20 08:00:00', 1),
       ('Lesson 2', '2024-06-21 09:00:00', 2),
       ('Lesson 3', '2024-06-22 10:00:00', 3),
       ('Lesson 4', '2024-06-23 11:00:00', 4),
       ('Lesson 5', '2024-06-24 12:00:00', 5);

# Add test data to table schedule
INSERT INTO schedule (name, updateAt)
VALUES
    ('Schedule 1', CURRENT_TIMESTAMP),
    ('Schedule 2', CURRENT_TIMESTAMP),
    ('Schedule 3', CURRENT_TIMESTAMP),
    ('Schedule 4', CURRENT_TIMESTAMP),
    ('Schedule 5', CURRENT_TIMESTAMP);

# Add test data to table schedule_lesson
INSERT INTO Schedule_Lesson (schedule_id, lesson_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (4, 1),
    (4, 2),
    (5, 3),
    (5, 4),
    (5, 5);