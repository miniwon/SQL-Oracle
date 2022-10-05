--------------------------------
-- # HR 계정에서
--1. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )?
SELECT      e.employee_id AS 사번, d.department_name AS 부서명
FROM        EMPLOYEES e INNER JOIN DEPARTMENTS d
ON          e.department_id = d.department_id
WHERE       e.LAST_NAME = 'King';

--2. 이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )
SELECT      e.employee_id AS 사번, d.department_name AS 부서명, j.job_title AS 업무명
FROM        EMPLOYEES e, DEPARTMENTS d, JOBS j
WHERE       e.department_id = d.department_id
            AND e.job_id = j.job_id
            AND e.LAST_NAME = 'King';

SELECT      e.employee_id AS 사번, d.department_name AS 부서명, j.job_title AS 업무명
FROM        EMPLOYEES e INNER JOIN DEPARTMENTS d
            ON e.department_id = d.department_id
            INNER JOIN JOBS j
            ON e.job_id = j.job_id
WHERE       e.LAST_NAME LIKE 'King';

-- 3. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력
-- (*)Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면
SELECT      e.employee_id AS 사번, e.last_name AS 이름, e.hire_date AS 입사일, d.department_name AS 부서명
FROM        EMPLOYEES e, DEPARTMENTS d
WHERE       e.department_id = d.department_id(+);

SELECT      e.employee_id AS 사번, e.last_name AS 이름, e.hire_date AS 입사일, d.department_name AS 부서명
FROM        EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d
ON          e.department_id = d.department_id;

-- 4. 'Executive' 부서에서 사원과 해당 사원의 매니저(상사) 이름을 출력
-- (*) 매니저(상사)가 없는 사원인 'King'이 출력되려면
SELECT      e1.last_name AS 이름, e2.last_name AS 상사
FROM        EMPLOYEES e1, EMPLOYEES e2, DEPARTMENTS d
WHERE       e1.department_ID = d.department_ID
            AND e1.MANAGER_ID = e2.employee_id(+)
            AND d.department_name = 'Executive';
            
SELECT      e1.last_name AS 이름, e2.last_name AS 상사
FROM        EMPLOYEES e1 LEFT OUTER JOIN DEPARTMENTS d
            ON e1.department_id = d.department_id
            LEFT OUTER JOIN EMPLOYEES e2
            ON e1.MANAGER_id = e2.employee_ID
WHERE       d.department_name = 'Executive';