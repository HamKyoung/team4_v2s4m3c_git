/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE conpany_intro;
CREATE TABLE conpany_intro(
		comno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(20)		 NOT NULL,
		com_form                      		VARCHAR2(50)		 NOT NULL,
		com_type                          		VARCHAR2(50)		 NOT NULL,
		sales                         		NUMBER(10)		 NOT NULL,
		homepage                      		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(50)		 NOT NULL,
		num_people                    		NUMBER(10)		 NOT NULL,
		com_date                          		DATE		 NOT NULL,
		ceo_name                      		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE conpany_intro is 'ȸ��Ұ�';
COMMENT ON COLUMN conpany_intro.comno is 'ȸ���ȣ';
COMMENT ON COLUMN conpany_intro.com_name is 'ȸ���̸�';
COMMENT ON COLUMN conpany_intro.com_form is '�������';
COMMENT ON COLUMN conpany_intro.com_type is '����';
COMMENT ON COLUMN conpany_intro.sales is '�����';
COMMENT ON COLUMN conpany_intro.homepage is 'Ȩ������';
COMMENT ON COLUMN conpany_intro.address is 'ȸ���ּ�';
COMMENT ON COLUMN conpany_intro.num_people is '�����';
COMMENT ON COLUMN conpany_intro.com_date is '������';
COMMENT ON COLUMN conpany_intro.ceo_name is '��ǥ�ڸ�';

DROP SEQUENCE conpany_intro_seq;
CREATE SEQUENCE conpany_intro_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO conpany_intro(comno, com_name, com_form, com_type, sales, homepage, address, num_people, com_date, ceo_name)
VALUES(conpany_intro_seq.nextval, '�Ｚ', '����Ƽ', '����', 300, 'www.samsoung.com', '�Ｚ��', 500, sysdate, '�԰�ä');

INSERT INTO conpany_intro(comno, com_name, com_form, com_type, sales, homepage, address, num_people, com_date, ceo_name)
VALUES(conpany_intro_seq.nextval, 'LG', '����Ƽ', '����', 300, 'www.samsoung.com', '�Ｚ��', 300, sysdate, '�ʷ���');

commit;

/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
DROP TABLE corporate_member;
CREATE TABLE corporate_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE corporate_member is '��� ȸ��';
COMMENT ON COLUMN corporate_member.cor_memberno is '��� ȸ�� ��ȣ';

DROP SEQUENCE corporate_member_seq;
CREATE SEQUENCE corporate_member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
INSERT INTO corporate_member(cor_memberno)
VALUES(corporate_member_seq.nextval);
  
  


/**********************************/
/* Table Name: �հ��ڼҼ� */
/**********************************/
DROP TABLE pass_self;
CREATE TABLE pass_self(
		pass_self_no                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		comno                         		NUMBER(10)		 NULL ,
		cor_memberno                  		NUMBER(7)		 NULL ,
		pass_self_title               		VARCHAR2(200)		 NOT NULL,
		pass_self_item1               		VARCHAR2(500)		 NOT NULL,
		pass_self_item2               		VARCHAR2(500)		 NULL ,
		pass_self_item3               		VARCHAR2(500)		 NULL ,
		pass_self_item4               		VARCHAR2(500)		 NULL ,
		pass_self_item5               		VARCHAR2(500)		 NULL ,
		pass_self_ans1                		VARCHAR2(2000)		 NOT NULL,
		pass_self_ans2                		VARCHAR2(2000)		 NULL ,
		pass_self_ans3                		VARCHAR2(2000)		 NULL ,
		pass_self_ans4                		VARCHAR2(2000)		 NULL ,
		pass_self_ans5                		VARCHAR2(2000)		 NULL ,
		pass_self_date                		DATE		 NOT NULL,
		pass_self_views               		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (comno) REFERENCES conpany_intro (comno),
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno)
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






  
  
  
