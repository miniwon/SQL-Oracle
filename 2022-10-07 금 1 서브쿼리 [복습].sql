-- 11. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���
SELECT  ename, job, sal
FROM    emp
WHERE   sal in (select sal
                from emp
                where ename in ('SCOTT', 'WARD'));
                
-- 12. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���
SELECT  ename, job
FROM    emp
WHERE   job in ( SELECT  e.job
                 FROM    emp e inner join dept d
                 ON e.deptno = d.deptno
                 WHERE   LOWER(d.loc) = 'chicago' );
                 
-- 13. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���
SELECT  deptno, ename, sal
FROM    emp e1
WHERE   sal >  (SELECT  AVG(sal)
                FROM    emp e2
                WHERE   e1.deptno = e2.deptno)
ORDER BY deptno;

SELECT E1.DEPTNO, E1.ENAME, E1.SAL
FROM EMP E1,(SELECT DEPTNO, TRUNC(AVG(SAL)) AVG FROM EMP GROUP BY DEPTNO) E2
WHERE E1.DEPTNO=E2.DEPTNO
AND E1.SAL> E2.AVG
ORDER BY deptno;