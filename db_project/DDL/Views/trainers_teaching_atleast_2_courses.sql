-- tento view vraci trenery kteri vyucuji alespon 2 kurzy
CREATE VIEW trainers_teaching_at_least_two_courses AS
SELECT
	t.trainer_id,
    t.trainer_name,
    COUNT(c.course_id) AS number_of_courses_taught
FROM trainer t
JOIN course c ON t.trainer_id = c.trainer_id
GROUP BY t.trainer_id
HAVING COUNT(c.course_id) >= 2;
