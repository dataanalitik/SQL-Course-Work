use Kursova;
create table students (
studname varchar(50) not null,
grupa varchar(50) not null,
gender varchar(1) not null,
birthday date not null,
kids int not null,
scholarship decimal(6,2) not null,
primary key (stud_PIB)
); 

create table teachers (
teach_PIB varchar(50) not null,
dep varchar(50) not null,
category varchar(50) not null,
topic_name varchar(50) not null,
doct_topic_name varchar(50) not null,
gender varchar(1) not null,
birthday date not null,
kids int not null,
salary decimal(7,2) not null,
primary key (teach_PIB)
); 

create table groups_ (
department varchar(50) not null,
groupname varchar(5) not null,
year int not null,
primary key (groupname)
);

create table diplomas (
stud_name varchar(50) not null,
teach_name varchar(50) not null,
diploma_name varchar(50) not null,
primary key (diploma_name)
); 

create table departments (
faculty_name varchar(5) not null,
department varchar(50) not null,
primary key (department)
);

create table semester_grades (
student_name varchar(50) not null,
study_plan_subject varchar(50) not null,
grade int not null default 0
); 

create table schedule_ (
groups_group varchar(5) not null,
teacher_name varchar(50) not null,
lesson_type varchar(50) not null,
num_of_pairs int not null,
day_of_week varchar(50) not null,
study_plan_subject varchar(50) not null
); 

create table study_plan (
subj_name varchar(50) not null,
lect_hours int not null,
pract_hours int not null,
seminar_hours int not null,
n_labs int not null default 0,
course_work int not null default 0,
exam int not null default 0, 
primary key (subj_name)
); 