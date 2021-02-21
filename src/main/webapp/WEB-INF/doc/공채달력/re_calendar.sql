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
		COR_MEMBERNO                  		NUMBER(7)		 NULL ,
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
COMMENT ON COLUMN COM_INTRO.COR_MEMBERNO is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN COM_INTRO.VISIBLE is '��¸��';


/**********************************/
/* Table Name: ȸ���з� */
/**********************************/
CREATE TABLE COM_CATE(
		CATENO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		COMNO                         		NUMBER(10)		 NULL ,
		CATE_NAME                     		VARCHAR2(100)		 NOT NULL,
		CATE_SEQNO                    		NUMBER(10)		 NOT NULL,
		CATE_VISIBLE                  		CHAR(1)		 NOT NULL,
		CATE_DATE                     		DATE		 NOT NULL,
		CATE_CNT                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (COMNO) REFERENCES COM_INTRO (COMNO)
);

COMMENT ON TABLE COM_CATE is 'ȸ���з�';
COMMENT ON COLUMN COM_CATE.CATENO is '��з� ��ȣ';
COMMENT ON COLUMN COM_CATE.COMNO is 'ȸ���ȣ';
COMMENT ON COLUMN COM_CATE.CATE_NAME is '��з� �̸�';
COMMENT ON COLUMN COM_CATE.CATE_SEQNO is '��¼���';
COMMENT ON COLUMN COM_CATE.CATE_VISIBLE is '��¸��';
COMMENT ON COLUMN COM_CATE.CATE_DATE is '�����';
COMMENT ON COLUMN COM_CATE.CATE_CNT is '��ϵ� �� ��';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE RECRUIT(
		RECRUITNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		HOMEPAGE                      		VARCHAR2(500)		 NULL ,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		COMNO                         		NUMBER(8)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		SDATE                         		VARCHAR2(30)		 NULL ,
		EDATE                         		VARCHAR2(300)		 NULL ,
		FILE1                         		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (CATENO) REFERENCES COM_CATE (CATENO)
);

COMMENT ON TABLE RECRUIT is '����';
COMMENT ON COLUMN RECRUIT.RECRUITNO is '���ι�ȣ';
COMMENT ON COLUMN RECRUIT.CATENO is '��з� ��ȣ';
COMMENT ON COLUMN RECRUIT.TITLE is '����';
COMMENT ON COLUMN RECRUIT.SEQNO is '����';
COMMENT ON COLUMN RECRUIT.CONTENT is '����';
COMMENT ON COLUMN RECRUIT.HOMEPAGE is 'Ȩ������';
COMMENT ON COLUMN RECRUIT.VISIBLE is '��¸��';
COMMENT ON COLUMN RECRUIT.COMNO is 'ȸ���ȣ';
COMMENT ON COLUMN RECRUIT.PASSWD is '�н�����';
COMMENT ON COLUMN RECRUIT.WORD is '�˻���';
COMMENT ON COLUMN RECRUIT.RDATE is '�����';
COMMENT ON COLUMN RECRUIT.SDATE is '����������';
COMMENT ON COLUMN RECRUIT.EDATE is '����������';
COMMENT ON COLUMN RECRUIT.FILE1 is '���� �̹���';
COMMENT ON COLUMN RECRUIT.THUMB1 is '���� �̹��� Preview';
COMMENT ON COLUMN RECRUIT.SIZE1 is '���� �̹��� ũ��';


/**********************************/
/* Table Name: ��ä�޷� */
/**********************************/
drop table re_calendar;
CREATE TABLE re_calendar(
		calendar_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		RECRUITNO                     		NUMBER(10)		 NULL ,
		c_rdate                       		VARCHAR2(50)		 NOT NULL,
		c_edate                       		VARCHAR2(50)		 NOT NULL,
		c_title                       		VARCHAR2(300)		 NOT NULL,
		c_cnt                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		c_date                        		DATE		 NOT NULL,
  FOREIGN KEY (RECRUITNO) REFERENCES RECRUIT (RECRUITNO)
);

COMMENT ON TABLE re_calendar is '��ä�޷�';
COMMENT ON COLUMN re_calendar.calendar_no is '��ä�޷¹�ȣ';
COMMENT ON COLUMN re_calendar.RECRUITNO is '���ι�ȣ';
COMMENT ON COLUMN re_calendar.c_rdate is '���� ������';
COMMENT ON COLUMN re_calendar.c_edate is '���� ������';
COMMENT ON COLUMN re_calendar.c_title is '����';
COMMENT ON COLUMN re_calendar.c_cnt is '��ȸ��';
COMMENT ON COLUMN re_calendar.c_date is '��ϳ�¥';



DROP SEQUENCE re_calendar_seq;
CREATE SEQUENCE re_calendar_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

  -- insert
INSERT INTO re_calendar(calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date)
VALUES(re_calendar_seq.nextval, 1, '2021-02-11', '2021-03-11', '����� ���մϴ�.', 0, sysdate);

INSERT INTO re_calendar(calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date)
VALUES(re_calendar_seq.nextval, 1, '2021-03-11', '2021-04-11', '���ο� ���', 0, sysdate);

INSERT INTO re_calendar(calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date)
VALUES(re_calendar_seq.nextval, 1, '2021-04-11', '2021-05-11', '�������� �� �� ����', 0, sysdate);

-- list
SELECT c.c_rdate, c.c_edate, c.c_title, c.RECRUITNO, ci.com_name
FROM re_calendar c, RECRUIT re, COM_CATE cc, COM_INTRO ci
WHERE re.RECRUITNO = c.RECRUITNO AND re.CATENO = cc.CATENO AND cc.comno = ci.comno
ORDER BY re.RECRUITNO DESC;


-- read, ��ȸ
SELECT calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date
FROM re_calendar
WHERE calendar_no = 1;



-- dalete, ����
DELETE FROM re_calendar
WHERE calendar_no = 4;


-- update, ����
UPDATE re_calendar
SET c_rdate='2021-02-20', c_edate='2021-02-21'
WHERE calendar_no = 1;



commit;









