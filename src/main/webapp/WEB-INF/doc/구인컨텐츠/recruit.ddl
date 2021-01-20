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
CREATE TABLE com_recruit(
		recruitno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB(10)		 NOT NULL,
		homepage                      		VARCHAR2(500)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		comno                         		NUMBER(10)		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
  FOREIGN KEY (CATENO) REFERENCES COM_CATE (CATENO)
);

COMMENT ON TABLE com_recruit is '����';
COMMENT ON COLUMN com_recruit.recruitno is '���ι�ȣ';
COMMENT ON COLUMN com_recruit.CATENO is '��з� ��ȣ';
COMMENT ON COLUMN com_recruit.title is '����';
COMMENT ON COLUMN com_recruit.content is '����';
COMMENT ON COLUMN com_recruit.homepage is 'Ȩ������';
COMMENT ON COLUMN com_recruit.visible is '��¸��';
COMMENT ON COLUMN com_recruit.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_recruit.passwd is '�н�����';


