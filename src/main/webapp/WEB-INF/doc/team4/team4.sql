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
            

2) ��ü���
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;


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

