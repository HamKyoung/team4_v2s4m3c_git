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
DROP TABLE recruit CASCADE CONSTRAINTS;
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
        sdate                                 VARCHAR2(30)         NULL ,
        edate                                 VARCHAR2(300)         NULL ,
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
COMMENT ON COLUMN recruit.sdate is '����������';
COMMENT ON COLUMN recruit.edate is '����������';
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
INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020�� �Ϲݱ� ���� ����ä��', 1, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020�⵵ �����׷� ���� / ��»�� ����', 2, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020�⵵ �Ｚ�׷� ���Ը���', 3, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);
             
INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2021�⵵ ���� ���� / ��»�� ����', 4, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);


INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021�� ������ ä��', 1, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021�⵵ �����׷� ���� / ��»�� ����', 2, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021�⵵ īī�� ��¸���', 3, '�츮�� ���̴´�' ,'http://www.daum.net',
             '1234', '�Ϲݱ�', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);
            
commit;

2) ��ü���
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;

2-1) cateno�� ���
SELECT recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1
FROM recruit 
WHERE cateno = 1
ORDER BY recruitno DESC;

3) 1�� ��ȸ
SELECT recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1
FROM recruit
WHERE recruitno = 1;

4) ����
UPDATE recruit 
SET file1='', thumb1='', size1=0
commit;


UPDATE recruit 
SET title='����', content='����', homepage='http://', word='�˻���'
WHERE recruitno = 1;

COMMIT;

-- �� ����, id="delete"
DELETE FROM recruit
WHERE recruitno=1;

-- �н����� �˻�, id="passwd_check"
SELECT COUNT(*) as passwd_cnt
FROM recruit
WHERE recruitno=5 AND passwd='1234';


