-- 11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력
SELECT  ename, job, sal
FROM    emp
WHERE   sal in (select sal
                from emp
                where ename in ('SCOTT', 'WARD'));
                
-- 12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력
SELECT  ename, job
FROM    emp
WHERE   job in ( SELECT  e.job
                 FROM    emp e inner join dept d
                 ON e.deptno = d.deptno
                 WHERE   LOWER(d.loc) = 'chicago' );
                 
-- 13. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
SELECT  deptno, ename, sal
FROM    emp e1
WHERE   sal >  (SELECT  AVG(sal)
                FROM    emp e2
                WHERE   e1.deptno = e2.deptno)
ORDER BY deptno;

SELECT E1.DEPTNO, E1.ENAME, E1.SAL
FROM EMP E1,(SELECT DEPTNO, TRUNC(AVG(SAL)) AVG FROM EMP GROUP BY DEPTNO) E2
WHERE E1.DEPTNO=E2.DEPTNO
AND E1.SAL> E2.AVG
ORDER BY deptno;