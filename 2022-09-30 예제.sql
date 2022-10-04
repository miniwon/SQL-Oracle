-- 1. sawon 테이블을 생성하세요
CREATE TABLE sawon
(
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30),
    weolgub         number(10,2),
    buseo           number(3)
);

-- 2. 위의 테이블에서 sabun을 기본키로 설정
ALTER TABLE sawon
    ADD CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun);

-- 3. 최대 한글 10자리의 jiyeok 컬럼을 추가하되 NULL값이 입력되지 않도록 지정
ALTER TABLE sawon ADD (jiyeok varchar2(30) NOT NULL);

-- 4. weolgub 컬럼은 정수형 7자리로 변경
ALTER TABLE sawon MODIFY (weolgub number(7));

-- 5. ubmu 컬럼은 '개발', '유지보수', '관리'만 데이터 값으로 입력되도록 지정
ALTER TABLE sawon
    ADD CONSTRAINT ck_sawon CHECK (ubmu in('개발','유지보수','관리'));

-- 6. ubmu 컬럼에 데이터가 입력이 안 될 경우 디폴트값으로 '개발'을 설정
ALTER TABLE sawon
    MODIFY (ubmu varchar2(30) DEFAULT '개발');
   
-- 7. buseo 테이블을 생성 
CREATE TABLE buseo
(
    buseo_no        number(3),
    buseo_name      varchar2(30),
    CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);

-- 8. sawon 테이블의 buseo 컬럼을 buseo 테이블의 buseo_no를 참조하는 외래키로 설정
ALTER TABLE sawon
    ADD CONSTRAINT fk_sawon_buseo FOREIGN KEY (buseo) REFERENCES buseo (buseo_no);

-- 9. buseo 테이블에 데이터 입력
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES ( 101, '소프트웨어유지보수부' );
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES ( 202, '관리부' );
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES ( 303, '인적자원부' );

-- 10. sawon 테이블에 데이터 입력 (입력이 안될 경우도 있음)
INSERT INTO sawon ( sabun, sawon_name, weolgub, buseo, jiyeok )
VALUES ( 8001, '홍길동이군', 100000, 101, '부산');  

-- 오류: 업무 체크에서 '사무' 불가
INSERT INTO sawon ( sabun, sawon_name, ubmu, weolgub, buseo, jiyeok )
VALUES ( 8001, '홍길자', '사무', 200000, 201, '인천'); 

-- 오류: 부서 코드가 외래키에 없어서
INSERT INTO sawon ( sabun, sawon_name, ubmu, buseo, jiyeok )
VALUES ( 8003, '홍길순', '개발', 111, '대전'); 

-- 오류: 월급은 숫자 7자리까지
INSERT INTO sawon ( sabun, sawon_name, weolgub, jiyeok )
VALUES ( 8004, '홍길석', 12345678, '서울'); 

INSERT INTO sawon ( sabun, sawon_name, ubmu,buseo, jiyeok )
VALUES ( 8005, '홍길철', '유지보수', 303, '판교');

-- 11. sawon 테이블에서 jiyeok 컬럼을 제거
ALTER TABLE sawon DROP COLUMN jiyeok;

-- 12. buseo 테이블에서 buseo 명이 ‘인적자원부’인 행을 삭제
-- 오류: 이 값을 외래키로 쓰는 홍길철 씨가 있어서
DELETE FROM buseo WHERE buseo_name='인적자원부';

-- 13. sawon 테이블이 모든 내용을 삭제하고 저장공간을 해제
TRUNCATE TABLE sawon;
DROP TABLE sawon;
COMMIT;

-- 14. 1~8 단계까지를 각각의 테이블을 각각 하나의 CREATE 문으로 작성
DROP TABLE buseo;

CREATE TABLE buseo
(
    buseo_no        number(3),
    buseo_name      varchar2(30),
    CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);

CREATE TABLE sawon
(
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30) DEFAULT '개발',
    weolgub         number(7),
    buseo           number(3),
    jiyeok          varchar2(30) NOT NULL,
    CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
    CONSTRAINT fk_sawon_buseo FOREIGN KEY (buseo) REFERENCES buseo (buseo_no)
);


