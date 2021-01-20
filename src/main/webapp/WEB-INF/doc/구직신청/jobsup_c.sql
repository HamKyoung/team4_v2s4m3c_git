/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE com_intro;
CREATE TABLE com_intro(
comno                          NUMBER(10)  NOT NULL  PRIMARY KEY,
com_name                       VARCHAR2(50)  NOT NULL,
com_form                       VARCHAR2(20)  NOT NULL,
com_type                           VARCHAR2(100)  NOT NULL,
sales                          VARCHAR2(50)  NOT NULL,
homepage                       VARCHAR2(50)  NOT NULL,
address                        VARCHAR2(100)  NOT NULL,
num_people                     NUMBER(10)  NOT NULL,
e_date                           DATE  NOT NULL,
ceo_name                       VARCHAR2(10)  NOT NULL
);

COMMENT ON TABLE com_intro is 'ȸ��Ұ�';
COMMENT ON COLUMN com_intro.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_intro.com_name is 'ȸ���̸�';
COMMENT ON COLUMN com_intro.com_form is '�������';
COMMENT ON COLUMN com_intro.com_type is '����';
COMMENT ON COLUMN com_intro.sales is '�����';
COMMENT ON COLUMN com_intro.homepage is 'Ȩ������';
COMMENT ON COLUMN com_intro.address is 'ȸ���ּ�';
COMMENT ON COLUMN com_intro.num_people is '�����';
COMMENT ON COLUMN com_intro.e_date is '������';
COMMENT ON COLUMN com_intro.ceo_name is '��ǥ�ڸ�';

DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage, address, num_people, e_date, ceo_name)
VALUES(comintro_seq.nextval, '���̹�Ŭ����', '1000����', '���� �� ��Ÿ ���ͳ� �����Ű� ���񽺾�', '4925�� 8052����', 'http://www.nbp-corp.com/', '��� ������ �д籸 �д系���117 11��', 8, sysdate, '�ڿ���');

COMMIT;

-- ���
SELECT comno, com_name, com_form, com_type, sales, homepage,address,num_people,e_date,ceo_name
FROM com_intro
ORDER BY comno ASC;

-- ��ȸ
SELECT comno, com_name, com_form, com_type, sales, homepage, address,num_people, e_date,ceo_name
FROM com_intro
WHERE comno=2;

-- ����
UPDATE com_intro
SET com_form='����'
WHERE cateno = 1;

-- ����
DELETE cate
WHERE cateno = 3;



/**********************************/
/* Table Name: �Ϲ� ȸ�� */
/**********************************/
DROP TABLE gen_member;
CREATE TABLE gen_member(
gen_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
gen_id                         VARCHAR2(50)  NOT NULL UNIQUE ,
gen_passwd                     VARCHAR2(20)  NOT NULL,
gen_name                       VARCHAR2(20)  NOT NULL,
gen_resident                   VARCHAR2(13)  NOT NULL,
gen_sex                        VARCHAR2(10)  NOT NULL,
gen_phone                      VARCHAR2(20)  NOT NULL,
gen_zipcode                    VARCHAR2(5)  NULL ,
gen_addr                       VARCHAR2(100)  NULL ,
gen_addr1                      VARCHAR2(50)  NULL ,
gen_mail                       VARCHAR2(50)  NOT NULL,
gen_date                       DATE  NOT NULL
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
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 'test@test.com', sysdate);

SELECT * FROM gen_member;

-- ���
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- ��ȸ
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;

COMMIT;

-- ����
UPDATE gen_member
SET gen_id='test4', gen_name='test', gen_resident='2222222', gen_sex='����', gen_phone='010222222222', gen_addr='�׽�Ʈ�� �׽�Ʈ��', gen_mail='����'
WHERE gen_memberno = 4;

-- ����
DELETE FROM gen_member
WHERE gen_memberno =1;

COMMIT;

/**********************************/
/* Table Name: ������û */
/**********************************/
DROP TABLE jobsup;
CREATE TABLE jobsup(
		jobsupno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        gen_memberno                  		NUMBER(7)		 NOT NULL ,
		comno                        		NUMBER(10)		 NOT NULL ,
		jobsup_title                  		VARCHAR2(300)		 NOT NULL,
		jobsup_msg                    		VARCHAR2(1000)		 NOT NULL,
		jobsup_date                   		DATE		 NOT NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE jobsup is '���� ��û';
COMMENT ON COLUMN jobsup.jopsupno is '���� ��û ��ȣ';
COMMENT ON COLUMN jobsup.jopsup_title is '���� ����';
COMMENT ON COLUMN jobsup.jobsup_msg is '���� �޼���';
COMMENT ON COLUMN jobsup.jobsup_date is '���� �����';
COMMENT ON COLUMN jobsup.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN jobsup.comno is 'ȸ�� ��ȣ';

COMMIT;

DROP SEQUENCE jobsup_seq;
CREATE SEQUENCE jobsup_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
 COMMIT; 
  
  
-- ���
INSERT INTO jobsup(jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 2, '�������ϰ� �Ĳ��ѻ���Դϴ�.', '���� �� ȸ�翡 �����ϰ� ���� ������ ������ �����ʿ��ؼ� �Դϴ�.', sysdate);
  
COMMIT;

-- ���
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
ORDER BY jobsupno ASC;

-- ��ȸ
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
WHERE jobsupno = 1;

-- ����
UPDATE jobsup
SET jobsup_title='�������ϰ� �Ĳ��ѻ���Դϴ�.', jobsup_msg='�����ʿ��ؼ� �Դϴ�'
WHERE jobsupno = 1;



COMMIT;
