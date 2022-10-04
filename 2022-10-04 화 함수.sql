----------- 3. SQL �Լ� -----------
-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �� �������� �ݿø��Ͽ� ���
SELECT ename, sal, round(sal/12,-2) as wolgub
FROM emp;
-- ���� �κ��� �������� �ϰ� ������ -, ����� ������ �Ҽ��� ����

-- �����, �޿�, ����(�޿��� 3.3%)�� �� ���� �����ϰ� ���
SELECT ename, sal, TRUNC(sal*0.033, 0) as tax
FROM emp;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
SELECT empno, ename, LOWER(job) as job
FROM emp
WHERE ename = 'SMITH';

SELECT empno, ename, LOWER(job) as job
FROM emp
WHERE ename = UPPER('smith');

SELECT empno, ename, LOWER(job) as job
FROM emp
WHERE LOWER(ename) = LOWER('smith');

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
SELECT empno, INITCAP(ename) as ename, INITCAP(job) as job
FROM emp;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE SUBSTR(ename, 1, 1) >= 'K' and SUBSTR(ename, 1, 1) <= 'Y'
ORDER BY ename;

-- �̸��� 5���� �̻��� ������� ���
SELECT *
FROM emp
WHERE LENGTH(ename) >= 5;

-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
SELECT RPAD(ename, 15, '*') as ename
FROM emp;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
SELECT LPAD(sal, 10, '-') as sal
FROM emp;

-- ���� ������ ����
select '-' || trim(' �̼��� ') || '-' as col1, 
'-' || ltrim(' �̼��� ') || '-' as col2, 
'-' || rtrim(' �̼��� ') || '-' as col3 from dual;
-- (*) dual : dummy ���̺�� sys user�� owner�̰� ��� ����ڰ� ��밡��.
-- ������ ���� �˰��� �� ��� �����ϰ� ����ϴ� ���̺�.

SELECT name, SUBSTR(jumin, 8, 1) as gender, SUBSTR(jumin, 1, 2) as birth_year
FROM info_tab;

SELECT sysdate
FROM dual;

-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
SELECT TRANSLATE(sal, '0123456789', '�����̻�����ĥ�ȱ�') as kor_sal
FROM emp;

-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
SELECT REPLACE(sal, 0, '$') as char_sal
FROM emp;

-- *****
SELECT REPLACE('         ��    ��    ��  ', ' ', '') as ename
FROM dual;


-- �ý����� ��¥�� �������� �Լ� : 
--          SYSDATE, CURRENT_DATE, SYSTIMESTAMP, CURRENT_TIMESTAMP
--          (*) �� �Լ����� ���� () �ʿ����
--          (*) sysdate�� current_date�� ���̴� current_date�� ���� �ð��� ����.
--          ���� �� ���� �ѱ����� �� ���� �̱����� ���� �ý��ۿ� ���ӽ� 
--          ���� ���ǿ� ���� �ð��� Ȯ���ϰ� ��.

-- ������� �ٹ� �ϼ��� ���� ��� ������ ���
SELECT ename, hiredate, ceil(sysdate - hiredate) as "�ٹ� �ϼ�"
FROM emp
ORDER BY sysdate - hiredate desc;

SELECT ename, hiredate, ceil(sysdate - hiredate) as "�ٹ� �ϼ�"
FROM emp
ORDER BY sysdate - hiredate desc NULLS LAST;

-- ������� �ٹ� �ϼ��� �� �� �� ���ΰ��� ���
SELECT ename, sysdate-hiredate, TRUNC((sysdate-hiredate)/7, 0) as weeks,
        TRUNC(MOD(sysdate-hiredate, 7)) as days
FROM emp;

-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
SELECT ename, TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) as "�ٹ� ����"
FROM emp
WHERE deptno = 10;

SELECT ename, FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) as "�ٹ� ����"
FROM emp
WHERE deptno = 10;

-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select add_months( sysdate, 3 ) as mydate from dual;

-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
-- ��(1), ��(2), ȭ(3), ��(4)... ��(7)
SELECT NEXT_DAY( sysdate, 2) as next_monday
FROM dual;

SELECT NEXT_DAY( sysdate, '��') as next_monday
FROM dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
SELECT LAST_DAY(sysdate) as last_day
FROM dual;

-- �Ի����ڿ��� �Ի�⵵�� ���
SELECT ename, hiredate, to_char(hiredate, 'YYYY') as hire_year
FROM emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
SELECT ename, hiredate, to_char(hiredate, 'YYYY"�� "MM"�� "DD"��"') as hiredate
FROM emp;

-- 1981�⵵�� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') = 1981;

-- 5���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate, 'MM') = 5;

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
SELECT ename, sal, to_char(sal, '$999,999,999,999,999') as dollar
FROM emp;

-- 81�� 2���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYYMM') = 198102;

SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') = 1981 AND to_char(hiredate, 'MM') = 2;
 
-- 81�⿡ �Ի����� ���� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') != 1981;

-- 81�� �Ϲݱ⿡ �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') = 1981 and to_char(hiredate, 'MM') >=7;

-- �ֹε�Ϲ�ȣ���� ���� ���ϱ�
SELECT decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 
            WHEN '1' THEN '����'
            WHEN '3' THEN '����'
            ELSE '����'
            END as gender
FROM info_tab;

-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
SELECT DISTINCT decode ( deptno, 10, '������', 20, '������', 30, 'IT��', '�����') AS dept
FROM emp;

SELECT CASE deptno
            WHEN 10 THEN '������'
            WHEN 20 THEN '������'
            WHEN 30 THEN 'IT��'
            ELSE '�����'
            END AS dept
FROM emp;

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���
SELECT empno, ename, job, sal, decode(lower(job), 'analyst', sal*1.1, 'clerk', sal*1.15, 'manager', sal*1.2, sal) AS sum_sal
FROM emp;

SELECT empno, ename, job, sal, CASE lower(job)
                                    WHEN 'analyst' THEN sal*1.1
                                    WHEN 'clerk'   THEN sal*1.15
                                    WHEN 'manager' THEN sal*1.2
                                    ELSE sal
                                    END AS sum_sal
FROM emp;

----------- 4. �׷� �Լ� -----------
SELECT ALL job from emp;

SELECT DISTINCT job FROM emp;

desc emp;

SELECT rownum, empno, ename, job FROM emp;

SELECT rownum, empno, ename, job FROM emp WHERE rownum<=5;

-- (#) �Լ� ���ڿ� distinct�� �̿��ϸ� �ߺ����� �ʴ� ������ ���

-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
SELECT avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
FROM emp
WHERE job = 'SALESMAN';

INSERT INTO emp(empno, ename, job)
VALUES(9001, 'ȫ�汹', 'SALESMAN');

-- Ŀ�̼�(COMM)�� �޴� ������� ����
SELECT COUNT(*) as comm_people
FROM emp
WHERE comm > 0;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
SELECT      deptno, count(*), avg(sal) avg, min(sal) min, max(sal) max, sum(sal) sum
FROM        emp
--WHERE
GROUP BY    deptno;
--HAVING
-- (#) ��� �÷��� (1)�׷����ϴ� �÷��� (2)�����Լ��� ����

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������
SELECT      deptno, count(*), round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum
FROM        emp
--WHERE
GROUP BY    deptno
ORDER BY sum(sal) desc;
--HAVING

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
SELECT      deptno, job, count(*), round(avg(sal)) avg, sum(sal) sum
FROM        emp
--WHERE
GROUP BY    deptno, job;
--HAVING

-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
SELECT      deptno, avg(sal) avg, sum(sal) sum
FROM        emp
--WHERE       
GROUP BY    deptno
HAVING      max(sal) >= 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
SELECT      job, avg(sal) avg, sum(sal) sum
FROM        emp
--WHERE       
GROUP BY    job
HAVING      avg(sal) >= 3000;

-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
-- ��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
SELECT      job, sum(sal) sum
FROM        emp
WHERE       job != 'SALESMAN'
GROUP BY    job
HAVING      sum(sal) > 5000 --and job != 'SALESMAN'
ORDER BY    sum desc;

-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
SELECT      job, max(sal) - min(sal)
FROM        emp
--WHERE       
GROUP BY    job;
--HAVING;

-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
SELECT      deptno, count(*), sum(sal) sum
FROM        emp
--WHERE       
GROUP BY    deptno
HAVING      count(*) > 4;