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
/**********************************/
/* Table Name: �Ϲ� ȸ�� */
/**********************************/
CREATE TABLE GEN_MEMBER(
		GEN_MEMBERNO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		GEN_ID                        		VARCHAR2(50)		 NOT NULL,
		GEN_PASSWD                    		VARCHAR2(20)		 NOT NULL,
		GEN_NAME                      		VARCHAR2(20)		 NOT NULL,
		GEN_RESIDENT                  		VARCHAR2(13)		 NOT NULL,
		GEN_SEX                       		VARCHAR2(10)		 NOT NULL,
		GEN_PHONE                     		VARCHAR2(20)		 NOT NULL,
		GEN_ZIPCODE                   		VARCHAR2(5)		 NULL ,
		GEN_ADDR                      		VARCHAR2(100)		 NULL ,
		GEN_ADDR1                     		VARCHAR2(50)		 NULL ,
		GEN_MAIL                      		VARCHAR2(50)		 NOT NULL,
		GEN_DATE                      		DATE		 NOT NULL,
  CONSTRAINT SYS_C008198 UNIQUE (GEN_ID)
);

COMMENT ON TABLE GEN_MEMBER is '�Ϲ� ȸ��';
COMMENT ON COLUMN GEN_MEMBER.GEN_MEMBERNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN GEN_MEMBER.GEN_ID is 'ȸ�� ���̵�';
COMMENT ON COLUMN GEN_MEMBER.GEN_PASSWD is '��й�ȣ ';
COMMENT ON COLUMN GEN_MEMBER.GEN_NAME is 'ȸ�� �̸�';
COMMENT ON COLUMN GEN_MEMBER.GEN_RESIDENT is '�������';
COMMENT ON COLUMN GEN_MEMBER.GEN_SEX is '����';
COMMENT ON COLUMN GEN_MEMBER.GEN_PHONE is '��ȭ ��ȣ';
COMMENT ON COLUMN GEN_MEMBER.GEN_ZIPCODE is '���� ��ȣ';
COMMENT ON COLUMN GEN_MEMBER.GEN_ADDR is 'ȸ�� �ּ�';
COMMENT ON COLUMN GEN_MEMBER.GEN_ADDR1 is 'ȸ�� �ּ�1';
COMMENT ON COLUMN GEN_MEMBER.GEN_MAIL is '�̸���';
COMMENT ON COLUMN GEN_MEMBER.GEN_DATE is '���� ��¥';

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


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE QUESTIONS(
		QUES_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		GEN_MEMBERNO                  		NUMBER(7)		 NOT NULL,
		QUES_TITLE                    		VARCHAR2(200)		 NOT NULL,
		QUES_CON                      		CLOB(4000)		 NOT NULL,
		QUES_DATE                     		DATE		 NOT NULL,
		QUES_VIEWS                    		NUMBER(10)		 NOT NULL,
		QUES_PASSWD                   		VARCHAR2(10)		 NOT NULL,
  FOREIGN KEY (GEN_MEMBERNO) REFERENCES GEN_MEMBER (GEN_MEMBERNO)
);

COMMENT ON TABLE QUESTIONS is '����';
COMMENT ON COLUMN QUESTIONS.QUES_NO is '���� ��ȣ';
COMMENT ON COLUMN QUESTIONS.GEN_MEMBERNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN QUESTIONS.QUES_TITLE is '���� ����';
COMMENT ON COLUMN QUESTIONS.QUES_CON is '���� ����';
COMMENT ON COLUMN QUESTIONS.QUES_DATE is '���� ��ϳ�¥';
COMMENT ON COLUMN QUESTIONS.QUES_VIEWS is '���� ��ȸ��';
COMMENT ON COLUMN QUESTIONS.QUES_PASSWD is '���� ��й�ȣ';


DROP TABLE questions;

DROP SEQUENCE questions_seq;
CREATE SEQUENCE questions_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

  -- insert
INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', 'ù��° ����', '������ �������� �Դϱ�?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', '�ι�° ����', '������ ���� �Դϱ�?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '2', '����° ����', '������ ��� �Դϱ�?', sysdate, '0', '1234');

-- list
SELECT ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd
FROM questions
ORDER BY ques_no ASC;

SELECT q.ques_no, q.gen_memberno, q.ques_title, q.ques_con, q.ques_date, q.ques_views, q.ques_passwd, gm.gen_name
FROM questions q, gen_member gm
WHERE q.gen_memberno = gm.gen_memberno
ORDER BY q.ques_no DESC;



/**********************************/
/* Table Name: �亯 */
/**********************************/
CREATE TABLE ANSWER(
		ANS_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		QUES_NO                       		NUMBER(10)		 NULL ,
		ANS_TITLE                     		VARCHAR2(200)		 NOT NULL,
		ANS_CON                       		CLOB(4000)		 NOT NULL,
		ANS_DATE                      		DATE		 NOT NULL,
		ANS_VIEWS                     		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (QUES_NO) REFERENCES QUESTIONS (QUES_NO)
);

COMMENT ON TABLE ANSWER is '�亯';
COMMENT ON COLUMN ANSWER.ANS_NO is '�亯 ��ȣ';
COMMENT ON COLUMN ANSWER.QUES_NO is '���� ��ȣ';
COMMENT ON COLUMN ANSWER.ANS_TITLE is '�亯 ����';
COMMENT ON COLUMN ANSWER.ANS_CON is '�亯 ����';
COMMENT ON COLUMN ANSWER.ANS_DATE is '�亯 ��ϳ�¥';
COMMENT ON COLUMN ANSWER.ANS_VIEWS is '�亯 ��ȸ��';


DROP TABLE answer;

DROP SEQUENCE answer_seq;

CREATE SEQUENCE answer_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����



INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '1', 'ù��° ������ ���� �亯', 'ù��° �亯�Դϴ�.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '2', '�ι�° ������ ���� �亯', '�ι�° �亯�Դϴ�.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '3', '����° ������ ���� �亯', '����° �亯�Դϴ�.', sysdate, '0');

-- list
SELECT ans_no, ques_no, ans_title, ans_con, ans_date, ans_views
FROM answer
ORDER BY ques_no ASC;


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE NOTICE(
		NOTICE_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NOTICE_NAME                   		VARCHAR2(200)		 NOT NULL,
		NOTICE_CON                    		CLOB(4000)		 NOT NULL,
		NOTICE_SEQNO                  		NUMBER(7)		 NOT NULL,
		NOTICE_VIEWS                  		NUMBER(10)		 NOT NULL,
		NOTICE_VISIBLE                		CHAR(1)		 NOT NULL,
		NOTICE_DATE                   		DATE		 NOT NULL,
		NOTICE_FILE1                  		VARCHAR2(100)		 NULL ,
		NOTICE_THUMB1                 		VARCHAR2(100)		 NULL ,
		NOTICE_SIZE1                  		NUMBER(10)		 NULL ,
		NOTICE_WORD                   		VARCHAR2(300)		 NULL 
);

ALTER TABLE notice
ADD (notice_word VARCHAR2(300));

COMMENT ON TABLE NOTICE is '��������';
COMMENT ON COLUMN NOTICE.NOTICE_NO is '�������� ��ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_NAME is '�������� ����';
COMMENT ON COLUMN NOTICE.NOTICE_CON is '�������� ����';
COMMENT ON COLUMN NOTICE.NOTICE_SEQNO is '�������� ��� ����';
COMMENT ON COLUMN NOTICE.NOTICE_VIEWS is '�������� ��ȸ��';
COMMENT ON COLUMN NOTICE.NOTICE_VISIBLE is '�������� ��¸��';
COMMENT ON COLUMN NOTICE.NOTICE_DATE is '�������� �ۼ���¥';
COMMENT ON COLUMN NOTICE.NOTICE_FILE1 is '�������� �̹���';
COMMENT ON COLUMN NOTICE.NOTICE_THUMB1 is '�������� ���� �̹��� Preview';
COMMENT ON COLUMN NOTICE.NOTICE_SIZE1 is '���� �̹��� ũ��';
COMMENT ON COLUMN NOTICE.NOTICE_WORD is 'NOTICE_WORD';


DROP TABLE notice;

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

  -- insert
INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, 'ù��° ��������', 'ù��° �������� ����', '1', '0', 'N', sysdate, 'notice.jpg', 'notice_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, '�ι�° ��������', '�ι�° �������� ����', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1, notice_word)
VALUES(notice_seq.nextval, '����° ��������', '����° �������� ����', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657, '�˸�');

-- list
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_word
FROM notice
ORDER BY notice_seqno ASC;

/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
CREATE TABLE COM_INTRO(
		COMNO                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COM_NAME                      		VARCHAR2(1000)		 NOT NULL,
		COM_FORM                      		VARCHAR2(1000)		 NOT NULL,
		COM_TYPE                      		VARCHAR2(1000)		 NOT NULL,
		SALES                         		VARCHAR2(50)		 NOT NULL,
		HOMEPAGE                      		VARCHAR2(1000)		 NOT NULL,
		ADDRESS                       		VARCHAR2(1000)		 NOT NULL,
		NUM_PEOPLE                    		VARCHAR2(50)		 NOT NULL,
		EDATE                         		VARCHAR2(500)		 NOT NULL,
		CEO_NAME                      		VARCHAR2(1000)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE COM_INTRO is 'ȸ��Ұ�';
COMMENT ON COLUMN COM_INTRO.COMNO is 'ȸ���ȣ';
COMMENT ON COLUMN COM_INTRO.COM_NAME is 'ȸ���̸�';
COMMENT ON COLUMN COM_INTRO.COM_FORM is '�������';
COMMENT ON COLUMN COM_INTRO.COM_TYPE is '����';
COMMENT ON COLUMN COM_INTRO.SALES is '�����';
COMMENT ON COLUMN COM_INTRO.HOMEPAGE is 'Ȩ������';
COMMENT ON COLUMN COM_INTRO.ADDRESS is 'ȸ���ּ�';
COMMENT ON COLUMN COM_INTRO.NUM_PEOPLE is '�����';
COMMENT ON COLUMN COM_INTRO.EDATE is '������';
COMMENT ON COLUMN COM_INTRO.CEO_NAME is '��ǥ�ڸ�';
COMMENT ON COLUMN COM_INTRO.VISIBLE is '��¸��';


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


DROP SEQUENCE jobsup_seq;
CREATE SEQUENCE jobsup_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 
-- ���
INSERT INTO jobsup(jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 2, '�������ϰ� �Ĳ��ѻ���Դϴ�.', '���� �� ȸ�翡 �����ϰ� ���� ������ ������ �����ʿ��ؼ� �Դϴ�.', sysdate);
  

-- ���
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
ORDER BY jobsupno ASC;
 
 COMMIT;
 /**********************************/
/* Table Name: ȸ��ī�װ�(������) */
/**********************************/
drop table com_cate;
CREATE TABLE com_cate(
		cateno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		comno                           NUMBER(10)		 NULL ,
		cate_name                      VARCHAR2(100)		 NOT NULL,
		cate_seqno                     NUMBER(10)		 DEFAULT 0		 NOT NULL,
		cate_visible                     CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		cate_date                        DATE		 NOT NULL,
		cate_cnt                    		 NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (comno) REFERENCES  com_intro(comno)
);

COMMENT ON TABLE com_cate is 'ȸ���з�';
COMMENT ON COLUMN com_cate.cateno is '��з� ��ȣ';
COMMENT ON COLUMN com_cate.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_cate.cate_name is '��з� �̸�';
COMMENT ON COLUMN com_cate.cate_seqno is '��¼���';
COMMENT ON COLUMN com_cate.cate_visible is '��¸��';
COMMENT ON COLUMN com_cate.cate_date is '�����';
COMMENT ON COLUMN com_cate.cate_cnt is '��ϵ� �� ��';

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


--���  
--(�θ����̺� ����)
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,cor_memberno,visible)
VALUES(comintro_seq.nextval, '�ֵ���ũ','�п�','��ǻ���п�','10���','www.soldesk.com','���α���ö��','50��','2010-01-01','�ֿ���',1,'Y');

--(�ڽ����̺�)
INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 1, '�濵���繫', 1, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 1, '�����ã�����ȫ��', 2, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 1, 'IT�����ͳ�', 3, 'Y', sysdate, 0);


-- ���
SELECT cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt
FROM com_cate
ORDER BY cateno ASC;

SELECT r.comno as r_comno, r.com_name as r_com_name,
           c.cateno, c.comno, c.cate_name, c.cate_seqno, c.cate_visible, c.cate_date, c.cate_cnt
FROM com_intro r, com_cate c
WHERE r.comno = c.comno
ORDER BY r.comno ASC, c.cate_seqno ASC;

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


INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021�� ������ ä��', 1, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021�⵵ �����׷� ���� / ��»�� ����', 2, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021�⵵ īī�� ��¸���', 3, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


2) ��ü���
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;


/**********************************/
/* Table Name: ÷������ */
/**********************************/
DROP TABLE attachfile;
CREATE TABLE attachfile(
        attachfileno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        recruitno                   NUMBER(10)         NULL ,
        fname                             VARCHAR2(100)         NOT NULL,
        fupname                      VARCHAR2(100)         NOT NULL,
        thumb                         VARCHAR2(100)         NULL ,
        fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE     NOT NULL,
  FOREIGN KEY (recruitno) REFERENCES recruit (recruitno)
);

COMMENT ON TABLE attachfile is '÷������';
COMMENT ON COLUMN attachfile.recruitno is '���ι�ȣ';
COMMENT ON COLUMN attachfile.contentsno is '��������ȣ';
COMMENT ON COLUMN attachfile.fname is '���� ���ϸ�';
COMMENT ON COLUMN attachfile.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN attachfile.thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN attachfile.fsize is '���� ������';
COMMENT ON COLUMN attachfile.rdate is '�����';

DROP SEQUENCE attachfile_seq;
CREATE SEQUENCE attachfile_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- 1) ���  
INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   


-- 2) ���( contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachfileno, recruitno, fname, fupname, thumb, fsize, rdate
FROM attachfile
ORDER BY recruitno DESC,  attachfileno ASC;

/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
CREATE TABLE CORPORATE_MEMBER(
		COR_MEMBERNO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COR_ID                        		VARCHAR2(50)		 NOT NULL,
		COR_PASSWD                    		VARCHAR2(20)		 NOT NULL,
		COR_NAME                      		VARCHAR2(20)		 NOT NULL,
		COR_RESIDENT                  		VARCHAR2(13)		 NOT NULL,
		COR_SEX                       		VARCHAR2(10)		 NOT NULL,
		COR_PHONE                     		VARCHAR2(20)		 NOT NULL,
		COR_ADDR                      		VARCHAR2(100)		 NOT NULL,
		COR_MAIL                      		VARCHAR2(50)		 NOT NULL,
		COR_DATE                      		DATE		 NOT NULL
);

COMMENT ON TABLE CORPORATE_MEMBER is '��� ȸ��';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_MEMBERNO is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_ID is '��� ȸ�� ���̵�';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_PASSWD is '��� ȸ�� ��й�ȣ';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_NAME is '��� ȸ�� �̸�';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_RESIDENT is '��� ȸ�� �ֹ� ��ȣ';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_SEX is '��� ȸ�� ���� ';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_PHONE is '��� ȸ�� ��ȭ ��ȣ';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_ADDR is '��� ȸ�� �ּ�';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_MAIL is '��� ȸ�� �̸���';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_DATE is '��� ȸ�� ���� ��¥';

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

commit;

/**********************************/
/* Table Name: �հ��ڼҼ� */
/**********************************/
DROP TABLE  PASS_SELF;
CREATE TABLE PASS_SELF(
		PASS_SELF_NO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COMNO                         		NUMBER(10)		 NULL ,
		COR_MEMBERNO                  		NUMBER(7)		 NULL ,
		PASS_SELF_TITLE               		VARCHAR2(200)		 NOT NULL,
		PASS_SELF_ITEM1               		VARCHAR2(500)		 NOT NULL,
		PASS_SELF_ITEM2               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ITEM3               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ITEM4               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ITEM5               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ANS1                		VARCHAR2(2000)		 NOT NULL,
		PASS_SELF_ANS2                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_ANS3                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_ANS4                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_ANS5                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_DATE                		DATE		 NOT NULL,
		PASS_SELF_VIEWS               		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (COMNO) REFERENCES COM_INTRO (COMNO),
  FOREIGN KEY (COR_MEMBERNO) REFERENCES CORPORATE_MEMBER (COR_MEMBERNO)
);

COMMENT ON TABLE PASS_SELF is '�հ��ڼҼ�';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_NO is '�հ��ڼҼ� ��ȣ';
COMMENT ON COLUMN PASS_SELF.COMNO is 'ȸ���ȣ';
COMMENT ON COLUMN PASS_SELF.COR_MEMBERNO is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_TITLE is '�հ��ڼҼ� ����';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM1 is '�հ��ڼҼ� �׸�1';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM2 is '�հ��ڼҼ� �׸�2';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM3 is '�հ��ڼҼ� �׸�3';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM4 is '�հ��ڼҼ� �׸�4';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM5 is '�հ��ڼҼ� �׸�5';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS1 is '�հ��ڼҼ� �亯1';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS2 is '�հ��ڼҼ� �亯2';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS3 is '�հ��ڼҼ� �亯3';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS4 is '�հ��ڼҼ� �亯4';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS5 is '�հ��ڼҼ� �亯5';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_DATE is '�հ��ڼҼ� �����';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_VIEWS is '�հ��ڼҼ� ��ȸ��';

DROP SEQUENCE pass_self_seq;
CREATE SEQUENCE pass_self_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '�հ��ڼҼ� ����', 'ù��° �׸�', '�ι�° �׸�', '����° �׸�', '�׹�° �׸�', '������ �׸�', 'ù��° �亯', '�ι�° �亯', '����° �亯', '�׹�° �亯',
'�ټ���° �亯', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '�հ��ڼҼ� ����2', 'ù��° �׸�2', '�ι�° �׸�2', '����° �׸�2', '�׹�° �׸�2', '������ �׸�2', 'ù��° �亯2', '�ι�° �亯2', '����° �亯2', '�׹�° �亯2',
'�ټ���° �亯2', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '�հ��ڼҼ� ����3', 'ù��° �׸�3', '�ι�° �׸�3', '����° �׸�3', '�׹�° �׸�3', '������ �׸�3', 'ù��° �亯3', '�ι�° �亯3', '����° �亯3', '�׹�° �亯3',
'�ټ���° �亯3', sysdate, '0');
  
-- list
SELECT pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views
FROM pass_self
ORDER BY pass_self_no DESC;

SELECT p.pass_self_no, p.comno, p.cor_memberno, p.cor_memberno, p.pass_self_title, p.pass_self_date, p.pass_self_views, c.com_name
FROM pass_self p, conpany_intro c
WHERE p.comno = c.comno
ORDER BY pass_self_no DESC;

commit;


/**********************************/
/* Table Name: ȸ�紺�� */
/**********************************/
DROP TABLE jobnws;
CREATE TABLE jobnws(
		jobnwsno                        		NUMBER(30)		 NOT NULL,
		jobnws_title                    		VARCHAR2(1000)		 NOT NULL,
		jobnws_content                  		CLOB 		 NOT NULL,
		jobnws_url                      		VARCHAR2(500)		 NOT NULL,
        jobnws_passwd                      	VARCHAR2(15)		 NOT NULL,
		jobnws_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_good                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_coment                   		VARCHAR2(1000)		 NULL ,
		jobnws_date                     		DATE		 NOT NULL,
		jobnws_file1                    		VARCHAR2(100)		 NULL ,
		jobnws_thumb1                       VARCHAR2(100)		 NULL ,
		jobnws_size1                    		NUMBER(10)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE jobnws is 'ȸ�紺��';
COMMENT ON COLUMN jobnws.jobnwsno is '���� ��ȣ';
COMMENT ON COLUMN jobnws.jobnws_title is '���� ����';
COMMENT ON COLUMN jobnws.jobnws_content is '���� ����';
COMMENT ON COLUMN jobnws.jobnws_url is '���� ��ó';
COMMENT ON COLUMN jobnws.jobnws_cnt is '���� ��ȸ��';
COMMENT ON COLUMN jobnws.jobnws_good is '���� ��õ��';
COMMENT ON COLUMN jobnws.jobnws_coment is '���� ���';
COMMENT ON COLUMN jobnws.jobnws_date is '�����';
COMMENT ON COLUMN jobnws.jobnws_file1 is '���� ���� �̹���';
COMMENT ON COLUMN jobnws.jobnws_thumb1 is '���� ���� �̹��� Preview';
COMMENT ON COLUMN jobnws.jobnws_size1 is '���� ���� �̹��� ũ��';


ALTER TABLE jobnws ADD CONSTRAINT IDX_jobnws_PK PRIMARY KEY (jobnwsno);


DROP SEQUENCE jobnws_seq;
CREATE SEQUENCE jobnws_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
/**********************************/
/* Table Name:  ���� */
/**********************************/

-- ���
INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- ���� ���̺� �߰�
INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1 )
VALUES(jobnws_seq.nextval, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 'LGä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM jobnws ORDER BY jobnwsno ASC;

COMMIT;


/**********************************/
/* Table Name: �������� */
/**********************************/
drop table surveymember;
drop table surveyitem;
drop table survey;
CREATE TABLE survey(
		surveyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		topic                         		VARCHAR2(200)		 NOT NULL,
		startdate                     	VARCHAR2(10)		 NOT NULL,
		enddate                       	VARCHAR2(10)		 NOT NULL,
		poster                        	VARCHAR2(100)	     NULL,
		cnt                           		NUMBER(7)		     NULL ,
		continueyn                    		CHAR(1)		     NOT NULL
);

COMMENT ON TABLE survey is '��������';
COMMENT ON COLUMN survey.surveyno is '���������ȣ';
COMMENT ON COLUMN survey.topic is '����';
COMMENT ON COLUMN survey.startdate is '���۳�¥';
COMMENT ON COLUMN survey.enddate is '���� ��¥';
COMMENT ON COLUMN survey.poster is '������ ����';
COMMENT ON COLUMN survey.cnt is '�����ο�';
COMMENT ON COLUMN survey.continueyn is '���࿩��';

DROP SEQUENCE survey_seq;
CREATE SEQUENCE survey_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '��������', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '��������1', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '��������2', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '��������2', '2020-11-04', '2020-11-11', ' ', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, 'topic', '2020-11-04', '2020-11-11', ' ', 1, 'Y');

ALTER TABLE survey
ADD (word VARCHAR2(300));

--���
SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn, word
FROM survey 
ORDER BY surveyno ASC;

SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn, word
FROM survey 
WHERE (topic LIKE '%' || 'topic' || '%' 
             OR poster LIKE '%' || topic || '%' 
             OR word LIKE '%' || topic || '%')
ORDER BY surveyno DESC;  

commit;

/**********************************/
/* Table Name: ���� ���� �׸� */
/**********************************/
drop table surveyitem;
DROP SEQUENCE surveyitem_seq;

CREATE TABLE surveyitem(
		sur_itemno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		surveyno                      		NUMBER(10)		 NOT NULL,
		itemseq                       		NUMBER(2)	DEFAULT 1	 NOT NULL,
		item                          		VARCHAR2(200)		 NOT NULL,
		itemfile                      		VARCHAR2(100)		 NULL,
		itemcnt                       		NUMBER(7)	DEFAULT 0	 NOT NULL,
  FOREIGN KEY (surveyno) REFERENCES survey (surveyno)
);

COMMENT ON TABLE surveyitem is '���� ���� �׸�';
COMMENT ON COLUMN surveyitem.sur_itemno is '���� ���� �׸� ��ȣ';
COMMENT ON COLUMN surveyitem.surveyno is '���� ���� ��ȣ';
COMMENT ON COLUMN surveyitem.itemseq is '�׸� ��� ����';
COMMENT ON COLUMN surveyitem.item is '�׸�';
COMMENT ON COLUMN surveyitem.itemfile is '�׸� ����';
COMMENT ON COLUMN surveyitem.itemcnt is '�׸� ���� �ο�';

drop table surveyitem;
DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
-- ���
INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '�׽�Ʈ', '����', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '�׽�Ʈ', '����', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '�׽�Ʈ', '����', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, 'test', 'file', 0);

ALTER TABLE surveyitem
ADD (word VARCHAR2(300));

-- ���
SELECT sur_itemno, surveyno, itemseq, item, itemfile, itemcnt, word
FROM surveyitem 
ORDER BY itemseq ASC;

commit;

-- ��ȸ
SELECT sur_itemno, surveyno, itemseq, item, itemfile, itemcnt
FROM surveyitem 
WHERE sur_itemno=1;

/**********************************/
/* Table Name: ���� ���� ȸ�� */
/**********************************/
CREATE TABLE surveymember(
		sur_memberno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		sur_itemno                    		NUMBER(10)		 NOT NULL,
		gen_memberno                  		NUMBER(7)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (sur_itemno) REFERENCES surveyitem (sur_itemno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE surveymember is '���� ���� ȸ��';
COMMENT ON COLUMN surveymember.sur_memberno is '���� ���� ȸ�� ��ȣ';
COMMENT ON COLUMN surveymember.sur_itemno is '���� ���� �׸� ��ȣ';
COMMENT ON COLUMN surveymember.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN surveymember.rdate is '���� ���� ��¥';

DROP SEQUENCE surveymember_seq;
CREATE SEQUENCE surveymember_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 1, sysdate);

INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 2, sysdate);

INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 3, sysdate);

-- ���
SELECT sur_memberno, sur_itemno, gen_memberno, rdate
FROM surveymember 
ORDER BY sur_memberno ASC;

commit;

-- ��ȸ
SELECT sur_memberno, sur_itemno, gen_memberno, rdate
FROM surveymember 
WHERE sur_memberno=1;


--��� ����
SELECT s.sur_memberno, s.sur_itemno, s.gen_memberno, s.rdate, g.gen_id as gid
FROM surveymember s , gen_member g
WHERE s.gen_memberno = g.gen_memberno
ORDER BY sur_memberno ASC


/**********************************/
/* Table Name: �̷¼� */
/**********************************/

DROP TABLE mem_res CASCADE CONSTRAINTS;
DROP SEQUENCE mem_res_seq;

DROP TABLE res_scho CASCADE CONSTRAINTS;
DROP TABLE res_lice CASCADE CONSTRAINTS;

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
           '��±��', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 3);       
           
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


/**********************************/
/* Table Name: ȸ�縮�� */
/**********************************/
CREATE TABLE com_review(
		rev_no                        		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(50)		 NOT NULL,
		rev_title                     		    VARCHAR2(50)		 NOT NULL,
		rev_score                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rev_depart                    		VARCHAR2(50)		 NOT NULL,
		rev_content                   		VARCHAR2(1000)		 NOT NULL,
		rev_visible                   		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rev_good                      		NUMBER(10)		 NOT NULL,
		rev_bad                       		    NUMBER(10)		 NOT NULL,
		rev_date                      		    DATE		 NOT NULL,
		rev_cnt                           		    NUMBER(10)		 NOT NULL,
		comno                         		    NUMBER(10)		 NULL,
		gen_memberno                   NUMBER(7)		 NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE com_review_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

COMMENT ON TABLE com_review is 'ȸ�縮��';
COMMENT ON COLUMN com_review.rev_no is '���� ��ȣ';
COMMENT ON COLUMN com_review.com_name is '���';
COMMENT ON COLUMN com_review.rev_title is '���� ����';
COMMENT ON COLUMN com_review.rev_score is 'ȸ�� ����';
COMMENT ON COLUMN com_review.rev_depart is '�ٹ��μ�';
COMMENT ON COLUMN com_review.rev_content is '���� ����';
COMMENT ON COLUMN com_review.rev_visible is '��¸��';
COMMENT ON COLUMN com_review.rev_good is '��õ��';
COMMENT ON COLUMN com_review.rev_bad is '�Ű��';
COMMENT ON COLUMN com_review.rev_date is '�ۼ���';
COMMENT ON COLUMN com_review.rev_cnt is '��ϵ� �� ��';
COMMENT ON COLUMN com_review.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_review.gen_memberno is 'ȸ�� ��ȣ';

-- ���
INSERT INTO com_review(rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, 
rev_visible, rev_good, rev_bad, rev_date, rev_cnt, comno, gen_memberno)
VALUES(com_review_seq.nextval, '�ֵ���ũ', '����', '5', '����', '������ ����� �п�', 
'Y', '1','0', sysdate, '1', '1', '1');

INSERT INTO com_review(rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, 
rev_visible, rev_good, rev_bad, rev_date, rev_cnt, comno, gen_memberno)
VALUES(com_review_seq.nextval, '���ϱ�ȹ', '����', '5', '�����͸�����', '���� ������', 
'Y', '1','0', sysdate, '1', '2', '2');

-- ���
SELECT*FROM com_review ORDER BY rev_no ASC;

commit;

