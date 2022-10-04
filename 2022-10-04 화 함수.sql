----------- 3. SQL 함수 -----------
-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십 단위에서 반올림하여 출력
SELECT ename, sal, round(sal/12,-2) as wolgub
FROM emp;
-- 정수 부분을 기준으로 하고 싶으면 -, 양수를 적으면 소숫점 기준

-- 사원명, 급여, 세금(급여의 3.3%)를 원 단위 절삭하고 출력
SELECT ename, sal, TRUNC(sal*0.033, 0) as tax
FROM emp;

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
SELECT empno, ename, LOWER(job) as job
FROM emp
WHERE ename = 'SMITH';

SELECT empno, ename, LOWER(job) as job
FROM emp
WHERE ename = UPPER('smith');

SELECT empno, ename, LOWER(job) as job
FROM emp
WHERE LOWER(ename) = LOWER('smith');

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
SELECT empno, INITCAP(ename) as ename, INITCAP(job) as job
FROM emp;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE SUBSTR(ename, 1, 1) >= 'K' and SUBSTR(ename, 1, 1) <= 'Y'
ORDER BY ename;

-- 이름이 5글자 이상인 사원들을 출력
SELECT *
FROM emp
WHERE LENGTH(ename) >= 5;

-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
SELECT RPAD(ename, 15, '*') as ename
FROM emp;

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
SELECT LPAD(sal, 10, '-') as sal
FROM emp;

-- 양쪽 공백을 제거
select '-' || trim(' 이순신 ') || '-' as col1, 
'-' || ltrim(' 이순신 ') || '-' as col2, 
'-' || rtrim(' 이순신 ') || '-' as col3 from dual;
-- (*) dual : dummy 테이블로 sys user가 owner이고 모든 사용자가 사용가능.
-- 임의의 값을 알고자 할 경우 유용하게 사용하는 테이블.

SELECT name, SUBSTR(jumin, 8, 1) as gender, SUBSTR(jumin, 1, 2) as birth_year
FROM info_tab;

SELECT sysdate
FROM dual;

-- 급여를 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
SELECT TRANSLATE(sal, '0123456789', '영일이삼사오육칠팔구') as kor_sal
FROM emp;

-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
SELECT REPLACE(sal, 0, '$') as char_sal
FROM emp;

-- *****
SELECT REPLACE('         이    순    신  ', ' ', '') as ename
FROM dual;


-- 시스템의 날짜를 가져오는 함수 : 
--          SYSDATE, CURRENT_DATE, SYSTIMESTAMP, CURRENT_TIMESTAMP
--          (*) 이 함수들은 사용시 () 필요없음
--          (*) sysdate와 current_date의 차이는 current_date는 세션 시간을 따름.
--          만일 한 명은 한국에서 한 명은 미국에서 본사 시스템에 접속시 
--          각각 세션에 따른 시간을 확인하게 됨.

-- 현재까지 근무 일수가 많은 사람 순으로 출력
SELECT ename, hiredate, ceil(sysdate - hiredate) as "근무 일수"
FROM emp
ORDER BY sysdate - hiredate desc;

SELECT ename, hiredate, ceil(sysdate - hiredate) as "근무 일수"
FROM emp
ORDER BY sysdate - hiredate desc NULLS LAST;

-- 현재까지 근무 일수가 몇 주 몇 일인가를 출력
SELECT ename, sysdate-hiredate, TRUNC((sysdate-hiredate)/7, 0) as weeks,
        TRUNC(MOD(sysdate-hiredate, 7)) as days
FROM emp;

-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 
SELECT ename, TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) as "근무 월수"
FROM emp
WHERE deptno = 10;

SELECT ename, FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) as "근무 월수"
FROM emp
WHERE deptno = 10;

-- 현재 날짜에서 3개월 후의 날짜 구하기
select add_months( sysdate, 3 ) as mydate from dual;

-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
-- 일(1), 월(2), 화(3), 수(4)... 토(7)
SELECT NEXT_DAY( sysdate, 2) as next_monday
FROM dual;

SELECT NEXT_DAY( sysdate, '월') as next_monday
FROM dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
SELECT LAST_DAY(sysdate) as last_day
FROM dual;

-- 입사일자에서 입사년도를 출력
SELECT ename, hiredate, to_char(hiredate, 'YYYY') as hire_year
FROM emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
SELECT ename, hiredate, to_char(hiredate, 'YYYY"년 "MM"월 "DD"일"') as hiredate
FROM emp;

-- 1981년도에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') = 1981;

-- 5월에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate, 'MM') = 5;

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
SELECT ename, sal, to_char(sal, '$999,999,999,999,999') as dollar
FROM emp;

-- 81년 2월에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYYMM') = 198102;

SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') = 1981 AND to_char(hiredate, 'MM') = 2;
 
-- 81년에 입사하지 않은 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') != 1981;

-- 81년 하반기에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate, 'YYYY') = 1981 and to_char(hiredate, 'MM') >=7;

-- 주민등록번호에서 성별 구하기
SELECT decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') AS gender
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 
            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'
            ELSE '여자'
            END as gender
FROM info_tab;

-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
SELECT DISTINCT decode ( deptno, 10, '영업부', 20, '관리부', 30, 'IT부', '기술부') AS dept
FROM emp;

SELECT CASE deptno
            WHEN 10 THEN '영업부'
            WHEN 20 THEN '관리부'
            WHEN 30 THEN 'IT부'
            ELSE '기술부'
            END AS dept
FROM emp;

-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
SELECT empno, ename, job, sal, decode(lower(job), 'analyst', sal*1.1, 'clerk', sal*1.15, 'manager', sal*1.2, sal) AS sum_sal
FROM emp;

SELECT empno, ename, job, sal, CASE lower(job)
                                    WHEN 'analyst' THEN sal*1.1
                                    WHEN 'clerk'   THEN sal*1.15
                                    WHEN 'manager' THEN sal*1.2
                                    ELSE sal
                                    END AS sum_sal
FROM emp;

----------- 4. 그룹 함수 -----------
SELECT ALL job from emp;

SELECT DISTINCT job FROM emp;

desc emp;

SELECT rownum, empno, ename, job FROM emp;

SELECT rownum, empno, ename, job FROM emp WHERE rownum<=5;

-- (#) 함수 인자에 distinct를 이용하면 중복되지 않는 값으로 계산

-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
SELECT avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
FROM emp
WHERE job = 'SALESMAN';

INSERT INTO emp(empno, ename, job)
VALUES(9001, '홍길국', 'SALESMAN');

-- 커미션(COMM)을 받는 사람들의 수는
SELECT COUNT(*) as comm_people
FROM emp
WHERE comm > 0;

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
SELECT      deptno, count(*), avg(sal) avg, min(sal) min, max(sal) max, sum(sal) sum
FROM        emp
--WHERE
GROUP BY    deptno;
--HAVING
-- (#) 출력 컬럼은 (1)그룹핑하는 컬럼과 (2)집계함수만 가능

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 ( 부서별 급여의 합이 높은 순으로
SELECT      deptno, count(*), round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum
FROM        emp
--WHERE
GROUP BY    deptno
ORDER BY sum(sal) desc;
--HAVING

-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
SELECT      deptno, job, count(*), round(avg(sal)) avg, sum(sal) sum
FROM        emp
--WHERE
GROUP BY    deptno, job;
--HAVING

-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
SELECT      deptno, avg(sal) avg, sum(sal) sum
FROM        emp
--WHERE       
GROUP BY    deptno
HAVING      max(sal) >= 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
SELECT      job, avg(sal) avg, sum(sal) sum
FROM        emp
--WHERE       
GROUP BY    job
HAVING      avg(sal) >= 3000;

-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력
-- 단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
SELECT      job, sum(sal) sum
FROM        emp
WHERE       job != 'SALESMAN'
GROUP BY    job
HAVING      sum(sal) > 5000 --and job != 'SALESMAN'
ORDER BY    sum desc;

-- 업무별 최고 급여와 최소 급여의 차이를 구하라
SELECT      job, max(sal) - min(sal)
FROM        emp
--WHERE       
GROUP BY    job;
--HAVING;

-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
SELECT      deptno, count(*), sum(sal) sum
FROM        emp
--WHERE       
GROUP BY    deptno
HAVING      count(*) > 4;