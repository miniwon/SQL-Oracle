-- << �������� >>
-- 1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
SELECT  empno, ename, job, sal
FROM    emp
WHERE   sal > (SELECT sal FROM emp WHERE ename = 'SCOTT');

-- 2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
SELECT      deptno, MIN(sal)
FROM        emp
GROUP BY    deptno
HAVING      min(sal) > (SELECT min(sal) FROM emp WHERE deptno = 30);

-- 3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
SELECT avg(sal) FROM emp WHERE 

-- 4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���

-- 5. 'WARD'�� �μ��� ������ ���� ��� ��� ���