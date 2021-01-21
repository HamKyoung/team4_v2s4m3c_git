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
        visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
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

-- ���
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '�ֵ���ũ','�п�','��ǻ���п�','10���','www.soldesk.com','���α���ö��','50��','2010-01-01','�ֿ���','Y');

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '�Ｚ����','000','000','10���','www.soldesk.com','���α���ö��','1000��','2010-01-01','�ֿ���','Y');


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

