-- * 뷰에 데이터의 입력, 변경, 삭제 가능하지만 제약조건 설정이 테이블처럼 가능하진 않음
CREATE OR REPLACE VIEW v_emp AS
        select empno, ename, deptno from emp;
        
SELECT * FROM v_emp;
DESC v_emp;

INSERT INTO v_emp VALUES (1000, '홍길동', 20);
SELECT * FROM v_emp;
-- VIEW에서 데이터 조작어를 사용하면 원본 테이블에도 영향을 준다
SELECT * FROM emp;

-- VIEW는 원본 테이블에 영향을 주기 때문에 원본 테이블의 제약조건을 따른다
INSERT INTO v_emp VALUES (1000, '홍홍이', 20);
INSERT INTO v_emp VALUES (2000, '홍홍이', 90);

CREATE OR REPLACE VIEW v_emp AS
        select empno, ename, deptno from emp
        WITH READ ONLY;
        
-- [ 연습 ] EMP 테이블에서 30번 부서만 
-- EMPNO를 EMP_NO로 ENAME을 NAME로 SAL를 SALARY로 바꿔서 
-- EMP_30 뷰를 생성하시오
-- 열의 이름을 변경하려면 별칭 사용
CREATE OR REPLACE VIEW V_EMP_30 AS
        SELECT empno AS emp_no, ename AS name, sal AS salary FROM emp WHERE deptno = 30
WITH read only;
-- OR REPLACE 지워도 됩니다

SELECT * FROM v_EMP_30;

-- 복합뷰
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

SELECT * FROM v_emp_info;

-- 복합뷰의 경우 양쪽 테이블의 데이터를 동시에 입력은 불가능
INSERT INTO v_emp_info (empno, ename, dname) VALUES (3333, '맹꽁이', 30);

-- 그러나 복합뷰에서 한쪽 테이블의 데이터를 입력하는 것은 가능
INSERT INTO v_emp_info (empno, ename) VALUES (3333, '맹꽁이');

-- 뷰에서 데이터를 삭제하면 원본 테이블의 데이터도 함께 삭제된다 (*) 읽기 전용으로 만들어야 하는 이유
DELETE FROM v_emp_info where empno = 7788;

-- [ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하라
CREATE OR REPLACE VIEW V_DEPT_SUM AS
        SELECT  d.dname 부서명, MIN(e.SAL) "최소 급여", MAX(e.SAL) "최대 급여", TRUNC(AVG(e.SAL)) "평균 급여"
                FROM    dept d, emp e
                WHERE   d.deptno = e.deptno(+)
                GROUP BY d.dname;

SELECT * FROM V_emp_info;

-- 원본 테이블에 값을 입력하면 뷰의 값도 수정되어 적용
INSERT INTO emp (empno, ename, sal, deptno)
VALUES (1818, '정지원', 9999, 20);

-- 시퀀스(SEQUENCE): 자동 증가 수
CREATE SEQUENCE seq_temp;
SELECT seq_temp.NEXTVAL FROM dual;
SELECT seq_temp.CURRVAL FROM dual;

-- 5000번부터 시작해서 10개씩 증가하는 자동 증가 수(시퀀스)
CREATE SEQUENCE seq_5000
    -- MINVALUE(최소 숫자): 시작은 5000부터 하지만 최대 숫자에 도달하면 0부터 시작할 수가 있기 때문에 최소 숫자를 지정하는 것
    INCREMENT BY 10
    START WITH 5000;
    
INSERT INTO emp (empno, ename) VALUES (seq_5000.NEXTVAL, '박씨');
SELECT * FROM emp;

-- 인덱스(INDEX): 빠른 검색을 위해
select empno, ename, job, rowid from emp;

SELECT index_name, index_type, uniqueness
FROM user_indexes
WHERE table_name='EMPLOYEES';

CREATE INDEX idx_emp_salary ON employees (salary);

SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE salary=3000;

SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE employee_id = 8000;