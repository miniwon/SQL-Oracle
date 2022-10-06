-- 1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력
SELECT empno, ename, job, sal, sal*1.15 AS New_Salary, sal*0.15 AS Increase
FROM emp;

-- 2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력
SELECT  ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate, 6), 2) AS MONDAY
FROM    emp;
-- WHERE

-- 3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력
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

-- 4.이름, 업무, 입사일, 입사한 요일을 출력
SELECT ename, job, hiredate, to_char(hiredate, 'DAY') AS HIREDAY
FROM emp;

-- 5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 
-- 10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.
SELECT      job, deptno, SUM(SAL) SUM, COUNT(*) COUNT
FROM        emp
WHERE       deptno != 10 AND job IN ('SALESMAN', 'MANAGER')
GROUP BY    job, deptno;
-- HAVING

-- 6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬
SELECT      job, TRUNC(avg(sal)) AVG, MAX(sal) MAX
FROM        emp
-- WHERE       
GROUP BY    job
HAVING      avg(sal) >= 2000
ORDER BY    avg(sal) desc;

-- 7. 같은 입사년도 별로 인원수를 출력
SELECT      to_char(hiredate, 'YYYY') AS HIREYEAR, count(*) COUNT
FROM        emp
GROUP BY    to_char(hiredate, 'YYYY');

-- 8. 5개씩 급여합계와 인원수를 출력 (rownum이용)
SELECT      ceil(rownum/5), sum(sal) SUM, count(*)
FROM        emp
GROUP BY    ceil(rownum/5);

-- 9. 다음과 같이 출력 ( 실제 출력된 인원수가 다를 수도 있음 )
SELECT      COUNT(decode(job,'CLERK', 1)) CLERK,
            COUNT(decode(job,'SALESMAN',1)) SALESMAN,
            COUNT(decode(job,'MANAGER',1)) MANAGER
FROM emp;

-- 10. 다음과 같이 업무별, 부서별 출력 ( 실제 계산된 금액이 다를 수도 있음 )
SELECT      job AS 업무명,
            nvl(sum(decode(deptno,'10',sal)),0) "10번부서",
            nvl(sum(decode(deptno,'20',sal)),0) "20번부서",
            nvl(sum(decode(deptno,'30',sal)),0) "30번부서",
            sum(sal) as 급여합계
FROM        emp
GROUP BY    job;




