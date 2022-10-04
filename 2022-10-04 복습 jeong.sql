CREATE TABLE student
(
no CHAR(4),
name varchar2(30) not null,
gender varchar2(10),
addr varchar2(30),
jumin CHAR(15) not null,
deptno number(2),
CONSTRAINT fk_student_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);

CREATE TABLE dept
AS SELECT * 
FROM scott.dept;

desc dept;

select *
from dept;

alter table dept
add CONSTRAINT pk_dept_deptno PRIMARY KEY (DEPTNO);

drop table student;

CREATE TABLE student
(
no number(4),
name varchar2(30) not null,
gender varchar2(10),
addr varchar2(30),
jumin varchar2(30) not null,
deptno number(2),
CONSTRAINT fk_student_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);


-- 2번 기본키 조건 추카
alter table student
add CONSTRAINT pk_student_no PRIMARY KEY (no);


-- 3번
alter table student
modify jumin null ;

-- 4번
alter table student
MODIFY addr default '서울';

-- 5번
alter table student
modify( check (gender in ('남성','여성')));

--[ 확인 ] 레코드 입력시 확인

INSERT INTO student(no, name, gender, addr, jumin )

VALUES('1111', '김태희', '여성', '서울시 강남구', '801212-1234567' );
-- 정상 실행

INSERT INTO student(no, name, jumin )

VALUES('2222', '송혜교', '881212-1234567');
-- 정상 실행

INSERT INTO student(no, name, jumin )

VALUES('1111', '강동원', '881212-1234567');
-- 기본키인 no 데이터에 1111이 있어서 오류남


INSERT INTO student(no, name, gender, jumin )

VALUES('3333', '하정우', '남자', '830303-1234567');
-- 제약조건이 남성, 여성 인데 남자<라서 오류


INSERT INTO student(no, name, addr, jumin )

VALUES('4444', '김새론', '서울시 서초구', '990909-1234567');
-- 정상 실행

INSERT INTO student(no, name, addr, deptno )

VALUES('8888', '이병헌','서울시 한강', 50);
-- 외래키인 deptno에 50이 없음


--6번
create table library
(
rent_id number(2),
book_id varchar(10) not null,
hakbun number(4),
CONSTRAINT pk_library_rent_id PRIMARY Key (rent_id),
CONSTRAINT fk_library_no FOREIGN KEY (hakbun) REFERENCES student (no)
);

--확인
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' );
-- 오류 : student 의 no에 3333이 없음

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );
-- 오류 : student 의 no에 5555가 없음