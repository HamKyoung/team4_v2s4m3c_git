/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE com_intro CASCADE CONSTRAINTS; 
DROP TABLE com_intro;

CREATE TABLE com_intro(
    comno                             NUMBER(7)       NOT NULL     PRIMARY KEY,
    com_name                        VARCHAR2(1000)     NOT NULL,
    com_form                          VARCHAR2(1000)     NOT NULL,
    com_type                          VARCHAR2(1000)     NOT NULL,
    sales                                 VARCHAR2(50)           NOT NULL,
    homepage                        VARCHAR2(1000)     NOT NULL,
    address                           VARCHAR2(1000)     NOT NULL,
    num_people                      VARCHAR2(50)           NOT NULL,
    edate                             VARCHAR2(500)                  NOT NULL,
    ceo_name                          VARCHAR2(1000)     NOT NULL,
        visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL
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
COMMENT ON COLUMN com_intro.edate is '������';
COMMENT ON COLUMN com_intro.ceo_name is '��ǥ�ڸ�';
COMMENT ON COLUMN com_intro.visible is '��¸��';


DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '�ֵ���ũ','�п�','��ǻ���п�','10���','www.soldesk.com','���α���ö��','50��','2010-01-01','�ֿ���','Y');

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '�Ｚ����','000','000','10���','www.soldesk.com','���α���ö��','1000��','2010-01-01','�ֿ���','Y');




/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
drop table cor_member;
CREATE TABLE cor_member(
    cor_memberno                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    cor_id                            VARCHAR2(50)     NOT NULL UNIQUE,
    cor_passwd                        VARCHAR2(20)     NOT NULL,
    cor_name                          VARCHAR2(20)     NOT NULL,
    cor_resident                      VARCHAR2(13)     NOT NULL,
    cor_sex                           VARCHAR2(10)     NOT NULL,
    cor_phone                         VARCHAR2(20)     NOT NULL,
    cor_zipcode                       VARCHAR2(5)    NULL ,
    cor_addr                          VARCHAR2(100)    NULL ,
    cor_addr1                         VARCHAR2(50)     NULL ,
    cor_mail                          VARCHAR2(50)     NOT NULL,
    cor_date                          DATE     NOT NULL
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
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test1', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test2', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 0, 0, 0, 'test@test.com', sysdate);
  


/**********************************/
/* Table Name: �հ��ڼҼ� */
/**********************************/
DROP TABLE pass_self;
CREATE TABLE pass_self(
    pass_self_no                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    comno                             NUMBER(10)     NULL ,
    cor_memberno                      NUMBER(7)    NULL ,
    pass_self_title                   VARCHAR2(200)    NOT NULL,
    pass_self_item1                   VARCHAR2(500)    NOT NULL,
    pass_self_item2                   VARCHAR2(500)    NULL ,
    pass_self_item3                   VARCHAR2(500)    NULL ,
    pass_self_item4                   VARCHAR2(500)    NULL ,
    pass_self_item5                   VARCHAR2(500)    NULL ,
    pass_self_ans1                    VARCHAR2(2000)     NOT NULL,
    pass_self_ans2                    VARCHAR2(2000)     NULL ,
    pass_self_ans3                    VARCHAR2(2000)     NULL ,
    pass_self_ans4                    VARCHAR2(2000)     NULL ,
    pass_self_ans5                    VARCHAR2(2000)     NULL ,
    pass_self_date                    DATE     NOT NULL,
    pass_self_views                   NUMBER(10)     DEFAULT 0     NOT NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (cor_memberno) REFERENCES cor_member (cor_memberno)
);

COMMENT ON TABLE pass_self is '�հ��ڼҼ�';
COMMENT ON COLUMN pass_self.pass_self_no is '�հ��ڼҼ� ��ȣ';
COMMENT ON COLUMN pass_self.comno is 'ȸ���ȣ';
COMMENT ON COLUMN pass_self.cor_memberno is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN pass_self.pass_self_title is '�հ��ڼҼ� ����';
COMMENT ON COLUMN pass_self.pass_self_item1 is '�հ��ڼҼ� �׸�1';
COMMENT ON COLUMN pass_self.pass_self_item2 is '�հ��ڼҼ� �׸�2';
COMMENT ON COLUMN pass_self.pass_self_item3 is '�հ��ڼҼ� �׸�3';
COMMENT ON COLUMN pass_self.pass_self_item4 is '�հ��ڼҼ� �׸�4';
COMMENT ON COLUMN pass_self.pass_self_item5 is '�հ��ڼҼ� �׸�5';
COMMENT ON COLUMN pass_self.pass_self_ans1 is '�հ��ڼҼ� �亯1';
COMMENT ON COLUMN pass_self.pass_self_ans2 is '�հ��ڼҼ� �亯2';
COMMENT ON COLUMN pass_self.pass_self_ans3 is '�հ��ڼҼ� �亯3';
COMMENT ON COLUMN pass_self.pass_self_ans4 is '�հ��ڼҼ� �亯4';
COMMENT ON COLUMN pass_self.pass_self_ans5 is '�հ��ڼҼ� �亯5';
COMMENT ON COLUMN pass_self.pass_self_date is '�հ��ڼҼ� �����';
COMMENT ON COLUMN pass_self.pass_self_views is '�հ��ڼҼ� ��ȸ��';

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
VALUES(pass_self_seq.nextval, '1', '2', '�հ��ڼҼ� ����2', 'ù��° �׸�2', '�ι�° �׸�2', '����° �׸�2', '�׹�° �׸�2', '������ �׸�2', 'ù��° �亯2', '�ι�° �亯2', '����° �亯2', '�׹�° �亯2',
'�ټ���° �亯2', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '4', '�հ��ڼҼ� ����3', 'ù��° �׸�3', '�ι�° �׸�3', '����° �׸�3', '�׹�° �׸�3', '������ �׸�3', 'ù��° �亯3', '�ι�° �亯3', '����° �亯3', '�׹�° �亯3',
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

-- read, ��ȸ
SELECT pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views
FROM pass_self
WHERE pass_self_no = 2;

-- update, ����
UPDATE pass_self
SET pass_self_title='���� ����', pass_self_item1='������ ù��° �׸�', pass_self_item2='������ �ι�° �׸�', pass_self_item3='������ ����° �׸�', pass_self_item4='������ �׹�° �׸�', pass_self_item5='������ �ټ���° �׸�', 
                                pass_self_ans1='������ ù��° �亯', pass_self_ans2='������ �ι�° �亯', pass_self_ans3='������ ����° �亯', pass_self_ans4='������ �׹�° �亯', pass_self_ans5='������ �ټ���° �亯'
WHERE pass_self_no = 2;

-- dalete, ����
DELETE FROM pass_self
WHERE pass_self_no = 3;



commit;


  
  
  
