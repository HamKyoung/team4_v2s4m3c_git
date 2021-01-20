/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE com_intro;
CREATE TABLE com_intro(
		comno                         		NUMBER(7)		    NOT NULL		 PRIMARY KEY,
		com_name                      	VARCHAR2(1000)		 NOT NULL,
		com_form                      		VARCHAR2(1000)		 NOT NULL,
		com_type                      		VARCHAR2(1000)		 NOT NULL,
		sales                         		    VARCHAR2(50)	         NOT NULL,
		homepage                      	VARCHAR2(1000)		 NOT NULL,
		address                       		VARCHAR2(1000)		 NOT NULL,
		num_people                    	VARCHAR2(50)	         NOT NULL,
		edate                          		VARCHAR2(500)	                 NOT NULL,
		ceo_name                      		VARCHAR2(1000)		 NOT NULL,
		cor_memberno                  	NUMBER(7)		     NULL ,
        visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno)
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
COMMENT ON COLUMN com_intro.cor_memberno is '��� ȸ�� ��ȣ';


/**********************************/
/* Table Name: com_cate */
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
  FOREIGN KEY (comno) REFERENCES com_intro (comno)
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
VALUES(cate_seq.nextval, 2, '�濵���繫', 1, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 2, '�����ã�����ȫ��', 2, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 2, 'IT�����ͳ�', 3, 'Y', sysdate, 0);


-- ���
SELECT cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt
FROM com_cate
ORDER BY cateno ASC;

--��ȸ
SELECT cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt
FROM com_cate
WHERE cateno=1;

DELETE com_intro
WHERE cateno = 5;

SELECT r.comno as r_comno, r.com_name as r_com_name,
           c.cateno, c.comno, c.cate_name, c.cate_seqno, c.cate_visible, c.cate_date, c.cate_cnt
FROM com_intro r, com_cate c
WHERE r.comno = c.comno
ORDER BY r.comno ASC, c.cate_seqno ASC;


SELECT r.comno as r_comno, r.com_name as r_com_name,
           c.cateno, c.comno, c.cate_name, c.cate_seqno, c.cate_visible, c.cate_date, c.cate_cnt
FROM com_intro r, com_cate c
WHERE (r.comno = c.comno) AND r.comno=1
ORDER BY r.comno ASC, c.cate_seqno ASC;


commit;