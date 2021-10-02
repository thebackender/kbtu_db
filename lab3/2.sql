SELECT dept_name,avg(instructor.salary) FROM instructor GROUP BY dept_name ORDER BY avg(instructor.salary) ASC;--a

SELECT department.building,count(1) FROM department,course WHERE department.dept_name = course.dept_name GROUP BY department.building HAVING count(1)=(SELECT MAX(second.number) FROM (SELECT count(1) AS number FROM department,course WHERE department.dept_name = course.dept_name GROUP BY department.building) AS second); --b

SELECT department.dept_name,count(1) FROM department,course WHERE department.dept_name = course.dept_name GROUP BY department.dept_name HAVING count(1)=(SELECT MIN(second.number) FROM (SELECT count(1) AS number FROM department,course WHERE department.dept_name = course.dept_name GROUP BY department.dept_name) AS second);--c

SELECT DISTINCT student.id,student.name FROM student WHERE student.id IN (SELECT third.id FROM (SELECT student.id, count(1) AS number FROM student,takes,course WHERE student.id=takes.id AND takes.course_id=course.course_id AND course.dept_name='Comp. Sci.' GROUP BY student.id) AS third WHERE third.number>3);--d

SELECT * FROM instructor WHERE instructor.dept_name='Biology' OR instructor.dept_name='Philosophy' OR instructor.dept_name='Music';--e

SELECT DISTINCT instructor.id, instructor.name, instructor.dept_name, instructor.salary FROM instructor,teaches WHERE instructor.id=teaches.id AND teaches.year=2018 AND teaches.id NOT IN (SELECT DISTINCT instructor.id FROM instructor,teaches WHERE instructor.id=teaches.id AND teaches.year=2017 );--f