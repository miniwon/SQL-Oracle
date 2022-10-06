SELECT round(avg(sal)) FROM emp;

SELECT ename, sal
FROM emp
WHERE sal < (SELECT round(avg(sal)) FROM emp);


---------- [�������� ��� ��] ----------
-- ���������� ( ) �� ���´� [����]
-- ���������� �������� �����ʿ� [����]
-- ���� ���� ��� �� ������ ���� ( >, >=, <, <=, =, !=(<>) )
-- ���� ���� ��� IN, NOT IN, ANY, ALL, EXISTS
-- ORDER BY���� ��� ���Ѵ�

-- [ ���� ���� ��� ] ( >, >=, <, <=, =, !=(<>) )
-- ������ ���� ���� ����� ���� ��ȸ
SELECT *
FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);

-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
      AND sal < (SELECT MAX(sal) FROM emp);

-- ���޼����� ���� 10���� ����� ���
SELECT *
FROM (SELECT * FROM emp ORDER BY sal DESC)
WHERE rownum <= 10;


-- [ ���� ���� ��� ] IN, NOT IN, ANY, ALL, EXISTS
-- IN: ��ȯ�� ����� ������ ��
-- ANY: �񱳿�����( >, >=, <, <=, =, !=(<>) ) �� ��ȯ�� ����� ������ ��
-- ALL: �񱳿�����( >, >=, <, <=, =, !=(<>) ) �� ��ȯ�� ��� ��ϰ� ��
-- EXISTS: ��� �� ���� ���� �����ϸ� true, �׷��� ������ false

-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
SELECT empno, ename, job, sal
FROM emp
WHERE (job, sal) in (SELECT job, MIN(sal) FROM emp GROUP BY job);

-- 10�� �μ� ������� ������ ������ ������ �˻�
SELECT *
FROM emp
WHERE job in (SELECT job FROM emp WHERE deptno = 10);

SELECT *
FROM emp
WHERE job = any( select job from emp where deptno = 10);

-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
SELECT empno, ename, job
FROM emp
WHERE ename IN (SELECT e2.ename AS �Ŵ����� FROM emp e1 LEFT OUTER JOIN emp e2 ON e1.mgr=e2.empno);

SELECT empno, ename, job
FROM emp e1
WHERE exists (SELECT * FROM emp e2 WHERE e1.empno = e2.mgr);

------------------------------------------------------------
-- INSERT / UPDATE / DELETE �ȿ��� �������� ���
-- (1) �μ��� �޿� ��� ���̺� ����
CREATE TABLE stat_salary (
    stat_date  date not null,
    dept_no     number,
    emp_count   number,
    tot_salary  number,
    avg_salary  number
);

DESC stat_salary;

-- (2) ��¥�� �μ� ��ȣ �Է�
SELECT sysdate, deptno FROM emp GROUP BY deptno;

INSERT INTO stat_salary (stat_date, dept_no)
    SELECT sysdate, deptno FROM emp GROUP BY deptno;

SELECT * FROM stat_salary;

-- (3) ��� ��, �޿� �Ѿ�, ��� �޿� �Է�
-- ������Ʈ������ �������� ��� ����
SELECT COUNT(*), SUM(sal), ROUND(AVG(sal)) FROM emp GROUP BY deptno;

UPDATE stat_salary ss
SET (emp_count, tot_salary, avg_salary)
    = ( SELECT COUNT(*), SUM(sal), ROUND(AVG(sal))
        FROM emp e
        WHERE ss.dept_no = e.deptno
        GROUP BY deptno);

SELECT * FROM stat_salary;

-- �߰� ����
CREATE TABLE emp_cp AS SELECT * FROM emp;
SELECT * FROM emp_cp;

-- �μ����� 'SALES'�� ����� ������ ����(emp_cp)
SELECT *
FROM emp_cp e, dept d
WHERE e.deptno = d.deptno AND d.dname = 'SALES';

DELETE FROM emp_cp
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'SALES');
