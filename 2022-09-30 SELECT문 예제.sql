/*
        SELECT      �˻��� �׸��
        FROM        ���̺��
        WHERE       ����;
*/

-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���
SELECT  ename, sal, sal+nvl(comm, 0) total_sal
FROM    emp;
--WHERE

SELECT  ename||' '||job As staff
FROM    emp;

SELECT distinct JOB FROM emp;

-- 1. 20�� �μ����� �ٹ��ϴ� ����� ��� ��ȣ, �̸�, �μ� ��ȣ ���
SELECT  empno, ename, deptno
FROM    emp
WHERE   deptno=20;

-- 2. �Ի����� 81/01/01���� 81/06/09�� ����� ��� ��ȣ, �̸�, �Ի��� ���
SELECT  empno, ename, hiredate
FROM    emp
WHERE   hiredate >= '1981-01-01' and hiredate <= '1981-06-09';

SELECT  empno, ename, hiredate
FROM    emp
WHERE   hiredate between '81/01/01' and '81/06/09';

-- 3. ��� ������ salesman, clerk�� ������� �̸��� ������ ���
SELECT  ename, job
FROM    emp
WHERE   job = 'SALESMAN' or job = 'CLERK';

SELECT  ename, job
FROM    emp
WHERE   job in ('SALESMAN', 'CLERK');

SELECT  ename, job
FROM    emp
WHERE   job = upper('salesman') or job = upper('clerk');

-- 4. ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
SELECT  *
FROM    emp
WHERE   job = 'PRESIDENT' AND sal >= 1500 OR job = 'SALESMAN';

-- 5. ������ president �Ǵ� salesman�̰� �޿��� 1500�̻��� ����� ������ ���
SELECT  *
FROM    emp
WHERE   (job = 'PRESIDENT' OR job = 'SALESMAN' ) AND sal >= 1500 ;

-- 6. Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT  ename, sal, comm
FROM    emp
WHERE   comm is null;

-- 7. �����, �޿�, Ŀ�̼�, �ѱ޿�( �޿� + Ŀ�̼�)�� ���
SELECT  ename, sal, comm, sal+nvl(comm, 0) total_sal
FROM    emp;

-- 8. �̸� A�� �����ϴ� ����� ���
SELECT  ename
FROM    emp
WHERE   ename LIKE 'A%';

-- 9. �̸��� �ι�° ���ڰ� L�� ����� ���
SELECT  ename
FROM    emp
WHERE   ename LIKE '_L%';

-- 10. �̸��� L�� �� �� �̻� ���Ե� ����� ���
SELECT  ename
FROM    emp
WHERE   ename LIKE '%L%L%';

-- 11. Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
SELECT  *
FROM    emp
WHERE   comm IS NOT NULL;

-- 12. ���ʽ��� �޿����� 10%�̻� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���
SELECT  ename, sal, comm
FROM    emp
WHERE   comm >= sal*0.1;

-- 13. ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
SELECT  *
FROM    emp
WHERE   (job = 'CLERK' or job = 'ANALYST') and (sal != 1000 or sal != 3000 or sal != 5000);

-- 14. �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT  *
FROM    emp
WHERE   deptno = 30 OR mgr = 7782;