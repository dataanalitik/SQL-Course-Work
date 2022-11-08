use Kursova;
drop procedure if exists students_in_group;
drop procedure if exists students_in_year;
drop procedure if exists students_in_group_by_gender; 
drop procedure if exists students_in_year_by_gender;
drop procedure if exists students_in_group_by_birth_year; 
drop procedure if exists students_in_year_by_birth_year; 
drop procedure if exists students_in_group_by_age;
drop procedure if exists students_in_year_by_age;
drop procedure if exists students_in_group_by_children; 
drop procedure if exists students_in_year_by_children; 
drop procedure if exists students_in_year_by_scholarship; 
drop procedure if exists students_in_group_by_scholarship;
delimiter $$;
create procedure students_in_group(in g varchar(5))
begin
declare s int default 0;
select count(studname) into s from students where grupa=g; 
select studname from students where grupa=g
union select concat('Разом: ', convert(s,char)); 
end$$;

create procedure students_in_year(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(studname) into s from students where grupa in
(select groupname from groups_ where year = y and department in 
(select department from Departments where faculty_name = f));
select studname, grupa from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) 
union select concat('Разом: ', convert(s,char)), "";
end$$;

create procedure students_in_group_by_gender(in gr varchar(5), in gen varchar(1))
begin
declare s int default 0;
select count(studname) into s from students where gender = gen and grupa = gr;
select studname, grupa, gender from students where gender = gen and grupa = gr
union select concat('Разом: ', convert(s,char)), "", ""; 
end$$;

create procedure students_in_year_by_gender(in y int, in gen varchar(1), in f varchar(10)) 
begin
declare s int default 0;
select count(studname) into s from students where gender = gen and grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)); 
select studname, grupa, gender from students where gender = gen and grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) 
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure students_in_group_by_birth_year(in gr varchar(5), in b_y year) 
begin
declare s int default 0;
select count(studname) into s from students where grupa = gr and year(birthday) = b_y;
select studname, grupa, birthday from students where grupa = gr and year(birthday) = b_y
union select concat('Разом: ', convert(s,char)), "", "";
end$$;
create procedure students_in_year_by_birth_year(in y int, in b_y year, in f varchar(10)) 
begin
declare s int default 0;
select count(studname) into s from students where year(birthday) = b_y and grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)); 
select studname, grupa, birthday from students where year(birthday) = b_y and grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) 
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure students_in_group_by_age(in gr varchar(5), in a int) 
begin
declare s int default 0;
select count(studname) into s from students where grupa = gr and 
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a);
select studname, grupa, birthday from students where grupa = gr and
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a) 
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure students_in_year_by_age(in y int, in a int, in f varchar(10)) 
begin
declare s int default 0;
select count(studname) into s from students where grupa in 
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f))
and
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a);
select studname, grupa, birthday from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f))
and
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a) 
union select concat('Разом: ', convert(s,char)), "", "";
end$$;
#call students_in_year_by_children(4, 1, "ІПСА");
create procedure students_in_group_by_children(in gr varchar(5), in k int) 
begin
declare s int default 0;
select count(studname) into s from students where grupa = gr and kids = k;
select studname, grupa, kids from students where grupa = gr and kids = k
union select concat('Разом: ', convert(s,char)), "", ""; 
end$$;

create procedure students_in_year_by_children(in y int, in k int, in f varchar(10)) 
begin
declare s int default 0;
select count(studname) into s from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and kids = k;
select studname, grupa, kids from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and kids = k
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure students_in_group_by_scholarship(in gr varchar(5)) 
begin
declare s int default 0;
select count(studname) into s from students where grupa = gr and scholarship>0;
select studname, grupa, scholarship from students where grupa = gr and scholarship>0
union select concat('Разом: ', convert(s,char)), "", ""; 
end$$;

create procedure students_in_year_by_scholarship(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(studname) into s from students where grupa in 
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and scholarship>0;
select studname, grupa, scholarship from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and scholarship>0
union select concat('Разом: ', convert(s,char)), "", "";
end$$;
 
#2
drop procedure if exists teachers_by_department;
drop procedure if exists teachers_by_category;
drop procedure if exists teachers_by_department_and_gender; 
drop procedure if exists teachers_by_category_and_gender;
drop procedure if exists teachers_by_department_and_birth_year; 
drop procedure if exists teachers_by_category_and_birth_year; 
drop procedure if exists teachers_by_department_and_age;
drop procedure if exists teachers_by_category_and_age;
drop procedure if exists teachers_by_department_and_children; 
drop procedure if exists teachers_by_category_and_children; 
drop procedure if exists teachers_by_department_and_salary; 
drop procedure if exists teachers_by_category_and_salary;
drop procedure if exists teachers_by_department_aspirants;
drop procedure if exists teachers_by_department_with_thesis;
drop procedure if exists teachers_by_department_with_doctoral_thesis;
delimiter $$;
create procedure teachers_by_department(in d varchar(45))
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d;
select teach_PIB, dep from teachers where dep = d
union select concat('Разом: ', convert(s,char)), ""; 
end$$;

create procedure teachers_by_category(in c varchar(45), in d varchar(45)) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where category = c and dep = d;
select teach_PIB, dep, category from teachers where category = c and dep = d
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure teachers_by_department_and_gender(in d varchar(45), in g varchar(1)) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and gender = g;
select teach_PIB, dep, gender from teachers where dep = d and gender = g
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure teachers_by_category_and_gender(in c varchar(45), in g varchar(1), in d varchar(45))
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where category = c and gender = g and dep = d;
select teach_PIB, dep, category, gender from teachers where category = c and gender = g and dep = d 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_and_birth_year(in d varchar(45), in b_y year) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and year(birthday) = b_y;
select teach_PIB, dep, birthday from teachers 
where dep = d and year(birthday) = b_y
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure teachers_by_category_and_birth_year(in c varchar(45), in b_y year, in d varchar(45))
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where category = c and year(birthday) = b_y and dep = d;
select teach_PIB, dep, category, birthday from teachers where category = c and year(birthday) = b_y and dep = d 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_and_age(in d varchar(45), in a int) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a);
select teach_PIB, dep, category, birthday from teachers where dep = d and
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a)
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure teachers_by_category_and_age(in c varchar(45), in a int, in d varchar(45)) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where category = c and dep = d and 
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a);
select teach_PIB, dep, birthday from teachers where category = c and dep = d and 
(year(current_date)-year(birthday)-(right(current_date,5)<right(birthday,5)) = a) 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_and_children(in d varchar(45), in k int) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and kids = k;
select teach_PIB, dep, kids from teachers where dep = d and kids = k
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure teachers_by_category_and_children(in c varchar(45), in k int, in d varchar(45))
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where category = c and dep = d and children = k;
select teach_PIB, dept, category, kids from teachers where Category = c and dep = d and children = k 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_and_salary(in d varchar(45), in sal decimal(10,2)) begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and salary=sal;
select teach_PIB, dep, salary from teachers where dep = d and salary=sal
union select concat('Разом: ', convert(s,char)), "", "";
end$$;

create procedure teachers_by_category_and_salary(in c varchar(45), in sal decimal(10,2), in d varchar(45))
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where category = c and dep = d and salary=sal;
select teach_PIB, dep, category, salary from teachers where category = c and dep = d and salary=sal 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_aspirants(in d varchar(45)) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and topic_name is null and doct_topic_name is null;
select teach_PIB, dep, topic_name, doct_topic_name from teachers where dep = d and topic_name is null 
and doct_topic_name is null 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_with_thesis(in d varchar(45)) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and topic_name is not null;
select teach_PIB, dep, topic_name, doct_topic_name from teachers where dep = d and topic_name is not null
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$;

create procedure teachers_by_department_with_doctoral_thesis(in d varchar(45)) 
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep = d and topic_name is not null and doct_topic_name is not null;
select teach_PIB, dep, topic_name, doct_topic_name from teachers where dep = d
and topic_name is not null and doct_topic_name is not null 
union select concat('Разом: ', convert(s,char)), "", "", "";
end$$; 

#3
drop procedure if exists faculties_with_thesis;
drop procedure if exists faculties_with_doctoral_thesis;
delimiter $$;
create procedure faculties_with_thesis(in f varchar(45))
begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep in
(select department from departments where faculty_name = f) and topic_name is not null;
select teach_PIB, topic_name from teachers where dep in
(select department from departments where faculty_name = f) and topic_name is not null
union select "", concat('Разом: ', convert(s,char));
end$$;

create procedure faculties_with_doctoral_thesis(in f varchar(45)) begin
declare s int default 0;
select count(teach_PIB) into s from teachers where dep in
(select department from departments where faculty_name = f) and doct_topic_name is not null;
select teach_PIB, doct_topic_name from teachers where dep in
(select department from departments where faculty_name = f) and doct_topic_name is not null
union select "", concat('Разом: ', convert(s,char));
end$$; 

# 4.
drop procedure if exists departments_in_group; 
drop procedure if exists departments_in_year;
delimiter $$;
create procedure departments_in_group(in g varchar(5))
begin
declare s int default 0;
select count(distinct teachers.dep) into s from teachers, schedule_ where groups_group=g 
and teachers.teach_PIB = schedule_.teacher_name;
select teachers.dep from teachers, schedule_ where groups_group=g 
and teachers.teach_PIB = schedule_.teacher_name group by teachers.dep
union select concat('Разом: ', convert(s,char));
end$$;

create procedure departments_in_year(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(distinct teachers.dep) into s from teachers, schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f))
and teachers.teach_PIB = schedule_.teacher_name;
select teachers.dep from teachers, schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) 
and teachers.teach_PIB = schedule_.teacher_name group by teachers.dep
union select concat('Разом: ', convert(s,char));
end$$; 

# 5.
drop procedure if exists teachers_in_group; 
drop procedure if exists teachers_in_year;
delimiter $$;
create procedure teachers_in_group(in g varchar(5), in sub varchar(150))
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_ where groups_group = g and study_plan_subject = sub;
select teacher_name from schedule_ where groups_group = g and study_plan_subject = sub 
union select concat('Разом: ', convert(s,char));
end$$;

create procedure teachers_in_year(in y int, in f varchar(10) , in sub varchar(150)) 
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_
where study_plan_subject = sub and groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f));
select teacher_name from schedule_ where study_plan_subject = sub and groups_group in 
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) 
union select concat('Разом: ', convert(s,char));
end$$; 

#6
drop procedure if exists teachers_lectures_in_groups;
drop procedure if exists teachers_lectures_in_year;
drop procedure if exists teachers_practice_in_groups;
drop procedure if exists teachers_practice_in_year;
drop procedure if exists teachers_otherlessontype_in_groups; 
drop procedure if exists teachers_otherlessontype_in_year;
delimiter $$;
create procedure teachers_lectures_in_groups(in g varchar(5))
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_ where groups_group = g and lesson_type = "лекція";
select teacher_name, study_plan_subject from schedule_ where groups_group = g and lesson_type = "лекція" 
union select concat('Разом: ', convert(s,char)), "";
end$$;

create procedure teachers_lectures_in_year(in y int, in f varchar(10))
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and lesson_type = "лекція";
select teacher_name, study_plan_subject from schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and lesson_type = "лекція"
union select concat('Разом: ', convert(s,char)), ""; 
end$$;

create procedure teachers_practice_in_groups(in g varchar(5)) 
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_ where groups_group = g and lesson_type = "практика";
select teacher_name, study_plan_subject from schedule_ where groups_group = g and lesson_type = "практика" 
union select concat('Разом: ', convert(s,char)), "";
end$$;

create procedure teachers_practice_in_year(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and lesson_type = "практика";
select teacher_name, study_plan_subject from schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and lesson_type = "практика"
union select concat('Разом: ', convert(s,char)), ""; 
end$$;

create procedure teachers_otherlessontype_in_groups(in g varchar(5)) 
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_
where groups_group = g and lesson_type != "практика" and lesson_type != "лекція";
select teacher_name, study_plan_subject from schedule_ 
where groups_group = g and lesson_type != "практика" and lesson_type != "лекція"
union select concat('Разом: ', convert(s,char)), "";
end$$;

create procedure teachers_otherlessontype_in_year(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(distinct teacher_name) into s from schedule_ where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and lesson_type != "практика" and lesson_type != "лекція";
select teacher_name, study_plan_subject from schedule_
where groups_group in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)) and lesson_type != "практика" and lesson_type != "лекція"
union select concat('Разом: ', convert(s,char)), ""; 
end$$;

# 7. 
drop procedure if exists group_result_subject;
delimiter $$;
create procedure group_result_subject(in g varchar(5), in sub varchar(150), in gr int)
begin
declare s int default 0;
select count(student_name) into s from semester_grades
where student_name in (select studname from students where grupa = g) and study_plan_subject = sub and grade=gr;
select student_name, grade from semester_grade
where student_name in (select studname from students where grupa = g) and study_plan_subject = sub and grade=gr
union select concat('Разом: ', convert(s,char)), "";
end$$; 

# 8.
drop procedure if exists exams_in_group_all_5; 
drop procedure if exists exams_in_group_5_and_4; 
drop procedure if exists exams_in_group_5_4_3; 
drop procedure if exists exams_in_year_all_5; 
drop procedure if exists exams_in_year_5_and_4; 
drop procedure if exists exams_in_year_5_4_3;
delimiter $$;
create procedure exams_in_group_all_5(in g varchar(5))
begin
declare s int default 0;
select count(student_name) into s
from (select student_name, min(grade) as m from semester_grades
group by student_name having m >= 95) as temp2
where student_name in (select studname from students where grupa = g);
select student_name from (
select student_name, min(grade) as m from semester_grades
group by student_name having m >= 95) as temp2
where student_name in
(select studname from students where grupa = g) 
union select concat('Разом: ', convert(s,char));
end $$;

create procedure exams_in_group_5_and_4(in g varchar(5)) 
begin
declare s int default 0;
select count(student_name) into s 
from (select student_name, min(grade) as m from semester_grades group by student_name having m >= 76) as temp2
where student_name in
(select studname from students where grupa = g);
select student_name from (
select student_name, min(grade) as m from semester_grades group by student_name having m >= 76) as temp2
where student_name in (select studname from students where grupa = g) 
union select concat('Разом: ', convert(s,char));
end$$;

create procedure exams_in_group_5_4_3(in g varchar(5)) 
begin
declare s int default 0;
select count(student_name) into s from (
select student_name, min(grade) as m from semester_grades group by student_name having m >= 60) as temp2
where student_name in
(select studname from students where grupa = g);
select student_name from (
select student_name, min(grade) as m from semester_grades  group by student_name having m >= 60) as temp2
where student_name in
(select studname from students where grupa = g) 
union select concat('Разом: ', convert(s,char));
end$$;

create procedure exams_in_year_all_5(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(student_name) into s from (
select student_name, min(grade) as m from semester_grades 
group by student_name having m >= 95) as temp2
where student_name in
(select studname from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f))
);
select student_name from (
select student_name, min(grade) as m from semester_grades 
group by student_name having m >= 95) as temp2
where student_name in
(select studname from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)))
union select concat('Разом: ', convert(s,char));
end $$;

create procedure exams_in_year_5_and_4(in y int, in f varchar(10)) 
begin
declare s int default 0;
select count(student_name) into s from (
select student_name, min(grade) as m from semester_grades group by student_name having m >= 76) as temp2
where student_name in (select studname from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f))
);
select student_name from (
select student_name, min(Grade) as m from semester_grades
group by student_name having m >= 76) as temp2
where student_name in
(select studname from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)))
union select concat('Разом: ', convert(s,char));
end $$;

create procedure exams_in_year_5_4_3(in y int, in f varchar(10)) begin
declare s int default 0;
select count(student_name) into s from
(select student_name, min(Grade) as m from semester_grades
group by student_name having m >= 60) as temp2
where student_name in
(select studname from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f))
);
select student_name from (
select student_name, min(Grade) as m from semester_grades
group by student_name having m >= 60) as temp2
where student_name in
(select studname from students where grupa in
(select groupname from groups_ where year = y and department in
(select department from departments where faculty_name = f)))
union select concat('Разом: ', convert(s,char));
end $$;

#9
call teachers_exams_in_group("КА-71");
call teachers_exams_by_subject("Організація баз даних та знань");
drop procedure if exists teachers_exams_in_group; 
drop procedure if exists teachers_exams_by_subject;
delimiter $$;
create procedure teachers_exams_in_group(in g varchar(5))
begin
select teacher_name, study_plan_subject from schedule_
where study_plan_subject in (select subj_name from study_plan where exam = 1)
and lesson_type = "лекція" and groups_group = g
group by teacher_name;
end$$;

create procedure teachers_exams_by_subject(in s varchar(150)) 
begin
select groups_group, teacher_name from schedule_ where study_plan_subject = s 
and lesson_type = "лекція"
group by Groups_group; 
end$$;

# 10
call students_result("КА-71", "Мухін В.Є.", 100); 
drop procedure if exists students_result;
delimiter $$;
create procedure students_result(in g varchar(5), in t varchar(100), in gr int)
begin
select student_name from semester_grades where student_name in (select studname from students where grupa = g) 
and study_plan_subject in (select study_plan_subject from schedule_ where groups_Group = g and teach_name = t) 
and grade = gr;
end$$; 

# 11
call diplomas_by_department("ММСА"); 
call diplomas_by_teacher("Яковлева А.П.");
drop procedure if exists diplomas_by_department; 
drop procedure if exists diplomas_by_teacher;
delimiter $$;
create procedure diplomas_by_department(in d varchar(45))
begin
select * from diplomas where stud_name in
(select studname from students where grupa in
(select groupname from groups_ where department = d)); 
end$$;

create procedure diplomas_by_teacher(in t varchar(100)) 
begin
select stud_name, diploma_name from diplomas where teach_name = t;
end$$;

# 12.
call diplomas_by_teachers_department("ММСА");
call diplomas_by_teachers_faculty("ІПСА");
call diplomas_by_teachers_department_and_category("ММСА", "доцент"); 
call diplomas_by_teachers_faculty_and_category("ІПСА", "доцент");
drop procedure if exists diplomas_by_teachers_department;
drop procedure if exists diplomas_by_teachers_faculty;
drop procedure if exists diplomas_by_teachers_department_and_category; 
drop procedure if exists diplomas_by_teachers_faculty_and_category;
delimiter $$;
create procedure diplomas_by_teachers_department(in d varchar(45))
begin
select * from diplomas where teach_name in
(select teach_PIB from teachers where dep = d); 
end $$;

create procedure diplomas_by_teachers_faculty(in f varchar(10)) 
begin
select * from diplomas where teach_name in
(select teach_PIB from teachers where dep in (select department from departments where faculty_name = f));
end $$;

create procedure diplomas_by_teachers_department_and_category(in d varchar(45), in c varchar(45))
begin
select * from diplomas where teach_name in
(select teach_PIB from teachers where dep = d and category = c); 
end $$;

create procedure diplomas_by_teachers_faculty_and_category(in f varchar(10), in c varchar(45))
begin
select * from diplomas where teach_name in
(select teach_PIB from teachers where dep in
(select department from departments where faculty_name = f) and category = c); 
end $$;

# 13
drop procedure if exists teacher_study_plan; 
drop procedure if exists teachers_study_plan;
delimiter $$;
create procedure teacher_study_plan(in t varchar(100))
begin
declare lec,pr int default 0;
select count(*)*18 into lec from(select * from schedule_ group by num_of_pair, day_of_week, teacher_name) as temp2
where teacher_name = t and lesson_type = "лекція";
select count(*)*18 into pr from(select * from schedule_ group by num_of_pair, day_of_week, teacher_name) as temp3
where teacher_name = t and lesson_type = "практика";
select study_plan_subject, lesson_type, count(*)*18 as Hours 
from (select teacher_name, lesson_type, study_plan_subject from schedule_ 
group by num_of_pair, day_of_week, teacher_name) as temp4
where teacher_name = t group by teacher_name, lesson_type, study_plan_subject
union select "", "", concat('Лекцій: ', convert(lec,char), ', Практик: ', convert(pr,char))
union select "", "", concat('Всього: ', convert(lec+pr,char)); 
end$$;

create procedure teachers_study_plan(in d varchar(100)) 
begin
declare lec,pr int default 0; 
select count(*)*18 into lec from(select * from schedule_ group by num_of_pair, day_of_week, teacher_name) as temp2
where teacher_name in (select teach_PIB from teachers where dep = d) and lesson_type = "лекція";
select count(*)*18 into pr from(select * from schedule_ group by num_of_pair, day_of_week, teacher_name) as temp3
where teacher_name in (select teach_PIB from teachers where dep = d) and lesson_type = "практика";
select teacher_name, study_plan_subject, lesson_type, count(*)*18 as Hours 
from (select teacher_name, lesson_type, study_plan_subject from schedule_ 
group by num_of_pair, day_of_week, teacher_name) as temp4
where teacher_name in (select teach_PIB from teachers where dep = d)
group by teacher_name, lesson_type, study_plan_subject
union select "", "", "", concat('Лекцій: ', convert(lec,char), ', Практик: ', convert(pr,char))
union select "", "", "", concat('Всього: ', convert(lec+pr,char)); 
end$$;
