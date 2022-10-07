-- * �信 �������� �Է�, ����, ���� ���������� �������� ������ ���̺�ó�� �������� ����
CREATE OR REPLACE VIEW v_emp AS
        select empno, ename, deptno from emp;
        
SELECT * FROM v_emp;
DESC v_emp;

INSERT INTO v_emp VALUES (1000, 'ȫ�浿', 20);
SELECT * FROM v_emp;
-- VIEW���� ������ ���۾ ����ϸ� ���� ���̺��� ������ �ش�
SELECT * FROM emp;

-- VIEW�� ���� ���̺� ������ �ֱ� ������ ���� ���̺��� ���������� ������
INSERT INTO v_emp VALUES (1000, 'ȫȫ��', 20);
INSERT INTO v_emp VALUES (2000, 'ȫȫ��', 90);

CREATE OR REPLACE VIEW v_emp AS
        select empno, ename, deptno from emp
        WITH READ ONLY;
        
-- [ ���� ] EMP ���̺��� 30�� �μ��� 
-- EMPNO�� EMP_NO�� ENAME�� NAME�� SAL�� SALARY�� �ٲ㼭 
-- EMP_30 �並 �����Ͻÿ�
-- ���� �̸��� �����Ϸ��� ��Ī ���
CREATE OR REPLACE VIEW V_EMP_30 AS
        SELECT empno AS emp_no, ename AS name, sal AS salary FROM emp WHERE deptno = 30
WITH read only;
-- OR REPLACE ������ �˴ϴ�

SELECT * FROM v_EMP_30;

-- ���պ�
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

SELECT * FROM v_emp_info;

-- ���պ��� ��� ���� ���̺��� �����͸� ���ÿ� �Է��� �Ұ���
INSERT INTO v_emp_info (empno, ename, dname) VALUES (3333, '�Ͳ���', 30);

-- �׷��� ���պ信�� ���� ���̺��� �����͸� �Է��ϴ� ���� ����
INSERT INTO v_emp_info (empno, ename) VALUES (3333, '�Ͳ���');

-- �信�� �����͸� �����ϸ� ���� ���̺��� �����͵� �Բ� �����ȴ� (*) �б� �������� ������ �ϴ� ����
DELETE FROM v_emp_info where empno = 7788;

-- [ ���� ] �μ����� �μ���, �ּұ޿�, �ִ� �޿�, �μ��� ��� �޿��� �����ϴ� V_DEPT_SUM �並 �����϶�
CREATE OR REPLACE VIEW V_DEPT_SUM AS
        SELECT  d.dname �μ���, MIN(e.SAL) "�ּ� �޿�", MAX(e.SAL) "�ִ� �޿�", TRUNC(AVG(e.SAL)) "��� �޿�"
                FROM    dept d, emp e
                WHERE   d.deptno = e.deptno(+)
                GROUP BY d.dname;

SELECT * FROM V_emp_info;

-- ���� ���̺� ���� �Է��ϸ� ���� ���� �����Ǿ� ����
INSERT INTO emp (empno, ename, sal, deptno)
VALUES (1818, '������', 9999, 20);

-- ������(SEQUENCE): �ڵ� ���� ��
CREATE SEQUENCE seq_temp;
SELECT seq_temp.NEXTVAL FROM dual;
SELECT seq_temp.CURRVAL FROM dual;

-- 5000������ �����ؼ� 10���� �����ϴ� �ڵ� ���� ��(������)
CREATE SEQUENCE seq_5000
    -- MINVALUE(�ּ� ����): ������ 5000���� ������ �ִ� ���ڿ� �����ϸ� 0���� ������ ���� �ֱ� ������ �ּ� ���ڸ� �����ϴ� ��
    INCREMENT BY 10
    START WITH 5000;
    
INSERT INTO emp (empno, ename) VALUES (seq_5000.NEXTVAL, '�ھ�');
SELECT * FROM emp;

-- �ε���(INDEX): ���� �˻��� ����
select empno, ename, job, rowid from emp;

SELECT index_name, index_type, uniqueness
FROM user_indexes
WHERE table_name='EMPLOYEES';

CREATE INDEX idx_emp_salary ON employees (salary);

SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE salary=3000;

SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE employee_id = 8000;