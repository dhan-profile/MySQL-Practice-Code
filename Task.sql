use library;
create table Scholarship_Table(STUDENT_REF_ID int primary key, SCHOLARSHIP_AMOUNT int, SCHOLARSHIP_DATE datetime);
create table Student_Table(STUDENT_ID int, foreign key(STUDENT_ID) references Scholarship_Table(STUDENT_REF_ID), FIRST_NAME varchar(30), LAST_NAME varchar(30), GPA double, ENROLLMENT_DATE datetime, MAJOR varchar(30));
create table Program_Table(STUDENT_REF_ID int, PROGRAM_NAME varchar(30), PROGRAM_START_DATE datetime);

insert into 


drop table Scholarship_Table;
drop table Student_Table;
drop table Program_Table;
