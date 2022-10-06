-- 1. 사원명에 ‘L’자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력
SELECT  e.ename, e.job, d.dname, d.loc
FROM    emp e LEFT OUTER JOIN dept d
ON      e.deptno = d.deptno
WHERE   e.ename like '%L%';

-- 2. 관리자보다 먼저 입사한 사원에 대해 이름, 입사일, 관리자 이름, 관리자 입사일을 출력
SELECT      e1.ename, e1.hiredate, e2.ename, e2.hiredate
FROM        emp e1 INNER JOIN emp e2
ON          e1.mgr = e2.empno
WHERE       e1.hiredate < e2.hiredate;

--3. 아래의 결과를 출력 ( 관리자가 없는 KING을 포함하여 모든 사원을 출력 )
-- 사번 사원명 매니저사번 매니저명
-- 7839 KING 
-- 7698 BLAKE 7839 KING 
-- 7782 CLARK 7839 KING
SELECT      e1.empno AS 사번, e1.ename AS 사원명, e2.empno AS 매니저사번, e2.ename AS 매니저명
FROM        emp e1 LEFT OUTER JOIN emp e2
ON          e1.mgr = e2.empno;
