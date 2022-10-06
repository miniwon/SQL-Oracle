-- ȸ�� ���̺�
create table    ex_member(
id              varchar2(10), -- ���̵�
pass            varchar2(10), -- �н�����
name            varchar2(20), -- �̸�
tel             varchar2(20), -- ��ȭ��ȣ
addr            varchar2(100) -- �ּ�
);

-- ��ǰ ���̺�
create table ex_good(
        gno     varchar2(10), -- ��ǰ��ȣ
        gname   varchar(30), -- ��ǰ��
        gdetail varchar2(300), -- �󼼼���
        price   number      -- ����
);

-- �ֹ� ���̺�
create table ex_order (
ono number, -- ��ȣ
orderno varchar2(20), -- �ֹ���ȣ
gno varchar2(10), -- ��ǰ��ȣ
id varchar2(10), -- ȸ�� ���̵�
count number, -- ����
status varchar2(10) -- ��ۻ���
);

ALTER TABLE ex_order MODIFY (status varchar2(20));


-- ######################################################
-- �ֹ����̺�� ȸ�����̺�, ��ǰ���̺��� ���踦 �δ´ٸ�?
-- �ֹ� ���̺��� �⺻Ű: id
ALTER TABLE ex_member
ADD CONSTRAINT pk_member_id PRIMARY KEY (id);

-- ��ǰ ���̺��� �⺻Ű: gno
ALTER TABLE ex_good
ADD CONSTRAINT pk_good_gno PRIMARY KEY (gno);

-- �ֹ� ���̺��� ��ǰ ��ȣ�� ȸ�� ���̵� �ܷ�Ű�� ALTER TABLE ex_good
ALTER TABLE ex_order
ADD CONSTRAINT fk_order_gno FOREIGN KEY (gno)
REFERENCES ex_good (gno);

ALTER TABLE ex_order
ADD CONSTRAINT fk_order_id FOREIGN KEY (id)
REFERENCES ex_member (id);


-- ȸ�� ���̺� ����Ÿ �Է�
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '��浿', '02-222-2222','���� ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '�ڱ浿', '03-333-3333','��õ ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '�ͱ浿', '04-444-4444','��� ������ �̻۵�');

commit;

-- ��ǰ ���̺� ����Ÿ �Է�
insert into ex_good( gno, gname, gdetail, price )
values('1001', '�Ӹ���', '���� ��� �Ӹ���', 200 );

insert into ex_good( gno, gname, gdetail, price )
values('2002', '������-A', '������� ������ �޸��� ������', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '������-B', '���� ������� ������ �����ϰ� �޸��ٴ� ������', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '�ڵ������̽�', '�ΰ� �����ϴ� �ڵ��� ���̽�', 1500 );

commit;

-- �ֹ� ���̺� ����Ÿ �˻�
insert into ex_order( ono, orderno, gno, id, count, status )
values( 1, '20161212', '1001', 'park', 1, '��ۿϷ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 2, '20161212', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 3, '20161111', '1001', 'kim', 2, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 4, '20161111', '3333', 'kim', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 5, '20163333', '1001', 'park', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 6, '20163333', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 7, '20163333', '2002', 'park', 2, '�ֹ�');?

insert into ex_order( ono, orderno, gno, id, count, status )
values( 8, '20165050', '1001', 'meng', 1, '�����');

commit;

-- ###############################################################
-- [ ���� ]
-- 1. ������� ��ǰ�� ���� ������ ���
SELECT *
FROM ex_good
WHERE gno IN (SELECT gno FROM ex_order WHERE status = '�����');

SELECT ono,status FROM ex_order WHERE status='�����';

SELECT o.status, g.gno, g.gname, g.gdetail, g.price
FROM ex_good g, ( SELECT gno, status FROM ex_order WHERE status = '�����' ) o
WHERE g.gno = o.gno;

-- 2. �ֹ� ���� ��ǰ ������ �� ���� ���
SELECT *
FROM    ex_order o INNER JOIN ex_member m
        ON o.id = m.id
        INNER JOIN ex_good g
        ON o.gno = g.gno
WHERE   o.status = '�ֹ�';

-- 3. �ֹ����� �� ����(���̵�)�� �ֹ��� ��ǰ�� �ѱݾ��� ���
SELECT  o.id, sum(g.price * o.count) AS "�� �ݾ�"
FROM    ex_order o INNER JOIN ex_member m
        ON o.id = m.id
        INNER JOIN ex_good g
        ON o.gno = g.gno
GROUP BY o.orderno, o.id;

-- [ �������� ]
-- 4. 3���� �ֹ� ������ ù���� ��ǰ�� �� �� ���� ���
-- [��] 20161212   �Ӹ��� �� 1��
SELECT  o.orderno --, decode(rownum, 1, g.gname) || ' �� ' || sum(count) -1
FROM    ex_order o INNER JOIN ex_member m
        ON o.id = m.id
        INNER JOIN ex_good g
        ON o.gno = g.gno
GROUP BY o.orderno, g.gno;

SELECT  o.orderno , min(g.gname) || ' �� ' || sum(count) -1
FROM    ex_order o INNER JOIN ex_member m
        ON o.id = m.id
        INNER JOIN ex_good g
        ON o.gno = g.gno
GROUP BY o.orderno, g.gno;

-- ��� Ʋ�Ⱦ��
SELECT E.ORDERNO, G.GNAME ||' ��'||(E.COUNT-1)||'��' GOOD
FROM (SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT
FROM EX_ORDER GROUP BY ORDERNO) E, EX_GOOD G
WHERE E.GNO=G.GNO;