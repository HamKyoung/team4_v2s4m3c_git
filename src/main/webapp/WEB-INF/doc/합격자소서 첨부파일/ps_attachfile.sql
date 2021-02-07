/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
CREATE TABLE corporate_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE corporate_member is '��� ȸ��';
COMMENT ON COLUMN corporate_member.cor_memberno is '��� ȸ�� ��ȣ';


/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
CREATE TABLE conpany_intro(
		comno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(20)		 NOT NULL,
		com_form                      		VARCHAR2(50)		 NOT NULL,
		com_type                      		VARCHAR2(50)		 NOT NULL,
		sales                         		NUMBER(10)		 NOT NULL,
		homepage                      		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(50)		 NOT NULL,
		num_people                    		NUMBER(10)		 NOT NULL,
		com_date                      		DATE		 NOT NULL,
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


/**********************************/
/* Table Name: �հ��ڼҼ� */
/**********************************/
CREATE TABLE pass_self(
		pass_self_no                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		comno                         		NUMBER(10)		 NULL ,
		cor_memberno                  		NUMBER(7)		 NULL ,
		pass_self_title               		VARCHAR2(200)		 NOT NULL,
		pass_self_item1               		VARCHAR2(100)		 NOT NULL,
		pass_self_item2               		VARCHAR2(100)		 NULL ,
		pass_self_item3               		VARCHAR2(100)		 NULL ,
		pass_self_item4               		VARCHAR2(100)		 NULL ,
		pass_self_item5               		VARCHAR2(100)		 NULL ,
		pass_self_ans1                		VARCHAR2(2000)		 NOT NULL,
		pass_self_ans2                		VARCHAR2(2000)		 NULL ,
		pass_self_ans3                		VARCHAR2(2000)		 NULL ,
		pass_self_ans4                		VARCHAR2(2000)		 NULL ,
		pass_self_ans5                		VARCHAR2(2000)		 NULL ,
		pass_self_date                		DATE		 NOT NULL,
		pass_self_views               		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno),
  FOREIGN KEY (comno) REFERENCES conpany_intro (comno)
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


/**********************************/
/* Table Name: �հ��ڼҼ� ÷������ */
/**********************************/
CREATE TABLE ps_attachfile(
		ps_attachfileno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pass_self_no                  		NUMBER(7)		 NOT NULL,
		ps_fname                      		VARCHAR2(100)		 NOT NULL,
		ps_upname                     		VARCHAR2(100)		 NOT NULL,
		ps_thumb                      		VARCHAR2(100)		 NULL ,
		ps_fsize                      		NUMBER(10)		 NOT NULL,
		ps_rdate                      		DATE		 NOT NULL,
  FOREIGN KEY (pass_self_no) REFERENCES pass_self (pass_self_no)
);


COMMENT ON TABLE ps_attachfile is '�հ��ڼҼ� ÷������';
COMMENT ON COLUMN ps_attachfile.ps_attachfileno is '÷������ ��ȣ';
COMMENT ON COLUMN ps_attachfile.pass_self_no is '�հ��ڼҼ� ��ȣ';
COMMENT ON COLUMN ps_attachfile.ps_fname is '���� ���ϸ�';
COMMENT ON COLUMN ps_attachfile.ps_upname is '���ε� ���ϸ�';
COMMENT ON COLUMN ps_attachfile.ps_thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN ps_attachfile.ps_fsize is '���� ������';
COMMENT ON COLUMN ps_attachfile.ps_rdate is '�����';


DROP SEQUENCE ps_attachfile_seq;
CREATE SEQUENCE ps_attachfile_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

commit;


-- 1) ���
INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval, 3, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);     


-- 2) ���( pass_self_no ���� ���� ����, ps_attachfileno ���� ��������)
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
ORDER BY pass_self_no DESC,  ps_attachfileno ASC;


-- 3) �ۺ� ���� ���(pass_self_no ���� ���� ����, ps_attachfileno ���� ��������)
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE pass_self_no = 1
ORDER BY ps_attachfileno ASC;


SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE ps_attachfileno=10;


-- 4) �ϳ��� ���� ����
DELETE FROM ps_attachfile
WHERE ps_attachfileno = 9;


-- 5) FK pass_self_no �θ�Ű �� ��ȸ
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE pass_self_no=1;


-- �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM ps_attachfile
WHERE pass_self_no=1;


-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM ps_attachfile
WHERE pass_self_no=1;


-- 7) pass_self, ps_attachfile join
    SELECT c.pass_self_title, a.ps_attachfileno, a.pass_self_no, a.ps_fname, a.ps_upname, a.ps_thumb, a.ps_fsize, a.ps_rdate
    FROM pass_self c, ps_attachfile a
    WHERE c.pass_self_no = a.pass_self_no
    ORDER BY c.pass_self_no DESC,  a.ps_attachfileno ASC;


-- 8) ��ȸ
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE ps_attachfileno=8;



