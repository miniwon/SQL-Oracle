--------------------------------
-- # HR ��������
--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )?
SELECT      e.employee_id AS ���, d.department_name AS �μ���
FROM        EMPLOYEES e INNER JOIN DEPARTMENTS d
ON          e.department_id = d.department_id
WHERE       e.LAST_NAME = 'King';

--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
SELECT      e.employee_id AS ���, d.department_name AS �μ���, j.job_title AS ������
FROM        EMPLOYEES e, DEPARTMENTS d, JOBS j
WHERE       e.department_id = d.department_id
            AND e.job_id = j.job_id
            AND e.LAST_NAME = 'King';

SELECT      e.employee_id AS ���, d.department_name AS �μ���, j.job_title AS ������
FROM        EMPLOYEES e INNER JOIN DEPARTMENTS d
            ON e.department_id = d.department_id
            INNER JOIN JOBS j
            ON e.job_id = j.job_id
WHERE       e.LAST_NAME LIKE 'King';

-- 3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���
-- (*)Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
SELECT      e.employee_id AS ���, e.last_name AS �̸�, e.hire_date AS �Ի���, d.department_name AS �μ���
FROM        EMPLOYEES e, DEPARTMENTS d
WHERE       e.department_id = d.department_id(+);

SELECT      e.employee_id AS ���, e.last_name AS �̸�, e.hire_date AS �Ի���, d.department_name AS �μ���
FROM        EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d
ON          e.department_id = d.department_id;

-- 4. 'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���
-- (*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
SELECT      e1.last_name AS �̸�, e2.last_name AS ���
FROM        EMPLOYEES e1, EMPLOYEES e2, DEPARTMENTS d
WHERE       e1.department_ID = d.department_ID
            AND e1.MANAGER_ID = e2.employee_id(+)
            AND d.department_name = 'Executive';
            
SELECT      e1.last_name AS �̸�, e2.last_name AS ���
FROM        EMPLOYEES e1 LEFT OUTER JOIN DEPARTMENTS d
            ON e1.department_id = d.department_id
            LEFT OUTER JOIN EMPLOYEES e2
            ON e1.MANAGER_id = e2.employee_ID
WHERE       d.department_name = 'Executive';