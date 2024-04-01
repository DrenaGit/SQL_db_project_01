-- tento reportovaci view vraci vsechny vhodne aliasovane sloupce ze vsech tabulek v projektu spojenych pomoci odpovidajicich JOINu
CREATE VIEW report_all_data AS
SELECT 
    c.course_id AS course_id,
    c.course_name AS course_name,
    c.course_duration_in_months AS course_duration_in_months,
    c.course_capacity AS course_capacity,
    s.student_id AS student_id,
    s.student_name AS student_name,
    s.student_email AS student_email,
    s.student_grade AS student_grade,
    scs.signup_date AS signup_date,
    t.trainer_id AS trainer_id,
    t.trainer_name AS trainer_name,
    t.trainer_email AS trainer_email,
    t.trainer_expertise AS trainer_expertise,
    t.trainer_employment_status AS trainer_employment_status
FROM student_course_signup scs
JOIN student s ON scs.student_id = s.student_id
JOIN course c ON scs.course_id = c.course_id
JOIN trainer t ON c.trainer_id = t.trainer_id;