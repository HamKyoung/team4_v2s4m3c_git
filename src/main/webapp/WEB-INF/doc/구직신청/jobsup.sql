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


/**********************************/
/* Table Name: ���� */
/**********************************/
drop table recruit;
CREATE TABLE recruit(
		recruitno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
        seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		content                       		CLOB		 NOT NULL,
		homepage                      		VARCHAR2(500)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		comno                         		NUMBER(8)         DEFAULT 0         NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
        word                                  VARCHAR2(300)         NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,
  FOREIGN KEY (cateno) REFERENCES COM_CATE (cateno)
);

COMMENT ON TABLE recruit is '����';
COMMENT ON COLUMN recruit.recruitno is '���ι�ȣ';
COMMENT ON COLUMN recruit.cateno is '��з� ��ȣ';
COMMENT ON COLUMN recruit.title is '����';
COMMENT ON COLUMN recruit.seqno is '����';
COMMENT ON COLUMN recruit.content is '����';
COMMENT ON COLUMN recruit.homepage is 'Ȩ������';
COMMENT ON COLUMN recruit.visible is '��¸��';
COMMENT ON COLUMN recruit.comno is 'ȸ���ȣ';
COMMENT ON COLUMN recruit.passwd is '�н�����';
COMMENT ON COLUMN recruit.word is '�˻���';
COMMENT ON COLUMN recruit.rdate is '�����';
COMMENT ON COLUMN recruit.file1 is '���� �̹���';
COMMENT ON COLUMN recruit.thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN recruit.size1 is '���� �̹��� ũ��';


DROP SEQUENCE recruit_seq;
CREATE SEQUENCE recruit_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

  
1) �� ���(�̹��� ���� �÷� �߰�)
-- cateno: 1�� ������ ����̵Ǿ� �־�� INSERT ����
INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020�� �Ϲݱ� ���� ����ä��', 1, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020�⵵ �����׷� ���� / ��»�� ����', 2, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020�⵵ �Ｚ�׷� ���Ը���', 3, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
             
INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2021�⵵ ���� ���� / ��»�� ����', 4, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
            
commit;

2) ��ü���
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;


/**********************************/
/* Table Name: �̷¼� */
/**********************************/
CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		res_phone                     		VARCHAR2(60)		 NOT NULL,
		res_mail1                      		VARCHAR2(200)		 NOT NULL,
		res_mail2                      		VARCHAR2(200)		 NOT NULL,
		res_title.                     		VARCHAR2(100)		    NOT NULL,
		res_intro                     		VARCHAR2(800)		    NOT NULL,
		res_work                      	CLOB		                    DEFAULT 0		 NULL ,
		res_web                       	VARCHAR2(100)		NULL ,
		res_visible                   	CHAR(1)		            DEFAULT 'Y'	 NOT NULL,
		res_date                      		DATE		                NOT NULL,
		res_pic                       		VARCHAR2(100)		 NULL ,
		res_thumb                     	VARCHAR2(100)		 NULL ,
		res_size                      		NUMBER(10)		         NULL ,
		gen_memberno               	NUMBER(7)		         NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE mem_res_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

/**********************************/
/* Table Name: �̷¼� �з����� */
/**********************************/
CREATE TABLE res_scho(
		res_scname                     VARCHAR2(80)		            NOT NULL,
		res_major1                        VARCHAR2(100)		        NOT NULL,
		res_major2                    	VARCHAR2(100)		        NULL ,
		res_gotin                     		VARCHAR2(50)		            NOT NULL,
		res_grad                      	VARCHAR2(50)		            NOT NULL,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

/**********************************/
/* Table Name: �ڰ��� */
/**********************************/
CREATE TABLE res_lice(
		res_lice1                     		VARCHAR2(50)		 NULL 		 ,
		res_lice1_lev                 		VARCHAR2(30)		 NULL ,
		res_lice2                     		VARCHAR2(50)		 NULL,
		res_lice2_lev                 		VARCHAR2(30)		 NULL ,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

-- ���
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, 'ȫ�浿', '010-1234-5678', 'abcde', 'naver.com', '�ȳ��ϼ���', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '��ҿ�',  '010-1234-5678', 'abcde', 'naver.com', '�ȳ��ϼ���', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '��ö��',  '010-1234-5678', 'abcde', 'naver.com', '�ȳ��ϼ���', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 3);

INSERT INTO res_scho(res_scname, res_major1, res_major2, res_gotin,res_grad)
VALUES('������б�', '���������������Ӿִϸ��̼ǰ��к�', '��ȸ�����а�', 980076,998076);

INSERT INTO res_lice(res_lice1, res_lice1_lev, res_lice2, res_lice2_lev)
VALUES('����', 960, '�佺', 7, 2);

INSERT ALL
INTO mem_res
VALUES(mem_res_seq.nextval, '������', '01012554841', 'abcde', 'naver.com', '����', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 1)
INTO res_scho
VALUES ('���ִ��б�', '������а�', '�Ź�����а�', 200106, 201115,mem_res_seq.nextval)
INTO res_lice
VALUES('����', 990, '�佺', 9,mem_res_seq.nextval)
SELECT * FROM DUAL; 


-- ���
SELECT*FROM mem_res ORDER BY res_no ASC;
SELECT*FROM res_scho;
SELECT*FROM res_lice;
SELECT*FROM mem_res ORDER BY gen_memberno ASC;

-- ��ȸ
SELECT r.res_no as mem_res_res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, 
s.res_no as res_scho_res_no, res_scname, res_major1, res_major2, res_gotin,res_grad, 
l.res_no as res_lice_res_no, res_lice1, res_lice1_lev, res_lice2, res_lice2_lev
FROM mem_res r, res_scho s, res_lice l
WHERE r.res_no=s.res_no AND s.res_no=l.res_no AND r.res_no = 1;

-- ����
UPDATE mem_res
SET res_visible='N'
WHERE res_no = 1;

-- ����
DELETE mem_res
WHERE res_no = 8;

COMMIT;

/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE com_intro CASCADE CONSTRAINTS; 
DROP TABLE com_intro;

CREATE TABLE com_intro(
		comno                         		NUMBER(7)		    NOT NULL		 PRIMARY KEY,
		com_name                      	VARCHAR2(1000)		 NOT NULL,
		com_form                      		VARCHAR2(1000)		 NOT NULL,
		com_type                      		VARCHAR2(1000)		 NOT NULL,
		sales                         		    VARCHAR2(50)	         NOT NULL,
		homepage                      	VARCHAR2(1000)		 NOT NULL,
		address                       		VARCHAR2(1000)		 NOT NULL,
		num_people                    	VARCHAR2(50)	         NOT NULL,
		edate                          		VARCHAR2(500)	                 NOT NULL,
		ceo_name                      		VARCHAR2(1000)		 NOT NULL,
        visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '�ֵ���ũ','�п�','��ǻ���п�','10���','www.soldesk.com','���α���ö��','50��','2010-01-01','�ֿ���','Y');

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '�Ｚ����','000','000','10���','www.soldesk.com','���α���ö��','1000��','2010-01-01','�ֿ���','Y');


-- ���
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name,visible
FROM com_intro
ORDER BY comno ASC;


commit;

/**********************************/
/* Table Name: ������û */
/**********************************/
DROP TABLE jobsup;
CREATE TABLE jobsup(
		jobsupno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        comno                               NUMBER(10)         NOT NULL,
        recruitno                             NUMBER(10)		 NOT NULL,
        gen_memberno                  	NUMBER(7)		 NOT NULL,  
        res_no                                NUMBER(10)		 NOT NULL,
		jobsup_title                  		VARCHAR2(300)		 NOT NULL,
		jobsup_msg                    		VARCHAR2(1000)		 NOT NULL,
		jobsup_date                   		DATE		 NOT NULL,
FOREIGN KEY (comno) REFERENCES com_intro (comno),        
FOREIGN KEY (recruitno) REFERENCES recruit (recruitno),
FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno),
FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

COMMENT ON TABLE jobsup is '���� ��û';
COMMENT ON COLUMN jobsup.jopsupno is '���� ��û ��ȣ';
COMMENT ON COLUMN jobsup.comno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN jobsup.recruitno is 'ä�� ��ȣ';
COMMENT ON COLUMN jobsup.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN jobsup.res_no is '�̷¼� ��ȣ';
COMMENT ON COLUMN jobsup.jopsup_title is '���� ����';
COMMENT ON COLUMN jobsup.jobsup_msg is '���� �޼���';
COMMENT ON COLUMN jobsup.jobsup_date is '���� �����';

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
INSERT INTO jobsup(jobsupno, comno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 1, 1, 1, '�������ϰ� �Ĳ��ѻ���Դϴ�.', '���� �� ȸ�翡 �����ϰ� ���� ������ ������ �����ʿ��ؼ� �Դϴ�.', sysdate);

INSERT INTO jobsup(jobsupno, comno ,recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 2, 2, 2, 2, '�������ϰ� �Ĳ��ѻ���Դϴ�.', '���� �� ȸ�翡 �����ϰ� ���� ������ ������ �����ʿ��ؼ� �Դϴ�.', sysdate);

INSERT INTO jobsup(jobsupno, comno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 3, 3, 3, 3, '�������ϰ� �Ĳ��ѻ���Դϴ�.', '���� �� ȸ�翡 �����ϰ� ���� ������ ������ �����ʿ��ؼ� �Դϴ�.', sysdate);
  
COMMIT;

-- ���
SELECT jobsupno, comno, recruitno, gen_memberno, res_no, jobsup_title, jobsup_msg, jobsup_date
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

UPDATE jobsup
SET recruitno = 2;
WHERE jobsupno = 2;

UPDATE jobsup
SET recruitno = 3;
WHERE jobsupno = 3;

-- ����
DELETE jobsup
WHERE jobsupno = 44;

COMMIT;