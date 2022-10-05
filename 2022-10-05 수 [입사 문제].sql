-- SQL-����-1) �Ʒ� ��Ű���� ���� ������ 3.0 �̻��� �л����� �̸��� �����ִ� SQL�ۼ��Ͻÿ�
SELECT      S.�̸�
FROM        STUDENT S INNER JOIN ENROLL E
            ON S.�й� = E.�й�
--          INNER JOIN CLASS C
--          ON E.���¹�ȣ = C.���¹�ȣ
HAVING      E.���� >= 3.0;

-- ���߿� �ٽ� �� ��(��������)
SELECT      S.�й� -- -> S.�̸� ġȯ�ϴ� ��??
FROM        STUDENT S INNER JOIN ENROLL E
            ON S.�й� = E.�й�
            INNER JOIN CLASS C
            ON E.���¹�ȣ = C.���¹�ȣ
GROUP BY    S.�й�
HAVING      AVG(E.����) >= 3.0; -- �̰� �Ǵ���?
-- ��ǻ� CLASS ���̺��� ������ �ʿ� ���� �ʳ�?


-- SQL-����-2) ���� �� �Ʒ��� ���� ���̺��� Full Outer Join�� ����� �ۼ��Ͻÿ�
SELECT      E.DEPTNO, E.DNAME, D.DEPTNO, D.DNAME
FROM        EMP E FULL OUTER JOIN DEPT D
ON          E.DEPTNO = D.DEPTNO;