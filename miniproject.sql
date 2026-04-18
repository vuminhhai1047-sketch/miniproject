
CREATE database miniproject;
USE miniproject;


CREATE table student (
	student_id char(5) primary key,
    student_name varchar(100) NOT NULL,
    student_date date,
    student_email varchar(100) UNIQUE NOT NULL
);

CREATE table instructor (
	teacher_id char(5) primary key,
    teacher_name varchar(100) NOT NULL,
    teacher_email varchar(100) UNIQUE NOT NULL
);

CREATE table course (
	course_id char(5) primary key,
    course_name varchar(100) NOT NULL UNIQUE,
    course_title varchar(200),
    course_lesson int check (course_lesson > 0 ),
    teacher_id char(5) NOT NULL,
    foreign key (teacher_id) references instructor(teacher_id)
);

CREATE table enrollment (
	student_id char(5) NOT NULL,
    course_id char(5) NOT NULL,
    enrollment_date date default(current_date()),
    UNIQUE (student_id , course_id),
    foreign key (course_id) references course(course_id),
    foreign key (student_id) references student(student_id)
);

CREATE table result (
	midterm_score float NOT NULL check(midterm_score > 0 and midterm_score < 10),
	final_score float NOT NULL check(final_score > 0 and final_score < 10),
	student_id char(5) NOT NULL,
    course_id char(5) NOT NULL,
    UNIQUE (student_id , course_id),
    foreign key (course_id) references course(course_id),
    foreign key (student_id) references student(student_id)
);


INSERT INTO student(student_id , student_name , student_date , student_email) 
Values 
('P01', 'Nguyen Van A', '2003-05-12', 'a@gmail.com'),
('P02', 'Tran Thi B', '2002-11-20', 'b@gmail.com'),
('P03', 'Le Van C', '2004-01-15', 'c@gmail.com'),
('P04', 'Pham Thi D', '2003-07-08', 'd@gmail.com'),
('P05', 'Hoang Van E', '2002-09-25', 'e@gmail.com');


INSERT INTO instructor (teacher_id, teacher_name, teacher_email)
VALUES
('T001', 'Nguyen Van An', 'an.nguyen@uni.edu.vn'),
('T002', 'Tran Thi Bich', 'bich.tran@uni.edu.vn'),
('T003', 'Le Minh Duc', 'duc.le@uni.edu.vn'),
('T004', 'Pham Thu Ha', 'ha.pham@uni.edu.vn'),
('T005', 'Hoang Quang Huy', 'huy.hoang@uni.edu.vn');


INSERT INTO course (course_id, course_name, course_title, course_lesson, teacher_id)
VALUES
('C001', 'SQL Basics', 'Introduction to SQL and Database', 20, 'T001'),
('C002', 'Web Development', 'HTML, CSS, JavaScript Fundamentals', 30, 'T002'),
('C003', 'Data Analysis', 'Data Analysis with SQL and Excel', 25, 'T003'),
('C004', 'Backend Development', 'API Development with Node.js', 35, 'T004'),
('C005', 'Database Design', 'Designing Efficient Database Systems', 28, 'T001');


INSERT INTO enrollment (student_id, course_id, enrollment_date)
VALUES
('P01', 'C001', '2024-01-10'),
('P01', 'C002', '2024-01-12'),
('P02', 'C001', '2024-01-11'),
('P02', 'C003', '2024-01-15'),
('P03', 'C002', '2024-01-13'),
('P03', 'C004', '2024-01-18'),
('P04', 'C003', '2024-01-20'),
('P04', 'C005', '2024-01-22'),
('P05', 'C001', '2024-01-25'),
('P05', 'C004', '2024-01-27');


INSERT INTO result (midterm_score, final_score, student_id, course_id)
VALUES
(7.5, 8.0, 'P01', 'C001'),
(6.8, 7.2, 'P01', 'C002'),
(8.0, 8.5, 'P02', 'C001'),
(7.0, 7.8, 'P02', 'C003'),
(6.5, 7.0, 'P03', 'C002'),
(7.8, 8.2, 'P03', 'C004'),
(8.5, 9.0, 'P04', 'C003'),
(7.2, 7.9, 'P04', 'C005'),
(6.9, 7.5, 'P05', 'C001'),
(7.6, 8.1, 'P05', 'C004');


UPDATE student
set student_email = 'g@gmail.com'
where student_id = 'P01';

UPDATE course
set course_title = 'HEHE'
where course_id = 'C001';

UPDATE result
set final_score = 10
where student_id = 'P01';


DELETE from enrollment
where course_id = 'C002';


DELETE from result
where course_id = 'C002';


SELECT student_id , student_name , student_date , student_email
from student;

SELECT teacher_id, teacher_name, teacher_email
from instructor;

SELECT course_id, course_name, course_title, course_lesson, teacher_id
from course;

SELECT student_id, course_id, enrollment_date
from enrollment;

SELECT midterm_score, final_score, student_id, course_id
from result;



