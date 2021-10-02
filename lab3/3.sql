SELECT DISTINCT student.id,student.name,student.dept_name,student.tot_cred FROM student,takes,course WHERE student.id=takes.id AND takes.course_id=course.course_id AND course.dept_name='Comp. Sci.' AND (takes.grade='A' OR takes.grade='A-') GROUP BY (student.id,student.name,student.dept_name,student.tot_cred) ORDER BY student.name;--a

SELECT * FROM instructor WHERE instructor.id IN(SELECT advisor.i_id FROM advisor,student,takes WHERE advisor.s_id=student.id AND takes.id=student.id AND (takes.grade!='A' AND takes.grade!='A-' AND takes.grade!='B+' AND takes.grade!='B' OR takes.grade IS NULL));--b

SELECT DISTINCT * FROM department WHERE department.dept_name NOT IN (SELECT DISTINCT department.dept_name FROM department,student,takes WHERE department.dept_name=student.dept_name AND student.id=takes.id AND (takes.grade='F' OR takes.grade='C'));--c

SELECT DISTINCT * FROM instructor WHERE instructor.id NOT IN (SELECT DISTINCT instructor.id FROM instructor,teaches,takes WHERE instructor.id=teaches.id AND teaches.course_id=takes.course_id AND takes.grade='A');--d

SELECT DISTINCT course.course_id,course.title,course.dept_name, course.credits FROM course,section,time_slot WHERE section.time_slot_id=time_slot.time_slot_id AND end_hr<=13 AND section.course_id=course.course_id;--e
