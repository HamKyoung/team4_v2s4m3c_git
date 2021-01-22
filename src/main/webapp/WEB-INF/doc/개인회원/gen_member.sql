/**********************************/
/* Table Name: �Ϲ� ȸ�� */
/**********************************/
drop table gen_member;
CREATE TABLE gen_member(
		gen_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		gen_id                        		VARCHAR2(50)		 NOT NULL UNIQUE ,
		gen_passwd                    		VARCHAR2(20)		 NOT NULL,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		gen_resident                  		VARCHAR2(13)		 NOT NULL,
		gen_sex                       		VARCHAR2(10)		 NOT NULL,
		gen_phone                     		VARCHAR2(20)		 NOT NULL,
		gen_zipcode                   		VARCHAR2(5)		 NULL ,
		gen_addr                      		VARCHAR2(100)		 NULL ,
		gen_addr1                     		VARCHAR2(50)		 NULL ,
		gen_mail                      		VARCHAR2(50)		 NOT NULL,
		gen_date                      		DATE		 NOT NULL
);

COMMENT ON TABLE gen_member is '�Ϲ� ȸ��';
COMMENT ON COLUMN gen_member.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN gen_member.gen_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN gen_member.gen_passwd is '��й�ȣ ';
COMMENT ON COLUMN gen_member.gen_name is 'ȸ�� �̸�';
COMMENT ON COLUMN gen_member.gen_resident is '�������';
COMMENT ON COLUMN gen_member.gen_sex is '����';
COMMENT ON COLUMN gen_member.gen_phone is '��ȭ ��ȣ';
COMMENT ON COLUMN gen_member.gen_zipcode is '���� ��ȣ';
COMMENT ON COLUMN gen_member.gen_addr is 'ȸ�� �ּ�';
COMMENT ON COLUMN gen_member.gen_addr1 is 'ȸ�� �ּ�1';
COMMENT ON COLUMN gen_member.gen_mail is '�̸���';
COMMENT ON COLUMN gen_member.gen_date is '���� ��¥';

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
-- ���
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test1', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test2', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM gen_member;

commit;

-- ���
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- ��ȸ
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;

commit;

-- ����
UPDATE gen_member
SET gen_id='test4', gen_name='test', gen_resident='2222222', gen_sex='����', gen_phone='010222222222', gen_addr='�׽�Ʈ�� �׽�Ʈ��', gen_mail='����'
WHERE gen_memberno = 4;

-- ����
DELETE FROM gen_member
WHERE gen_memberno =1;

-- ���̵� �ߺ�üũ
SELECT COUNT(*) as id_cnt
FROM gen_member
WHERE gen_id='test2';

-- ��й�ȣ üũ
SELECT COUNT(*) as passwd_check
FROM gen_member
WHERE gen_memberno=24 AND gen_passwd='1234';

--��й�ȣ ����
UPDATE gen_member
SET gen_passwd='12345'
WHERE gen_memberno = 2;

--�α���
SELECT COUNT(*) as cnt
FROM gen_member
WHERE gen_id='test' AND gen_passwd='1234';

-- id�� �̿��� ȸ�� ���� ��ȸ
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
WHERE gen_id = 'test';


