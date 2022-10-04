--------------- [복습-과제] ---------------
-- 1. 2003년에 입사한 사원들의 사번, 이름, 입사일을 출력
SELECT employee_id, FIRST_NAME||' '||LAST_NAME AS EMPLOYEE_NAME, hire_date
FROM employees
WHERE to_char(hire_date, 'yyyy') = 2003;

-- 2. 업무가 FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP 인 사원들의 정보를 출력
SELECT *
FROM EMPLOYEES
WHERE job_id in ('FI_ACCOUNT', 'FI_MGR', 'SA_MAN', 'SA_REP');?

-- 3. 커미션을 받는 사원들의 명단을 출력
SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT is not null;

-- 4.업무가 SA_MAN 또는 SA_REP이면 "판매부서"를 그 외는 "그 외 부서"라고 출력
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS EMPLOYEE_NAME, decode(JOB_ID, 'SA_MAN', '판매부서', '그 외 부서') as JOB
FROM EMPLOYEES;

-- 5. 연도별로 입사자들의 최소급여, 최대 급여, 급여의 총합 그리고 평균 급여를 구하시오
SELECT to_char(hire_date, 'YYYY'), MIN(SALARY) MIN, MAX(SALARY) MAX, SUM(SALARY) SUM, AVG(SALARY) AVG
FROM EMPLOYEES
--WHERE
GROUP BY to_char(hire_date, 'YYYY')
ORDER BY to_char(hire_date, 'YYYY');

-- 6. 부서별 평균 급여가 $10,000 이상인 부서만 구하시오. ( 평균급여가 높은 순으로 )
SELECT      DEPARTMENT_ID, AVG(SALARY) AVG
FROM        EMPLOYEES
--WHERE
GROUP BY    DEPARTMENT_ID
HAVING      AVG(SALARY) >= 10000
ORDER BY    AVG(SALARY) desc;

-- 7. 부서별 최대 급여를 구하시오
SELECT      DEPARTMENT_ID, MAX(SALARY) MAX
FROM        EMPLOYEES
--WHERE
GROUP BY    DEPARTMENT_ID;