-- << 연습문제 >>
-- 1. SCOTT의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
SELECT  empno, ename, job, sal
FROM    emp
WHERE   sal > (SELECT sal FROM emp WHERE ename = 'SCOTT');

-- 2. 30번 부서의 최소 급여보다 각부서의 최소 급여가 높은 부서를 출력
SELECT      deptno, MIN(sal)
FROM        emp
GROUP BY    deptno
HAVING      min(sal) > (SELECT min(sal) FROM emp WHERE deptno = 30);

-- 3. 업무별로 평균 급여 중에서 가장 적은 급여를 가진 직업을 출력
SELECT avg(sal) FROM emp WHERE 

-- 4. 사원번호가 7521의 업무와 같고 사번 7934인 직원보다 급여를 많이 받는 사원의 정보를 출력

-- 5. 'WARD'와 부서와 업무가 같은 사원 명단 출력