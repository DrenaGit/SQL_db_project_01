-- tento view vraci TOP 5 kurzu s nejvice zapsanymi studenty
CREATE VIEW courses_with_most_signed_up_students AS
SELECT c.course_id, c.course_name, COUNT(scs.student_id) AS total_number_of_signups
FROM course c
JOIN student_course_signup scs ON c.course_id = scs.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_number_of_signups DESC
LIMIT 5;