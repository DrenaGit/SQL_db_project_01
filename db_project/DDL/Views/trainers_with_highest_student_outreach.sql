-- tento view vraci TOP 3 trenery s nejvetsim dosahem studentu,
-- jinymi slovy trenery, kteri vyucuji kurzy s nejvetsim poctem zapsanych studentu

-- list of trainers teaching at least two courses
CREATE VIEW trainers_with_highest_student_outreach AS
SELECT
    t.trainer_id AS trainer_id,
    t.trainer_name AS trainer_name,
    c.course_name AS course_name,
    COUNT(scs.student_id) AS num_of_students_in_one_course
FROM trainer t
JOIN course c ON t.trainer_id = c.trainer_id
JOIN student_course_signup scs ON c.course_id = scs.course_id
GROUP BY t.trainer_id, t.trainer_name, c.course_name
ORDER BY num_of_students_in_one_course DESC
LIMIT 3;