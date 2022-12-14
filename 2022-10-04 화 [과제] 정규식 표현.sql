-- ###### 오라클 정규식 표현
-- # 아래와 같이 테이블을 생성하고 레코드를 입력한 후
-- # REGEXP_LIKE  외에 REGEXP_REPALCE, REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT 함수도 있음 그러나 아래의 예문은 regexp_like 함수를 이용하여도 무방함.

-- 테이블 생성
CREATE TABLE reg_tab( text varchar2(20) );

-- 레코드 입력
INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('개');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('고양이');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('박쥐');
?
-- 커밋
COMMIT;

-- [ 문제 ]
-- 1.  text 컬럼의 문자열에서 't'로 시작하는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   substr(text, 1, 1) = 't';

SELECT  * 
FROM    reg_tab
WHERE   text LIKE 't%';

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^t');
-- ^문자: 문자열 시작 부분과 일치

-- 2.  text 컬럼의 문자열에서 't'로 끝나는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   substr(text, length(text), 1) = 't';

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, 't$');
?-- 문자$: 문자열 끝 부분과 일치

-- 3. 첫번째 't'로 시작하여 5번째 'r'이 있는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   substr(text, 1, 1) = 't' and substr(text, 5, 1) = 'r';

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^t...r');
-- .: 임의의 한 문자
?
-- 4. 숫자로 끝나는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '[0-9]$');
-- [...]: 괄호 안의 리스트에 있는 임의의 단일 문자와 일치

-- 5. 숫자로 시작하는 데이타 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[0-9]');

-- 6. 숫자가 아닌 문자로 시작하는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[^0-9]');
-- [^]: 해당 문자에 해당하지 않는 한 문자

SELECT  * 
FROM    reg_tab
WHERE   NOT REGEXP_LIKE(text, '^[0-9]');
?
-- 7. 대문자로 시작하는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[A-Z]');

-- 8. 소문자 외의 문자로 시작하는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[^a-z]');

SELECT  * 
FROM    reg_tab
WHERE   NOT REGEXP_LIKE(text, '^[a-z]');
?
-- 9. 한글로 시작하는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[가-힣]');

-- 10. 데이터 중 'gg'나 'GG'가 들어있는 데이터 검색
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, 'gg|GG');

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, 'gg') or REGEXP_LIKE(text, 'GG');