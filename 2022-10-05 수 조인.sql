-- 사원 테이블(emp)에 사원명과 부서 테이블(dept)에 그 사원의 부서명을 출력
SELECT  ename, dname, deptno
FROM    emp, dept;

SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept;

SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept
WHERE   emp.deptno=dept.deptno;
-- 이것이 조인

-- 테이블명에 별칭 부여, 양쪽 연결고리를 모두 가진 레코드만 출력(내부 조인)
SELECT  e.ename, d.dname, d.deptno
FROM    emp e, dept d
WHERE   e.deptno=d.deptno;

SELECT  e.ename, d.dname, d.deptno
FROM    emp e INNER JOIN dept d
ON      e.deptno=d.deptno;

-- 외부 조인
SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno=d.deptno(+);

SELECT  e.ename, d.dname, d.deptno
FROM    emp e INNER JOIN dept d
ON      e.deptno=d.deptno;

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno(+)=d.deptno;

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e RIGHT OUTER JOIN dept d
ON      e.deptno=d.deptno;

SELECT  e.ename, d.dname, d.deptno
FROM    emp e, dept d
WHERE   e.deptno(+)=d.deptno(+); -- 오류

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e FULL OUTER JOIN dept d
ON      e.deptno=d.deptno;

-- 사원 테이블(emp)에 각 사원의 매니저를 조회
-- 1. 내부 조인
SELECT     e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM       emp e1, emp e2
WHERE      e1.mgr = e2.empno;

SELECT     e1.empno, e1.ename, e1.mgr, e2.empno mgrno, e2.ename mgrname
FROM       emp e1 INNER JOIN emp e2
ON         e1.mgr = e2.empno;

-- 2. 외부 조인(레프트)
SELECT     e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM       emp e1, emp e2
WHERE      e1.mgr = e2.empno(+);

SELECT     e1.empno, e1.ename, e1.mgr, e2.empno mgrno, e2.ename mgrname
FROM       emp e1 LEFT OUTER JOIN emp e2
ON         e1.mgr = e2.empno;

-- 3. 외부 조인(라이트)
SELECT     e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM       emp e1, emp e2
WHERE      e1.mgr(+) = e2.empno;

SELECT     e1.empno, e1.ename, e1.mgr, e2.empno mgrno, e2.ename mgrname
FROM       emp e1 RIGHT OUTER JOIN emp e2
ON         e1.mgr = e2.empno;

-- [집합]
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    -- SMITH / ADAMS / JAMES / MILLER
    UNION
SELECT empno, ename, job, deptno FROM emp WHERE deptno = 10;
    -- CLARK / KING / MILLER
   
   
    
-- << 기초 문제 >>
-- 1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력
SELECT  e.empno empno, e.ename ename, e.job job, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno;

SELECT  e.empno empno, e.ename ename, e.job job, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno;

--2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력
SELECT  e.empno empno, e.ename ename, e.sal sal, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno and job = 'SALESMAN';

SELECT  e.empno empno, e.ename ename, e.sal sal, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno
WHERE   e.job = 'SALESMAN';

--3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
SELECT  e.ename ename, d.dname dname, d.loc loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno and comm > 0;

SELECT  e.ename ename, d.dname dname, d.loc loc
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno
WHERE   e.comm > 0;

--4. 부서별 부서명과 급여 합계를 출력
SELECT      d.dname dname, sum(e.sal) as sumsal
FROM        emp e, dept d
WHERE       e.deptno = d.deptno
GROUP BY    d.dname;
-- GROUP으로 묶으면 그루핑의 기준이 되는 열과 집계 함수만 SELECT에 출력할 수 있다

SELECT      d.dname dname, sum(e.sal) as sumsal
FROM        emp e INNER JOIN dept d
ON          e.deptno = d.deptno
GROUP BY    d.dname;

-- 5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력
SELECT      e.ename ename, e.job job, d.dname dname, d.loc loc
FROM        emp e, dept d
WHERE       e.deptno = d.deptno AND job = 'MANAGER';

SELECT      e.ename ename, e.job job, d.dname dname, d.loc loc
FROM        emp e INNER JOIN dept d
ON          e.deptno = d.deptno
WHERE       e.job = 'MANAGER';