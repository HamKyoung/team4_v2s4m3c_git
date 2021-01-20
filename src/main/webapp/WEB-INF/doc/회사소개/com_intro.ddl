/**********************************/
/* Table Name: 회사소개 */
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

COMMENT ON TABLE com_intro is '회사소개';
COMMENT ON COLUMN com_intro.comno is '회사번호';
COMMENT ON COLUMN com_intro.com_name is '회사이름';
COMMENT ON COLUMN com_intro.com_form is '기업형태';
COMMENT ON COLUMN com_intro.type is '업종';
COMMENT ON COLUMN com_intro.sales is '매출액';
COMMENT ON COLUMN com_intro.homepage is '홈페이지';
COMMENT ON COLUMN com_intro.address is '회사주소';
COMMENT ON COLUMN com_intro.num_people is '사원수';
COMMENT ON COLUMN com_intro.date is '설립일';
COMMENT ON COLUMN com_intro.ceo_name is '대표자명';


