-- SQL-문제-1) 아래 스키마를 보고 평점이 3.0 이상인 학생들의 이름을 보여주는 SQL작성하시오
SELECT      S.이름
FROM        STUDENT S INNER JOIN ENROLL E
            ON S.학번 = E.학번
--          INNER JOIN CLASS C
--          ON E.강좌번호 = C.강좌번호
HAVING      E.학점 >= 3.0;

-- 나중에 다시 볼 것(서브쿼리)
SELECT      S.학번 -- -> S.이름 치환하는 법??
FROM        STUDENT S INNER JOIN ENROLL E
            ON S.학번 = E.학번
            INNER JOIN CLASS C
            ON E.강좌번호 = C.강좌번호
GROUP BY    S.학번
HAVING      AVG(E.학점) >= 3.0; -- 이거 되는지?
-- 사실상 CLASS 테이블은 조인할 필요 없지 않나?


-- SQL-문제-2) 다음 중 아래와 같은 테이블에서 Full Outer Join의 결과를 작성하시오
SELECT      E.DEPTNO, E.DNAME, D.DEPTNO, D.DNAME
FROM        EMP E FULL OUTER JOIN DEPT D
ON          E.DEPTNO = D.DEPTNO;