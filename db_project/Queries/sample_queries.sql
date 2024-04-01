-- zde ulozte par SELECT dotazu vyuzivajicich JOIN, prip. UNION nad tabulkami v projektu
-- list of students that are enrolled in one concrete course
-- list of trainers teaching at least two courses
SELECT trainer_id,
	trainer_name,
    number_of_courses_taught
FROM trainers_teaching_at_least_two_courses;

-- list of students enrolled in one concrete course (we use WHERE scs.course_id = x)
SELECT s.student_id, s.student_name, c.course_name
FROM student s
JOIN student_course_signup scs ON s.student_id = scs.student_id
JOIN course c ON scs.course_id = c.course_id
WHERE scs.course_id = 2;

-- list of trainers who have the highest number of students in their courses
SELECT num_of_students_in_one_course, trainer_name, course_name
FROM trainers_with_highest_student_outreach;

-- list of courses, where are no students enrolled
SELECT c.course_id, c.course_name
FROM course c
JOIN student_course_signup scs ON c.course_id = scs.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(scs.student_id) = 0;

-- list of students that are enrolled on more than one course (use GROUP_CONCAT to combine the names of the courses into a single string)
SELECT s.student_name, s.student_id, GROUP_CONCAT(c.course_name SEPARATOR ', ') AS enrolled_courses
FROM student s
JOIN student_course_signup scs ON s.student_id = scs.student_id
JOIN course c ON scs.course_id = c.course_id
GROUP BY s.student_name, s.student_id
HAVING COUNT(scs.course_id) > 1;

-- list of courses, where we search for courses by the trainer's name
SELECT c.course_id, c.course_name, t.trainer_name
FROM course c
JOIN trainer t ON c.trainer_id = t.trainer_id
WHERE t.trainer_name = 'Anna Jesenská'
GROUP BY c.course_id, c.course_name, t.trainer_name;