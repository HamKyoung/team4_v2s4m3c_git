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


