-- 8000번 사원으로 <본인 이름>과 급여 10,000$를 저장하세요
INSERT INTO emp (empno, ename, sal)
VALUES (8000,'홍길자',10000);

SELECT * FROM emp;
--
--(#) 7788번 사원으로 <본인 이름>과 급여 10,000$을 저장하세요
INSERT INTO EMP( empno, ename, sal )
VALUES ( 7999, '홍길자', 10000 );

INSERT INTO EMP( empno, ename, sal, deptno )
VALUES ( 8001, '홍길국', 10000, 20 );

--(#) 50은 존재하지 않기 때문에 오류
INSERT INTO EMP( empno, ename, sal, deptno )
VALUES ( 8002, '홍길동', 10000, 10 );

-- 구조잡기

/*
     이름          name                   varchar2(10)
     주민등록번호   jumin                  char(15)   
     전화번호      tel                     varchar2(20) 
     성별         gender                  varchar2(10)    
     나이         age                     number(3)    
     출신지       home                     varchar2(20)
     
*/

CREATE TABLE info_tab --대소문자를 구분하지 않기 때문에 언더바 표기를 많이 사용
(
    name                   varchar2(10),
    jumin                  char(15),
    tel                     varchar2(20),
    gender                  varchar2(10),
    age                     number(3),
    home                     varchar2(20)
);

-- 테이블 구조 확인
DESC info_tab;

-- 데이터 확인
Select * FROM info_tab;

/*  테이블 명 : student_score
    학번      ID      char(4)
    학생명    name    varchar2(20)      
    국어      kor     number(3)
    영어      eng     number(3)
    총점      total   number
    평균      avg     number(5,2) -- 콤마 앞이 전체 자리수 , 뒤에 오는게 소숫점 자리 수
    
*/

CREATE TABLE student_score
(
    ID      char(4),
    name    varchar2(20),
    kor     number(3),
    eng     number(3),
    total   number,
    avg     number(5,2)
       
);

-- 테이블 구조 확인
DESC student_score;

-- 데이터 확인
Select * FROM student_score;

-- 테이블 삭제
--DROP TABLE student_score;

-- 수학 컬럼 추가
-- ALTER TABLE table_name ADD ( [ column_name data_type ] );
ALTER TABLE student_score 
    ADD ( math  number(3));

-- 총점 컬럼 및 잘못 만든 컬럼 삭제
ALTER TABLE student_score
    DROP(total);
    
-- 평균 컬럼에서 소수점 1자로 변경
ALTER TABLE student_score
    MODIFY (avg number (4,1));
    
DESC student_score;

-- 데이터 입력
-- 문자 : '' // 숫자
INSERT INTO student_score (id,name,kor,eng)
    VALUES ('0001','홍길동',80,80);
-- 데이터 확인
SELECT * FROM student_score;

-- 2000번 학번인 홍길자의 국어와 영어점수를 각각 60,90 점으로 저장
INSERT INTO student_score (id,name,kor,eng)
    VALUES ('2000','홍길자',60,90);
     
-- 데이터 확인
SELECT * FROM student_score;
    
commit;

-- rollback ; 이전 시점으로 되돌림.

-- 1000번 학생 홍길숙 정보를 저장
INSERT INTO student_score (id,name)
    VALUES ('1000','홍길숙');

-- 이름이 홍길숙인 학생의 레코드를 삭제
DELETE FROM student_score where name='홍길숙';

-- 0001번 학생의 국어점수를 100점으로 수정
UPDATE student_score SET kor=100 WHERE ID='0001';

-- 홍길자의 수학점수를 90점으로 입력 // 이미 입력받은 상태이므로 업데이트만 해주면 됨
UPDATE student_score SET math=90 WHERE name='홍길자';

-- 학생들의 평균 구하기
UPDATE student_score 
    SET avg= (kor+eng+nvl(math,0))/3;
    --WHERE : 모든 학생들의 값을 구하므로 없어도 됨, 없는 경우 모두 추가됨;


--- emp_copy table 생성    
CREATE TABLE emp_copy
    AS SELECT * FROM emp;

-- 1. 사원번호가 7788인 사원의 부서를 10번으로 변경
UPDATE emp_copy 
    SET DEPTNO = 10
    WHERE EMPNO = 7788;
    
-- 2.사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500으로 변경
UPDATE emp_copy 
    SET ENAME = '홍길숙', SAL =3500
    WHERE EMPNO = 7782;
    
-- 3. 모든 부서원의 보너스를 300씩 인상 변경
UPDATE emp_copy 
    SET COMM = nvl(COMM,0)+300;
-- 4. 사원번호가 7499인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE empno=7499;

-- 5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE HIREDATE < '1981-06-01';

DESC emp_copy;

SELECT * FROM emp_copy;
    
ROLLBACK;
COMMIT;

-- emp_copy 정보 삭제
DELETE FROM emp_copy;

TRUNCATE TABLE emp_copy;

----------------------------------------------
INSERT INTO info_tab (tel,name,jumin,gender,age,home)
VALUES ('032','홍자','801212','남자',33,'제주');

SELECT * FROM info_tab;

INSERT INTO info_tab( tel, name ) VALUES ( '1001', '홍길동' );

INSERT INTO info_tab( tel, name ) VALUES ( '1002', '김길동' );

INSERT INTO info_tab( tel, name ) VALUES ( '1002', '둘리');

INSERT INTO info_tab( name, jumin ) VALUES ( '김길동', '901212-1234567' );

INSERT INTO info_tab( gender, age ) VALUES ( '남자', 22 );

select * from info_tab;

describe info_tab;


ALTER TABLE info_tab
ADD CONSTRAINT pk_info_tel PRIMARY KEY (tel);

DELETE FROM info_tab;
commit;

DROP TABLE info_tab;

CREATE TABLE info_tab
(
    name        varchar2(10) NOT NULL,
    jumin        char(15),
    tel          varchar2(20),
    gender       varchar2(10),
    age          number(3),
    home         varchar2(20),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel)
    );
    
INSERT INTO info_tab(tel, name) VALUES('1001', '홍길동');

INSERT INTO info_tab(tel, name) VALUES('1002', '김길동');

INSERT INTO info_tab(tel, name) VALUES('1002', '둘리');

INSERT INTO info_tab(name, jumin) VALUES('김길동','901212-1234567');

INSERT INTO info_tab(Gender, AGE) VALUES('남자',22);

DROP TABLE info_tab;

CREATE TABLE info_tab
(
    name        varchar2(10),
    jumin        char(15),
    tel          varchar2(20),
    gender       varchar2(10),
    age          number(3),
    home         varchar2(20),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel)
    );
    
ALTER TABLE info_tab
    MODIFY (name varchar2(10) not null);
    
ALTER TABLE info_tab
    ADD CONSTRAINT uq_info_jumin UNIQUE (jumin);

INSERT INTO info_tab (tel, name, jumin) VALUES('20001','홍실이','990101');
INSERT INTO info_tab (tel, name, jumin) VALUES ('20002', '홍동이', '990101');
INSERT INTO info_tab (tel, name) VALUES ('20003', '홍홍이'); --? 

ALTER TABLE info_tab
    ADD CONSTRAINT ck_info_gender CHECK (gender in ('남성', '여성'));
    
INSERT INTO info_tab(tel, name, gender) VALUES('10001','홍돌이','남성');
INSERT INTO info_tab(tel, name, gender) VALUES('30001','홍숙이','남자');
INSERT INTO info_tab(tel, name, gender) VALUES('30001','홍숙이','여성');

ALTER TABLE info_tab
    MODIFY (gender varchar2(6) default '남성');
    
    -- [확인]

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('갑순이', '02-777-4444', '990909-1234567');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('갑갑이','03-555-5555', '880808-1234567', '남자', 27,'경기');

INSERT INTO info( name, tel, jumin, gender, age, home )
VALUES('홍길동','03-031-0310', '900909-1234567', '남성', 27,'경기');

INSERT INTO info( name, jumin) VALUES('홍길자', '550505-1234567');

INSERT INTO info( tel, jumin ) VALUES('031-777-7777', '700707-1234567');

INSERT INTO info( name, tel, jumin ) VALUES('갑동이', '031-000-0000', '700707-1234567');

DROP TABLE info_tab;

CREATE TABLE info_tab
(
    name        varchar2(10) NOT NULL,
    jumin        char(15),
    tel          varchar2(20),
    gender       varchar2(10),
    age          number(3),
    home         varchar2(20),
    deptno      number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender IN ('남성', '여성')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    );
    
INSERT INTO info_tab(tel, name, deptno) VALUES('7777', '맹이', 20);
INSERT INTO info_tab(tel, name, deptno) VALUES('8888', '꽁이', 22);
INSERT INTO info_tab(tel, name) VALUES('9999', '짱이');

    



