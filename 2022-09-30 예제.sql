-- 1. sawon ���̺��� �����ϼ���
CREATE TABLE sawon
(
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30),
    weolgub         number(10,2),
    buseo           number(3)
);

-- 2. ���� ���̺��� sabun�� �⺻Ű�� ����
ALTER TABLE sawon
    ADD CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun);

-- 3. �ִ� �ѱ� 10�ڸ��� jiyeok �÷��� �߰��ϵ� NULL���� �Էµ��� �ʵ��� ����
ALTER TABLE sawon ADD (jiyeok varchar2(30) NOT NULL);

-- 4. weolgub �÷��� ������ 7�ڸ��� ����
ALTER TABLE sawon MODIFY (weolgub number(7));

-- 5. ubmu �÷��� '����', '��������', '����'�� ������ ������ �Էµǵ��� ����
ALTER TABLE sawon
    ADD CONSTRAINT ck_sawon CHECK (ubmu in('����','��������','����'));

-- 6. ubmu �÷��� �����Ͱ� �Է��� �� �� ��� ����Ʈ������ '����'�� ����
ALTER TABLE sawon
    MODIFY (ubmu varchar2(30) DEFAULT '����');
   
-- 7. buseo ���̺��� ���� 
CREATE TABLE buseo
(
    buseo_no        number(3),
    buseo_name      varchar2(30),
    CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);

-- 8. sawon ���̺��� buseo �÷��� buseo ���̺��� buseo_no�� �����ϴ� �ܷ�Ű�� ����
ALTER TABLE sawon
    ADD CONSTRAINT fk_sawon_buseo FOREIGN KEY (buseo) REFERENCES buseo (buseo_no);

-- 9. buseo ���̺� ������ �Է�
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES ( 101, '����Ʈ��������������' );
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES ( 202, '������' );
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES ( 303, '�����ڿ���' );

-- 10. sawon ���̺� ������ �Է� (�Է��� �ȵ� ��쵵 ����)
INSERT INTO sawon ( sabun, sawon_name, weolgub, buseo, jiyeok )
VALUES ( 8001, 'ȫ�浿�̱�', 100000, 101, '�λ�');  

-- ����: ���� üũ���� '�繫' �Ұ�
INSERT INTO sawon ( sabun, sawon_name, ubmu, weolgub, buseo, jiyeok )
VALUES ( 8001, 'ȫ����', '�繫', 200000, 201, '��õ'); 

-- ����: �μ� �ڵ尡 �ܷ�Ű�� ���
INSERT INTO sawon ( sabun, sawon_name, ubmu, buseo, jiyeok )
VALUES ( 8003, 'ȫ���', '����', 111, '����'); 

-- ����: ������ ���� 7�ڸ�����
INSERT INTO sawon ( sabun, sawon_name, weolgub, jiyeok )
VALUES ( 8004, 'ȫ�漮', 12345678, '����'); 

INSERT INTO sawon ( sabun, sawon_name, ubmu,buseo, jiyeok )
VALUES ( 8005, 'ȫ��ö', '��������', 303, '�Ǳ�');

-- 11. sawon ���̺��� jiyeok �÷��� ����
ALTER TABLE sawon DROP COLUMN jiyeok;

-- 12. buseo ���̺��� buseo ���� �������ڿ��Ρ��� ���� ����
-- ����: �� ���� �ܷ�Ű�� ���� ȫ��ö ���� �־
DELETE FROM buseo WHERE buseo_name='�����ڿ���';

-- 13. sawon ���̺��� ��� ������ �����ϰ� ��������� ����
TRUNCATE TABLE sawon;
DROP TABLE sawon;
COMMIT;

-- 14. 1~8 �ܰ������ ������ ���̺��� ���� �ϳ��� CREATE ������ �ۼ�
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
    ubmu            varchar2(30) DEFAULT '����',
    weolgub         number(7),
    buseo           number(3),
    jiyeok          varchar2(30) NOT NULL,
    CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
    CONSTRAINT fk_sawon_buseo FOREIGN KEY (buseo) REFERENCES buseo (buseo_no)
);


