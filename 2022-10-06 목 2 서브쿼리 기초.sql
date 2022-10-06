SELECT round(avg(sal)) FROM emp;

SELECT ename, sal
FROM emp
WHERE sal < (SELECT round(avg(sal)) FROM emp);


---------- [서브쿼리 사용 시] ----------
-- 서브쿼리는 ( ) 로 묶는다 [권장]
-- 서브쿼리는 연산자의 오른쪽에 [권장]
-- 단일 행인 경우 비교 연산자 가능 ( >, >=, <, <=, =, !=(<>) )
-- 복수 행인 경우 IN, NOT IN, ANY, ALL, EXISTS
-- ORDER BY에선 사용 못한다

-- [ 단일 행인 경우 ] ( >, >=, <, <=, =, !=(<>) )
-- 월급이 가장 많은 사원의 정보 조회
SELECT *
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);

-- 평균 급여보다 높고 최대 급여보다 낮은 월급을 받는 사원의 정보를 조회
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
      AND sal < (SELECT MAX(sal) FROM emp);

-- 월급순으로 상위 10명의 명단을 출력
SELECT *
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum <= 10;


-- [ 다중 행인 경우 ] IN, NOT IN, ANY, ALL, EXISTS
-- IN: 반환된 목록의 각각과 비교
-- ANY: 비교연산자( >, >=, <, <=, =, !=(<>) ) 와 반환된 목록의 각각과 비교
-- ALL: 비교연산자( >, >=, <, <=, =, !=(<>) ) 와 반환된 모든 목록과 비교
-- EXISTS: 적어도 한 개의 행을 리턴하면 true, 그렇지 않으면 false

-- 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
SELECT empno, ename, job, sal
FROM emp
WHERE (job, sal) in (SELECT job, MIN(sal) FROM emp GROUP BY job);

-- 10번 부서 사원들의 업무와 동일한 직원들 검색
SELECT *
FROM emp
WHERE job in (SELECT job FROM emp WHERE deptno = 10);

SELECT *
FROM emp
WHERE job = any( select job from emp where deptno = 10);

-- 적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
SELECT empno, ename, job
FROM emp
WHERE ename IN (SELECT e2.ename AS 매니저명 FROM emp e1 LEFT OUTER JOIN emp e2 ON e1.mgr=e2.empno);

SELECT empno, ename, job
FROM emp e1
WHERE exists (SELECT * FROM emp e2 WHERE e1.empno = e2.mgr);

------------------------------------------------------------
-- INSERT / UPDATE / DELETE 안에서 서브쿼리 사용
-- (1) 부서별 급여 통계 테이블 생성
CREATE TABLE stat_salary (
    stat_date  date not null,
    dept_no     number,
    emp_count   number,
    tot_salary  number,
    avg_salary  number
);

DESC stat_salary;

-- (2) 날짜와 부서 번호 입력
SELECT sysdate, deptno FROM emp GROUP BY deptno;

INSERT INTO stat_salary (stat_date, dept_no)
    SELECT sysdate, deptno FROM emp GROUP BY deptno;

SELECT * FROM stat_salary;

-- (3) 사원 수, 급여 총액, 평균 급여 입력
-- 업데이트문에도 서브쿼리 사용 가능
SELECT COUNT(*), SUM(sal), ROUND(AVG(sal)) FROM emp GROUP BY deptno;

UPDATE stat_salary ss
SET (emp_count, tot_salary, avg_salary)
    = ( SELECT COUNT(*), SUM(sal), ROUND(AVG(sal))
        FROM emp e
        WHERE ss.dept_no = e.deptno
        GROUP BY deptno);

SELECT * FROM stat_salary;

-- 추가 연습
CREATE TABLE emp_cp AS SELECT * FROM emp;
SELECT * FROM emp_cp;

-- 부서명이 'SALES'인 사원의 정보를 삭제(emp_cp)
SELECT *
FROM emp_cp e, dept d
WHERE e.deptno = d.deptno AND d.dname = 'SALES';

DELETE FROM emp_cp
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'SALES');
