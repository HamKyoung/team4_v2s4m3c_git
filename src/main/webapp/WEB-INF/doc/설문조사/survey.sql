/**********************************/
/* Table Name: �������� */
/**********************************/
drop table surveymember;
drop table surveyitem;
drop table survey;
CREATE TABLE survey(
    surveyno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    topic                             VARCHAR2(200)    NOT NULL,
    startdate                       VARCHAR2(10)     NOT NULL,
    enddate                         VARCHAR2(10)     NOT NULL,
    poster                          VARCHAR2(100)      NULL,
    cnt                               NUMBER(7)        NULL ,
    continueyn                        CHAR(1)        NOT NULL
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

--��ȸ
SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn
FROM survey 
WHERE surveyno=1;

--����
UPDATE survey 
SET topic='����', startdate='2020.01.10', enddate='2020.01.21', poster='�˻���', cnt=2
WHERE surveyno=1;

--����
DELETE FROM survey
WHERE surveyno=1;

/**********************************/
/* Table Name: �Ϲ� ȸ�� */
/**********************************/
CREATE TABLE gen_member(
    gen_memberno                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    gen_id                            VARCHAR2(50)     NOT NULL UNIQUE ,
    gen_passwd                        VARCHAR2(20)     NOT NULL,
    gen_name                          VARCHAR2(20)     NOT NULL,
    gen_resident                      VARCHAR2(13)     NOT NULL,
    gen_sex                           VARCHAR2(10)     NOT NULL,
    gen_phone                         VARCHAR2(20)     NOT NULL,
    gen_zipcode                       VARCHAR2(5)    NULL ,
    gen_addr                          VARCHAR2(100)    NULL ,
    gen_addr1                         VARCHAR2(50)     NULL ,
    gen_mail                          VARCHAR2(50)     NOT NULL,
    gen_date                          DATE     NOT NULL
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


/**********************************/
/* Table Name: ���� ���� �׸� */
/**********************************/

CREATE TABLE surveyitem(
    sur_itemno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    surveyno                          NUMBER(10)     NOT NULL,
    itemseq                           NUMBER(2) DEFAULT 1  NOT NULL,
    item                              VARCHAR2(200)    NOT NULL,
    itemfile                          VARCHAR2(100)    NULL,
    itemcnt                           NUMBER(7) DEFAULT 0  NOT NULL,
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

-- ����
UPDATE surveyitem 
SET itemseq =2, item='test', itemfile='test.jpg', itemcnt=1
WHERE sur_itemno=2;

-- ����
DELETE FROM surveyitem 
WHERE sur_itemno=1;


--�θ�Ű ����
SELECT COUNT(*) as cnt
FROM surveyitem
WHERE surveyno = 1;

-- �θ�Ű ����
DELETE FROM surveyitem
WHERE surveyno = 1;

/**********************************/
/* Table Name: ���� ���� ȸ�� */
/**********************************/
CREATE TABLE surveymember(
    sur_memberno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
    sur_itemno                        NUMBER(10)     NOT NULL,
    gen_memberno                      NUMBER(7)    NOT NULL,
    rdate                             DATE     NOT NULL,
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

-- ����
UPDATE surveymember 
SET rdate='2020-11-09'
WHERE sur_memberno=1;

-- ����
DELETE FROM surveymember
WHERE sur_memberno=1;

--��� ����
SELECT s.sur_memberno, s.sur_itemno, s.gen_memberno, s.rdate, g.gen_id as gid
FROM surveymember s , gen_member g
WHERE s.gen_memberno = g.gen_memberno
ORDER BY sur_memberno ASC;
