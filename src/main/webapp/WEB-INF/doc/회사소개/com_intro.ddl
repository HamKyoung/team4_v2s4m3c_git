/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
CREATE TABLE com_intro(
		comno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(50)		 NOT NULL,
		com_form                      		VARCHAR2(20)		 NOT NULL,
		type                          		VARCHAR2(50)		 NOT NULL,
		sales                         		NUMBER(100)		 NOT NULL,
		homepage                      		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(50)		 NOT NULL,
		num_people                    		INTEGER(10)		 NOT NULL,
		date                          		DATE		 NOT NULL,
		ceo_name                      		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE com_intro is 'ȸ��Ұ�';
COMMENT ON COLUMN com_intro.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_intro.com_name is 'ȸ���̸�';
COMMENT ON COLUMN com_intro.com_form is '�������';
COMMENT ON COLUMN com_intro.type is '����';
COMMENT ON COLUMN com_intro.sales is '�����';
COMMENT ON COLUMN com_intro.homepage is 'Ȩ������';
COMMENT ON COLUMN com_intro.address is 'ȸ���ּ�';
COMMENT ON COLUMN com_intro.num_people is '�����';
COMMENT ON COLUMN com_intro.date is '������';
COMMENT ON COLUMN com_intro.ceo_name is '��ǥ�ڸ�';


