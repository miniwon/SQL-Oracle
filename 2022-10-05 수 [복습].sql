-- 1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���
SELECT empno, ename, job, sal, sal*1.15 AS New_Salary, sal*0.15 AS Increase
FROM emp;

-- 2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���
SELECT  ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate, 6), 2) AS MONDAY
FROM    emp;
-- WHERE

-- 3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���
SELECT  ename, hiredate,
        TRUNC((sysdate-hiredate)/365) AS workyears, sal,
        TRUNC((sysdate-hiredate)/365*sal) as sumsal
FROM    emp;
-- WHERE?

select ename, hiredate, sal,
        to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY') as workyear,
        sal*(to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')) as sumsal
from emp;

select ename, hiredate, trunc(months_between(sysdate,hiredate)/12,0) as workyear,
sal, sal*trunc(months_between(sysdate,hiredate)/12,0) as sumsal
from emp;

-- 4.�̸�, ����, �Ի���, �Ի��� ������ ���
SELECT ename, job, hiredate, to_char(hiredate, 'DAY') AS HIREDAY
FROM emp;

-- 5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 
-- 10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
SELECT      job, deptno, SUM(SAL) SUM, COUNT(*) COUNT
FROM        emp
WHERE       deptno != 10 AND job IN ('SALESMAN', 'MANAGER')
GROUP BY    job, deptno;
-- HAVING

-- 6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����
SELECT      job, TRUNC(avg(sal)) AVG, MAX(sal) MAX
FROM        emp
-- WHERE       
GROUP BY    job
HAVING      avg(sal) >= 2000
ORDER BY    avg(sal) desc;

-- 7. ���� �Ի�⵵ ���� �ο����� ���
SELECT      to_char(hiredate, 'YYYY') AS HIREYEAR, count(*) COUNT
FROM        emp
GROUP BY    to_char(hiredate, 'YYYY');

-- 8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)
SELECT      ceil(rownum/5), sum(sal) SUM, count(*)
FROM        emp
GROUP BY    ceil(rownum/5);

-- 9. ������ ���� ��� ( ���� ��µ� �ο����� �ٸ� ���� ���� )
SELECT      COUNT(decode(job,'CLERK', 1)) CLERK,
            COUNT(decode(job,'SALESMAN',1)) SALESMAN,
            COUNT(decode(job,'MANAGER',1)) MANAGER
FROM emp;

-- 10. ������ ���� ������, �μ��� ��� ( ���� ���� �ݾ��� �ٸ� ���� ���� )
SELECT      job AS ������,
            nvl(sum(decode(deptno,'10',sal)),0) "10���μ�",
            nvl(sum(decode(deptno,'20',sal)),0) "20���μ�",
            nvl(sum(decode(deptno,'30',sal)),0) "30���μ�",
            sum(sal) as �޿��հ�
FROM        emp
GROUP BY    job;




