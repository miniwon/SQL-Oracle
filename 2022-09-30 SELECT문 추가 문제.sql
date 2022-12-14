--1. EMPLOYEES 테이블에서 사원 이름을 first_name과 last_name를 합쳐 full_name으로 출력
SELECT  first_name||' '||last_name As full_name
FROM    employees;

--2. 부서번호가 30(구매부서)이고 급여 10000미만인 사원의 full_name과 월급,부서번호를 출력
SELECT  first_name||' '||last_name As full_name, salary, department_id
FROM    employees
WHERE   department_id = 30 and salary < 100000;

--3. 부서번호가 30이고 급여가 10000달러 이하를 받는 2006년도 이전 입사한 사원의 full_name을 출력
SELECT  first_name||' '||last_name As full_name
FROM    employees
WHERE   department_id = 30 and salary <= 10000 and hire_date < '2006-01-01';

--4. 부서번호가 30(구매부서)이고 급여가 10000이하인 사원과 부서번호가 60(IT부서)에서 급여가 5000이상인 사원을 조회
SELECT  *
FROM    employees
WHERE   (department_id = 30 and salary <= 10000) OR (department_id = 60 and salary >= 5000);

--5. 사원번호가 110번에서 120번인 사원 중 급여가 5000에서 10000사이의 사원명단을 조회
SELECT  *
FROM    employees
WHERE   (employee_id >= 110 AND employee_id <= 120) AND (salary between 5000 and 10000);

--6. 사원번호가 110번에서 120번이 아닌 사원을 조회
SELECT  *
FROM    employees
WHERE   NOT (employee_id >= 110 AND employee_id <= 120);

--7. 부서번호가 30(구매부서), 60(IT부서), 90(경영부서)에 속한 사원을 조회
SELECT  *
FROM    employees
WHERE   department_id in (30, 60, 90);

--8. 부서번호가 30(구매부서), 60(IT부서), 90(경영부서) 외의 부서에 속한 사원을 조회
SELECT  *
FROM    employees
WHERE   department_id not in (30, 60, 90);

--9. 전화번호에서 590으로 시작하는 사원명과 전화번호를 조회
SELECT  first_name||' '||last_name As full_name, phone_number
FROM    employees
WHERE   phone_number like '590%';