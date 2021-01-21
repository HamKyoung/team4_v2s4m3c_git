/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/

DROP TABLE cor_member CASCADE CONSTRAINTS; 
DROP TABLE cor_member;
CREATE TABLE cor_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		cor_id                        		VARCHAR2(50)		 NOT NULL,
		cor_passwd                    		VARCHAR2(20)		 NOT NULL,
		cor_name                      		VARCHAR2(20)		 NOT NULL,
		cor_resident                  		VARCHAR2(13)		 NOT NULL,
		cor_sex                       		VARCHAR2(10)		 NOT NULL,
		cor_phone                     		VARCHAR2(20)		 NOT NULL,
		cor_addr                      		VARCHAR2(100)		 NOT NULL,
		cor_mail                      		VARCHAR2(50)		 NOT NULL,
		cor_date                      		DATE		 NOT NULL
);

COMMENT ON TABLE corporate_member is '��� ȸ��';
COMMENT ON COLUMN corporate_member.cor_memberno is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN corporate_member.cor_id is '��� ȸ�� ���̵�';
COMMENT ON COLUMN corporate_member.cor_passwd is '��� ȸ�� ��й�ȣ';
COMMENT ON COLUMN corporate_member.cor_name is '��� ȸ�� �̸�';
COMMENT ON COLUMN corporate_member.cor_resident is '��� ȸ�� �ֹ� ��ȣ';
COMMENT ON COLUMN corporate_member.cor_sex is '��� ȸ�� ���� ';
COMMENT ON COLUMN corporate_member.cor_phone is '��� ȸ�� ��ȭ ��ȣ';
COMMENT ON COLUMN corporate_member.cor_addr is '��� ȸ�� �ּ�';
COMMENT ON COLUMN corporate_member.cor_mail is '��� ȸ�� �̸���';
COMMENT ON COLUMN corporate_member.cor_date is '��� ȸ�� ���� ��¥';

DROP SEQUENCE cormem_seq;
CREATE SEQUENCE cormem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE com_intro CASCADE CONSTRAINTS; 
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
COMMENT ON COLUMN com_intro.visible is '��¸��';


DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,cor_memberno,visible)
VALUES(comintro_seq.nextval, '�ֵ���ũ','�п�','��ǻ���п�','10���','www.soldesk.com','���α���ö��','50��','2010-01-01','�ֿ���',1,'Y');

INSERT INTO corporate_member(cor_memberno,cor_id,cor_passwd,cor_name ,cor_resident ,cor_sex , cor_phone,cor_addr,cor_mail,cor_date)
VALUES(cormem_seq.nextval,'abc','1234','ȫ�浿','1990-01-01','����','010-111-1111','����Ư����','seoul@naver',sysdate);


-- ���
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name,visible
FROM com_intro
ORDER BY comno ASC;

commit;

-- ��ȸ
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name
FROM com_intro
WHERE comno=1;

-- ����
UPDATE com_intro
SET com_form='����'
WHERE comno = 1;

-- ����
DELETE com_intro
WHERE comno = 3;

-- ��� ����� ����
UPDATE com_intro
SET visible='Y'
WHERE comno=2;

-- ��� ���������� ��ü ���
SELECT comno, com_name, com_type, visible
FROM com_intro
ORDER BY comno ASC;

