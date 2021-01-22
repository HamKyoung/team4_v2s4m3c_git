/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
drop table cor_member;
CREATE TABLE cor_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		cor_id                        		VARCHAR2(50)		 NOT NULL UNIQUE,
		cor_passwd                    		VARCHAR2(20)		 NOT NULL,
		cor_name                      		VARCHAR2(20)		 NOT NULL,
		cor_resident                  		VARCHAR2(13)		 NOT NULL,
		cor_sex                       		VARCHAR2(10)		 NOT NULL,
		cor_phone                     		VARCHAR2(20)		 NOT NULL,
		cor_zipcode                   		VARCHAR2(5)		 NULL ,
		cor_addr                      		VARCHAR2(100)		 NULL ,
		cor_addr1                     		VARCHAR2(50)		 NULL ,
		cor_mail                      		VARCHAR2(50)		 NOT NULL,
		cor_date                      		DATE		 NOT NULL
);

COMMENT ON TABLE cor_member is '��� ȸ��';
COMMENT ON COLUMN cor_member.cor_memberno is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN cor_member.cor_id is '��� ȸ�� ���̵�';
COMMENT ON COLUMN cor_member.cor_passwd is '��� ȸ�� ��й�ȣ';
COMMENT ON COLUMN cor_member.cor_name is '��� ȸ�� �̸�';
COMMENT ON COLUMN cor_member.cor_resident is '��� ȸ�� �������';
COMMENT ON COLUMN cor_member.cor_sex is '��� ȸ�� ���� ';
COMMENT ON COLUMN cor_member.cor_phone is '��� ȸ�� ��ȭ ��ȣ';
COMMENT ON COLUMN cor_member.cor_zipcode is '��� ȸ�� ���� ��ȣ';
COMMENT ON COLUMN cor_member.cor_addr is '��� ȸ�� �ּ�';
COMMENT ON COLUMN cor_member.cor_addr1 is '��� ȸ�� �ּ�1';
COMMENT ON COLUMN cor_member.cor_mail is '��� ȸ�� �̸���';
COMMENT ON COLUMN cor_member.cor_date is '��� ȸ�� ���� ��¥';

DROP SEQUENCE cor_member_seq;
CREATE SEQUENCE cor_member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


-- ���
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test1', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test2', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM cor_member;

-- ���
SELECT cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date
FROM cor_member
ORDER BY cor_memberno ASC;

-- ��ȸ
SELECT cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date
FROM cor_member
WHERE cor_memberno = 1;

-- ����
UPDATE cor_member
SET cor_id='test2', cor_passwd='1234', cor_name='test', cor_resident='961111', cor_sex='����', cor_phone='0101111111', cor_addr='�ּ�', cor_mail='����'
WHERE cor_memberno = 4;

-- ����
DELETE FROM cor_member
WHERE cor_memberno =1;

--��й�ȣ ����
UPDATE cor_member
SET cor_passwd='1234'
WHERE cor_memberno=2;

commit;

-- �α���
SELECT COUNT(*) as cnt
FROM cor_member
WHERE cor_id='test' AND cor_passwd='1234';

-- id�� �̿��� ȸ�� ���� ��ȸ
SELECT cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date
FROM cor_member
WHERE cor_id = 'test';

