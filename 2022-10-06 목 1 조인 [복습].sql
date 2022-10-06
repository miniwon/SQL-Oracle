-- 1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
SELECT  e.ename, e.job, d.dname, d.loc
FROM    emp e LEFT OUTER JOIN dept d
ON      e.deptno = d.deptno
WHERE   e.ename like '%L%';

-- 2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���
SELECT      e1.ename, e1.hiredate, e2.ename, e2.hiredate
FROM        emp e1 INNER JOIN emp e2
ON          e1.mgr = e2.empno
WHERE       e1.hiredate < e2.hiredate;

--3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
-- ��� ����� �Ŵ������ �Ŵ�����
-- 7839 KING 
-- 7698 BLAKE 7839 KING 
-- 7782 CLARK 7839 KING
SELECT      e1.empno AS ���, e1.ename AS �����, e2.empno AS �Ŵ������, e2.ename AS �Ŵ�����
FROM        emp e1 LEFT OUTER JOIN emp e2
ON          e1.mgr = e2.empno;
