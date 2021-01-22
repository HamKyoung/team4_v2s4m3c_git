/**********************************/
/* Table Name: ������ */
/**********************************/
drop table admin;
CREATE TABLE admin(
		adminno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		id                        		VARCHAR2(50)		 NOT NULL UNIQUE,
		passwd                    		VARCHAR2(20)		 NOT NULL,
		name                      		VARCHAR2(20)		 NOT NULL
);

DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


-- ���
insert into admin(adminno, id, passwd, name)
values(admin_seq.nextval, 'admin', '1234', '������');

SELECT *
FROM admin;

SELECT COUNT(*) as cnt
FROM admin
WHERE id='admin' AND passwd='1234';


SELECT adminno, id, passwd, name
FROM admin
WHERE id = 'admin';


commit;