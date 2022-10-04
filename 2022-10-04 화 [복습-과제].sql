--------------- [����-����] ---------------
-- 1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
SELECT employee_id, FIRST_NAME||' '||LAST_NAME AS EMPLOYEE_NAME, hire_date
FROM employees
WHERE to_char(hire_date, 'yyyy') = 2003;

-- 2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
SELECT *
FROM EMPLOYEES
WHERE job_id in ('FI_ACCOUNT', 'FI_MGR', 'SA_MAN', 'SA_REP');?

-- 3. Ŀ�̼��� �޴� ������� ����� ���
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT is not null;

-- 4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS EMPLOYEE_NAME, decode(JOB_ID, 'SA_MAN', '�Ǹźμ�', '�� �� �μ�') as JOB
FROM EMPLOYEES;

-- 5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
SELECT to_char(hire_date, 'YYYY'), MIN(SALARY) MIN, MAX(SALARY) MAX, SUM(SALARY) SUM, AVG(SALARY) AVG
FROM EMPLOYEES
--WHERE
GROUP BY to_char(hire_date, 'YYYY')
ORDER BY to_char(hire_date, 'YYYY');

-- 6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
SELECT      DEPARTMENT_ID, AVG(SALARY) AVG
FROM        EMPLOYEES
--WHERE
GROUP BY    DEPARTMENT_ID
HAVING      AVG(SALARY) >= 10000
ORDER BY    AVG(SALARY) desc;

-- 7. �μ��� �ִ� �޿��� ���Ͻÿ�
SELECT      DEPARTMENT_ID, MAX(SALARY) MAX
FROM        EMPLOYEES
--WHERE
GROUP BY    DEPARTMENT_ID;