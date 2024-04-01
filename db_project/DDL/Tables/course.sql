CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT,
    course_name VARCHAR(255),
    course_duration_in_months TINYINT,
    course_capacity TINYINT, -- Added comma here
    CONSTRAINT `fk_trainer_id` FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;