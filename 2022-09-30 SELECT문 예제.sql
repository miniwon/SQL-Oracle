/*
        SELECT      검색할 항목들
        FROM        테이블명
        WHERE       조건;
*/

-- 모든 사원의 사원명과 급여, 급여와 보너스를 더한 합계 출력
SELECT  ename, sal, sal+nvl(comm, 0) total_sal
FROM    emp;
--WHERE

SELECT  ename||' '||job As staff
FROM    emp;

SELECT distinct JOB FROM emp;

-- 1. 20번 부서에서 근무하는 사원의 사원 번호, 이름, 부서 번호 출력
SELECT  empno, ename, deptno
FROM    emp
WHERE   deptno=20;

-- 2. 입사일이 81/01/01에서 81/06/09인 사원의 사원 번호, 이름, 입사일 출력
SELECT  empno, ename, hiredate
FROM    emp
WHERE   hiredate >= '1981-01-01' and hiredate <= '1981-06-09';

SELECT  empno, ename, hiredate
FROM    emp
WHERE   hiredate between '81/01/01' and '81/06/09';

-- 3. 담당 업무가 salesman, clerk인 사원들의 이름과 업무를 출력
SELECT  ename, job
FROM    emp
WHERE   job = 'SALESMAN' or job = 'CLERK';

SELECT  ename, job
FROM    emp
WHERE   job in ('SALESMAN', 'CLERK');

SELECT  ename, job
FROM    emp
WHERE   job = upper('salesman') or job = upper('clerk');

-- 4. 업무가 president이고 급여가 1500이상이거나 업무가 salesman인 사원의 정보를 출력
SELECT  *
FROM    emp
WHERE   job = 'PRESIDENT' AND sal >= 1500 OR job = 'SALESMAN';

-- 5. 업무가 president 또는 salesman이고 급여가 1500이상인 사원의 정보를 출력
SELECT  *
FROM    emp
WHERE   (job = 'PRESIDENT' OR job = 'SALESMAN' ) AND sal >= 1500 ;

-- 6. 커미션(comm)이 없는 사원의 이름, 급여, 커미션을 출력
SELECT  ename, sal, comm
FROM    emp
WHERE   comm is null;

-- 7. 사원명, 급여, 커미션, 총급여( 급여 + 커미션)을 출력
SELECT  ename, sal, comm, sal+nvl(comm, 0) total_sal
FROM    emp;

-- 8. 이름 A로 시작하는 사원명 출력
SELECT  ename
FROM    emp
WHERE   ename LIKE 'A%';

-- 9. 이름이 두번째 문자가 L인 사원명 출력
SELECT  ename
FROM    emp
WHERE   ename LIKE '_L%';

-- 10. 이름에 L이 두 번 이상 포함된 사원명 출력
SELECT  ename
FROM    emp
WHERE   ename LIKE '%L%L%';

-- 11. 커미션(COMM)이 NULL이 아닌 사원의 모든 정보를 출력
SELECT  *
FROM    emp
WHERE   comm IS NOT NULL;

-- 12. 보너스가 급여보다 10%이상 많은 모든 사원에 대해 이름, 급여, 보너스를 출력
SELECT  ename, sal, comm
FROM    emp
WHERE   comm >= sal*0.1;

-- 13. 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000이 아닌 모든 사원의 정보를 출력
SELECT  *
FROM    emp
WHERE   (job = 'CLERK' or job = 'ANALYST') and (sal != 1000 or sal != 3000 or sal != 5000);

-- 14. 부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력
SELECT  *
FROM    emp
WHERE   deptno = 30 OR mgr = 7782;