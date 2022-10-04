-- ###### ����Ŭ ���Խ� ǥ��
-- # �Ʒ��� ���� ���̺��� �����ϰ� ���ڵ带 �Է��� ��
-- # REGEXP_LIKE  �ܿ� REGEXP_REPALCE, REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT �Լ��� ���� �׷��� �Ʒ��� ������ regexp_like �Լ��� �̿��Ͽ��� ������.

-- ���̺� ����
CREATE TABLE reg_tab( text varchar2(20) );

-- ���ڵ� �Է�
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
INSERT INTO reg_tab VALUES('��');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('�����');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('����');
?
-- Ŀ��
COMMIT;

-- [ ���� ]
-- 1.  text �÷��� ���ڿ����� 't'�� �����ϴ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   substr(text, 1, 1) = 't';

SELECT  * 
FROM    reg_tab
WHERE   text LIKE 't%';

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^t');
-- ^����: ���ڿ� ���� �κа� ��ġ

-- 2.  text �÷��� ���ڿ����� 't'�� ������ ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   substr(text, length(text), 1) = 't';

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, 't$');
?-- ����$: ���ڿ� �� �κа� ��ġ

-- 3. ù��° 't'�� �����Ͽ� 5��° 'r'�� �ִ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   substr(text, 1, 1) = 't' and substr(text, 5, 1) = 'r';

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^t...r');
-- .: ������ �� ����
?
-- 4. ���ڷ� ������ ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '[0-9]$');
-- [...]: ��ȣ ���� ����Ʈ�� �ִ� ������ ���� ���ڿ� ��ġ

-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[0-9]');

-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[^0-9]');
-- [^]: �ش� ���ڿ� �ش����� �ʴ� �� ����

SELECT  * 
FROM    reg_tab
WHERE   NOT REGEXP_LIKE(text, '^[0-9]');
?
-- 7. �빮�ڷ� �����ϴ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[A-Z]');

-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[^a-z]');

SELECT  * 
FROM    reg_tab
WHERE   NOT REGEXP_LIKE(text, '^[a-z]');
?
-- 9. �ѱ۷� �����ϴ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, '^[��-�R]');

-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�
SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, 'gg|GG');

SELECT  * 
FROM    reg_tab
WHERE   REGEXP_LIKE(text, 'gg') or REGEXP_LIKE(text, 'GG');