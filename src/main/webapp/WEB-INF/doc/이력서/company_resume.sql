DROP TABLE mem_res CASCADE CONSTRAINTS;
DROP SEQUENCE mem_res_seq;

DROP TABLE res_scho CASCADE CONSTRAINTS;
DROP TABLE res_lice CASCADE CONSTRAINTS;

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
  
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 'test@test.com', sysdate);

select*from gen_member;



/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
CREATE TABLE cor_member(
cor_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
cor_id                         VARCHAR2(50)  NOT NULL UNIQUE,
cor_passwd                     VARCHAR2(20)  NOT NULL,
cor_name                       VARCHAR2(20)  NOT NULL,
cor_resident                   VARCHAR2(13)  NOT NULL,
cor_sex                        VARCHAR2(10)  NOT NULL,
cor_phone                      VARCHAR2(20)  NOT NULL,
cor_zipcode                    VARCHAR2(5)  NULL ,
cor_addr                       VARCHAR2(100)  NULL ,
cor_addr1                      VARCHAR2(50)  NULL ,
cor_mail                       VARCHAR2(50)  NOT NULL,
cor_date                       DATE  NOT NULL
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
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 'test@test.com', sysdate);



/**********************************/
/* Table Name: �̷¼� */
/**********************************/
CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		        NOT NULL,
		res_phone                     		VARCHAR2(60)		        NOT NULL,
		res_mail                    		    VARCHAR2(200)		    NOT NULL,
		res_intro                     		    VARCHAR2(800)		    NOT NULL,
        res_school                           VARCHAR2(80)		        NOT NULL,
		res_major                            VARCHAR2(100)		    NOT NULL,
        res_lice                     		    VARCHAR2(50)		        NULL,
		res_lice_lev                 		    VARCHAR2(30)		        NULL ,
		res_work                      	    CLOB		                    DEFAULT 0		 NULL ,
		res_web                       	    VARCHAR2(100)		    NULL ,
		res_visible                   	        CHAR(1)		                DEFAULT 'Y'	 NOT NULL,
		res_date                      		DATE		                    NOT NULL,
		res_pic                       		    VARCHAR2(100)		    NULL ,
		res_thumb                     	    VARCHAR2(100)		    NULL ,
		res_size                      		    NUMBER(10)		        NULL ,
		gen_memberno               	    NUMBER(7)		            NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE MEM_RES is '�̷¼�';
COMMENT ON COLUMN MEM_RES.RES_NO is '�̷¼� ��ȣ';
COMMENT ON COLUMN MEM_RES.GEN_NAME is 'ȸ�� �̸�';
COMMENT ON COLUMN MEM_RES.RES_PHONE is '����ó';
COMMENT ON COLUMN MEM_RES.RES_MAIL is '�̸���';
COMMENT ON COLUMN MEM_RES.RES_INTRO is '�ڱ�Ұ�';
COMMENT ON COLUMN MEM_RES.RES_SCHOOL is '�����з�';
COMMENT ON COLUMN MEM_RES.RES_MAJOR is '����';
COMMENT ON COLUMN MEM_RES.RES_LICE is '�ڰ���';
COMMENT ON COLUMN MEM_RES.RES_LICE_LEV is '�ڰ��� �޼�';
COMMENT ON COLUMN MEM_RES.RES_WORK is '��±����';
COMMENT ON COLUMN MEM_RES.RES_WEB is '��ũ';
COMMENT ON COLUMN MEM_RES.RES_VISIBLE is '���� ����';
COMMENT ON COLUMN MEM_RES.RES_DATE is '�ۼ���';
COMMENT ON COLUMN MEM_RES.RES_PIC is '����';
COMMENT ON COLUMN MEM_RES.RES_THUMB is '�����';
COMMENT ON COLUMN MEM_RES.RES_SIZE is '���� �뷮';
COMMENT ON COLUMN MEM_RES.GEN_MEMBERNO is 'ȸ�� ��ȣ';

CREATE SEQUENCE mem_res_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, 'ȫ�浿', '01012345678', 'team4@naver.com', '�ڱ�Ұ��Դϴ�.', '�ϳ�����б�', '�ι���', '����', '900',
           '��±��', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '���浿', '01012345678', 'team4@naver.com', '�ڱ�Ұ��Դϴ�.', '�ϳ�����б�', '�ι���', '����', '900',
           '��±��', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '���浿', '01012345678', 'team4@naver.com', '�ڱ�Ұ��Դϴ�.', '�ϳ�����б�', '�ι���', '����', '900',
           '��±��', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 5);       
           
--���
SELECT * FROM mem_res
ORDER BY res_no ASC;


-- �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM mem_res
WHERE res_work LIKE '%���%';

-- step 3, 1 page
SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
          res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, r
FROM (
           SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                     res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, rownum as r
           FROM (
                     SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno
                     FROM mem_res
                     WHERE res_work LIKE '%���%'
                     ORDER BY res_no DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
          res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, r
FROM (
           SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                     res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, rownum as r
           FROM (
                     SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno
                     FROM mem_res
                     WHERE res_work LIKE '%���%'
                     ORDER BY res_no DESC
           )          
)
WHERE r >= 11 AND r <= 20;

-- read, ��ȸ
SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
          res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno
FROM mem_res
WHERE res_no = 1;

-- update, ����
UPDATE mem_res
SET gen_name='���浿', res_phone='���� �Ϸ�', res_mail='���� �Ϸ�', res_intro='���� �Ϸ�',res_school='���� �Ϸ�',res_major='���� �Ϸ�',res_lice='���� �Ϸ�'
WHERE res_no = 1;

-- dalete, ����
DELETE FROM mem_res
WHERE res_no = 3;

-- ��� ����� ����
UPDATE mem_res
SET res_visible='N'
WHERE res_no=1;

COMMIT;