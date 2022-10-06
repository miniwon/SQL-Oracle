-- ��� ���̺�(emp)�� ������ �μ� ���̺�(dept)�� �� ����� �μ����� ���
SELECT  ename, dname, deptno
FROM    emp, dept;

SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept;

SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept
WHERE   emp.deptno=dept.deptno;
-- �̰��� ����

-- ���̺�� ��Ī �ο�, ���� ������� ��� ���� ���ڵ常 ���(���� ����)
SELECT  e.ename, d.dname, d.deptno
FROM    emp e, dept d
WHERE   e.deptno=d.deptno;

SELECT  e.ename, d.dname, d.deptno
FROM    emp e INNER JOIN dept d
ON      e.deptno=d.deptno;

-- �ܺ� ����
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
WHERE   e.deptno(+)=d.deptno(+); -- ����

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e FULL OUTER JOIN dept d
ON      e.deptno=d.deptno;

-- ��� ���̺�(emp)�� �� ����� �Ŵ����� ��ȸ
-- 1. ���� ����
SELECT     e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM       emp e1, emp e2
WHERE      e1.mgr = e2.empno;

SELECT     e1.empno, e1.ename, e1.mgr, e2.empno mgrno, e2.ename mgrname
FROM       emp e1 INNER JOIN emp e2
ON         e1.mgr = e2.empno;

-- 2. �ܺ� ����(����Ʈ)
SELECT     e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM       emp e1, emp e2
WHERE      e1.mgr = e2.empno(+);

SELECT     e1.empno, e1.ename, e1.mgr, e2.empno mgrno, e2.ename mgrname
FROM       emp e1 LEFT OUTER JOIN emp e2
ON         e1.mgr = e2.empno;

-- 3. �ܺ� ����(����Ʈ)
SELECT     e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM       emp e1, emp e2
WHERE      e1.mgr(+) = e2.empno;

SELECT     e1.empno, e1.ename, e1.mgr, e2.empno mgrno, e2.ename mgrname
FROM       emp e1 RIGHT OUTER JOIN emp e2
ON         e1.mgr = e2.empno;

-- [����]
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    -- SMITH / ADAMS / JAMES / MILLER
    UNION
SELECT empno, ename, job, deptno FROM emp WHERE deptno = 10;
    -- CLARK / KING / MILLER
   
   
    
-- << ���� ���� >>
-- 1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
SELECT  e.empno empno, e.ename ename, e.job job, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno;

SELECT  e.empno empno, e.ename ename, e.job job, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno;

--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���
SELECT  e.empno empno, e.ename ename, e.sal sal, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno and job = 'SALESMAN';

SELECT  e.empno empno, e.ename ename, e.sal sal, e.deptno deptno, d.dname dname, d.loc loc
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno
WHERE   e.job = 'SALESMAN';

--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
SELECT  e.ename ename, d.dname dname, d.loc loc
FROM    emp e, dept d
WHERE   e.deptno = d.deptno and comm > 0;

SELECT  e.ename ename, d.dname dname, d.loc loc
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno
WHERE   e.comm > 0;

--4. �μ��� �μ���� �޿� �հ踦 ���
SELECT      d.dname dname, sum(e.sal) as sumsal
FROM        emp e, dept d
WHERE       e.deptno = d.deptno
GROUP BY    d.dname;
-- GROUP���� ������ �׷����� ������ �Ǵ� ���� ���� �Լ��� SELECT�� ����� �� �ִ�

SELECT      d.dname dname, sum(e.sal) as sumsal
FROM        emp e INNER JOIN dept d
ON          e.deptno = d.deptno
GROUP BY    d.dname;

-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ���
SELECT      e.ename ename, e.job job, d.dname dname, d.loc loc
FROM        emp e, dept d
WHERE       e.deptno = d.deptno AND job = 'MANAGER';

SELECT      e.ename ename, e.job job, d.dname dname, d.loc loc
FROM        emp e INNER JOIN dept d
ON          e.deptno = d.deptno
WHERE       e.job = 'MANAGER';