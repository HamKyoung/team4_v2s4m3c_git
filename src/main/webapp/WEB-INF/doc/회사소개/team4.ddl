/**********************************/
/* Table Name: ��� ȸ�� */
/**********************************/
CREATE TABLE corporate_member(
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


/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
CREATE TABLE com_intro(
		comno                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(50)		 NOT NULL,
		com_form                      		VARCHAR2(20)		 NOT NULL,
		com_type                      		VARCHAR2(50)		 NOT NULL,
		sales                         		INTEGER(100)		 NOT NULL,
		homepage                      		VARCHAR2(50)		 NOT NULL,
		address                       		VARCHAR2(50)		 NOT NULL,
		num_people                    		INTEGER(10)		 NOT NULL,
		edate                          		DATE		 NOT NULL,
		ceo_name                      		VARCHAR2(10)		 NOT NULL,
		cor_memberno                  		NUMBER(7)		 NULL ,
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
COMMENT ON COLUMN com_intro.date is '������';
COMMENT ON COLUMN com_intro.ceo_name is '��ǥ�ڸ�';
COMMENT ON COLUMN com_intro.cor_memberno is '��� ȸ�� ��ȣ';


/**********************************/
/* Table Name: ȸ�紺�� */
/**********************************/
CREATE TABLE news(
		newsno                        		NUMBER(30)		 NOT NULL		 PRIMARY KEY,
		news_title                    		VARCHAR2(100)		 NOT NULL,
		news_content                  		VARCHAR2(100)		 NOT NULL,
		news_url                      		VARCHAR2(50)		 NOT NULL,
		news_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		news_good                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		news_coment                   		VARCHAR2(100)		 NULL ,
		date                          		DATE		 NOT NULL,
		comno                         		NUMBER(7)		 NULL ,
  FOREIGN KEY (comno) REFERENCES com_intro (comno)
);

COMMENT ON TABLE news is 'ȸ�紺��';
COMMENT ON COLUMN news.newsno is '���� ��ȣ';
COMMENT ON COLUMN news.news_title is '���� ����';
COMMENT ON COLUMN news.news_content is '���� ����';
COMMENT ON COLUMN news.news_url is '���� ��ó';
COMMENT ON COLUMN news.news_cnt is '���� ��ȸ��';
COMMENT ON COLUMN news.news_good is '���� ��õ��';
COMMENT ON COLUMN news.news_coment is '���� ���';
COMMENT ON COLUMN news.date is '�����';
COMMENT ON COLUMN news.comno is 'ȸ���ȣ';


/**********************************/
/* Table Name: �Ϲ� ȸ�� */
/**********************************/
CREATE TABLE general_member(
		gen_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		gen_id                        		VARCHAR2(50)		 NOT NULL,
		gen_passwd                    		VARCHAR2(20)		 NOT NULL,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		gen_resident                  		VARCHAR2(13)		 NOT NULL,
		gen_sex                       		VARCHAR2(10)		 NOT NULL,
		gen_phone                     		VARCHAR2(20)		 NOT NULL,
		gen_addr                      		VARCHAR2(100)		 NOT NULL,
		gen_mail                      		VARCHAR2(50)		 NOT NULL,
		gen_date                      		DATE		 NOT NULL,
		rev_no                        		NUMBER(100)		 NULL 
);

COMMENT ON TABLE general_member is '�Ϲ� ȸ��';
COMMENT ON COLUMN general_member.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN general_member.gen_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN general_member.gen_passwd is '��й�ȣ ';
COMMENT ON COLUMN general_member.gen_name is 'ȸ�� �̸�';
COMMENT ON COLUMN general_member.gen_resident is '�ֹ� ��ȣ';
COMMENT ON COLUMN general_member.gen_sex is '����';
COMMENT ON COLUMN general_member.gen_phone is '��ȭ ��ȣ';
COMMENT ON COLUMN general_member.gen_addr is 'ȸ�� �ּ�';
COMMENT ON COLUMN general_member.gen_mail is '�̸���';
COMMENT ON COLUMN general_member.gen_date is '���� ��¥';
COMMENT ON COLUMN general_member.rev_no is '���� ��ȣ';


/**********************************/
/* Table Name: ȸ�縮�� */
/**********************************/
CREATE TABLE com_review(
		rev_no                        		NUMBER(100)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(50)		 NOT NULL,
		rev_title                     		CLOB(30)		 NOT NULL,
		rev_score                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rev_depart                    		CLOB(50)		 NOT NULL,
		rev_content                   		CLOB(1000)		 NOT NULL,
		rev_prop                      		CLOB(50)		 NOT NULL,
		rev_visible                   		CHAR(1)		 NOT NULL,
		rev_good                      		NUMBER(1000)		 NOT NULL,
		rev_bad                       		NUMBER(10)		 NOT NULL,
		rev_date                      		DATE		 NOT NULL,
		rev_passwd                    		CHAR(20)		 NOT NULL,
		comno                         		NUMBER(10)		 NULL ,
		gen_memberno                  		NUMBER(7)		 NULL ,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (gen_memberno) REFERENCES general_member (gen_memberno)
);

COMMENT ON TABLE com_review is 'ȸ�縮��';
COMMENT ON COLUMN com_review.rev_no is '���� ��ȣ';
COMMENT ON COLUMN com_review.com_name is '���';
COMMENT ON COLUMN com_review.rev_title is '���� ����';
COMMENT ON COLUMN com_review.rev_score is 'ȸ�� ����';
COMMENT ON COLUMN com_review.rev_depart is '�ٹ��μ�';
COMMENT ON COLUMN com_review.rev_content is '���� ����';
COMMENT ON COLUMN com_review.rev_prop is 'ȸ�� ���ǻ���';
COMMENT ON COLUMN com_review.rev_visible is '��¸��';
COMMENT ON COLUMN com_review.rev_good is '��õ��';
COMMENT ON COLUMN com_review.rev_bad is '�Ű��';
COMMENT ON COLUMN com_review.rev_date is '�ۼ���';
COMMENT ON COLUMN com_review.rev_passwd is '��й�ȣ';
COMMENT ON COLUMN com_review.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_review.gen_memberno is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE notice(
		notice_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		notice_name                   		VARCHAR2(50)		 NOT NULL,
		notice_con                    		VARCHAR2(225)		 NOT NULL,
		notice_views                  		INTEGER(10)		 DEFAULT 0		 NOT NULL,
		notice_date                   		DATE		 NOT NULL
);

COMMENT ON TABLE notice is '��������';
COMMENT ON COLUMN notice.notice_no is '�������� ��ȣ';
COMMENT ON COLUMN notice.notice_name is '�������� ����';
COMMENT ON COLUMN notice.notice_con is '�������� ����';
COMMENT ON COLUMN notice.notice_views is '��ȸ��';
COMMENT ON COLUMN notice.notice_date is '�ۼ���¥';


