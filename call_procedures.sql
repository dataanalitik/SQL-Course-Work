use Kursova;
call students_in_group("КА-91");
call students_in_year(4, "ІПСА");
call students_in_group_by_gender("КА-91", "Ж");
call students_in_year_by_gender(4, "Ж", "ІПСА");
call students_in_group_by_birth_year("КА-91", 2001); 
call students_in_year_by_birth_year(3, 2001, "ІПСА"); 
call students_in_group_by_age("КА-91", 19);
call students_in_year_by_age(4, 21, "ІПСА");
call students_in_group_by_children("КА-92", 0);
call students_in_year_by_children(4, 1, "ІПСА");
call students_in_group_by_scholarship("КА-92");
call students_in_year_by_scholarship(4, "ІПСА");

call teachers_by_department("ММСА");
call teachers_by_category("доцент", "ММСА");
call teachers_by_department_and_gender("ММСА", "Ж");
call teachers_by_category_and_gender("асистент", "Ч", "ММСА"); 
call teachers_by_department_and_birth_year("ММСА", 1999);
call teachers_by_category_and_birth_year("доцент", 1999, "ММСА"); 
call teachers_by_department_and_age("ММСА", 20);
call teachers_by_category_and_age("доцент", 20, "ММСА");
call teachers_by_department_and_children("ММСА", 0);
call teachers_by_category_and_children("доцент", 1, "ММСА");
call teachers_by_department_and_salary("ММСА", 20000);
call teachers_by_category_and_salary("доцент", 20000, "ММСА"); 
call teachers_by_department_aspirants("ММСА");
call teachers_by_department_with_thesis("ММСА");
call teachers_by_department_with_doctoral_thesis("ММСА");

call faculties_with_thesis("ІПСА");
call faculties_with_doctoral_thesis("ІПСА");

call departments_in_group("КА-92"); 
call departments_in_year(3, "ІПСА");

call teachers_in_group("КА-92", "Комп'ютерні мережі");
call teachers_in_year(3, "ІПСА", "Комп'ютерні мережі");

call teachers_lectures_in_groups("КА-92");
call teachers_lectures_in_year(3, "ІПСА");
call teachers_practice_in_groups("КА-91");
call teachers_practice_in_year(3, "ІПСА");
call teachers_otherlessontype_in_groups("КА-91"); 
call teachers_otherlessontype_in_year(3, "ІПСА");

call group_result_subject("КА-91", "Організація баз даних та знань", 100);

call exams_in_group_all_5("КА-91"); 
call exams_in_group_5_and_4("КА-91"); 
call exams_in_group_5_4_3("КА-91"); 
call exams_in_year_all_5(3, "ІПСА"); 
call exams_in_year_5_and_4(3, "ІПСА"); 
call exams_in_year_5_4_3(3, "ІПСА");

call teachers_exams_in_group("КА-91");
call teachers_exams_by_subject("Організація баз даних та знань");

call students_result("КА-91", "Мухін В.Є.", 100); 

call diplomas_by_department("ММСА"); 
call diplomas_by_teacher("Яковлева А.П.");

call diplomas_by_teachers_department("ММСА");
call diplomas_by_teachers_faculty("ІПСА");
call diplomas_by_teachers_department_and_category("ММСА", "доцент"); 
call diplomas_by_teachers_faculty_and_category("ІПСА", "доцент");

call teacher_study_plan("Ільенко А.Б."); 
call teachers_study_plan("ММСА");