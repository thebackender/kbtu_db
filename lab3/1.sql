SELECT title FROM course WHERE credits > 3;--a

SELECT building, room_number FROM classroom WHERE building = 'Packard' OR building = 'Watson';--b

SELECT title FROM course WHERE dept_name = 'Comp. Sci.';--c

SELECT title FROM course, section WHERE course.course_id = section.course_id AND semester = 'Fall';--d

SELECT name FROM student WHERE tot_cred BETWEEN 45 AND 90;--e

SELECT name FROM student WHERE name LIKE '%a' OR name LIKE '%e' OR name LIKE '%i' OR name LIKE '%o' OR name LIKE '%u';--f

SELECT title FROM course, prereq WHERE course.course_id = prereq.course_id AND prereq_id = 'CS-101';--g