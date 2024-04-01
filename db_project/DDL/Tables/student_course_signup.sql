CREATE TABLE student_course_signup (
    signup_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    signup_date DATE,
    CONSTRAINT `fk_student_id` FOREIGN KEY (student_id) REFERENCES student(student_id),
    CONSTRAINT `fk_course_id` FOREIGN KEY (course_id) REFERENCES course(course_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=10000;