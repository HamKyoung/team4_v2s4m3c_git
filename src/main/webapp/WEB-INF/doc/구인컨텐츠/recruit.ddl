/**********************************/
/* Table Name: 회사소개 */
/**********************************/
CREATE TABLE COM_INTRO(
		COMNO                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COM_NAME                      		VARCHAR2(1000)		 NOT NULL,
		COM_FORM                      		VARCHAR2(1000)		 NOT NULL,
		COM_TYPE                      		VARCHAR2(1000)		 NOT NULL,
		SALES                         		VARCHAR2(50)		 NOT NULL,
		HOMEPAGE                      		VARCHAR2(1000)		 NOT NULL,
		ADDRESS                       		VARCHAR2(1000)		 NOT NULL,
		NUM_PEOPLE                    		VARCHAR2(50)		 NOT NULL,
		EDATE                         		VARCHAR2(500)		 NOT NULL,
		CEO_NAME                      		VARCHAR2(1000)		 NOT NULL,
		COR_MEMBERNO                  		NUMBER(7)		 NULL ,
		VISIBLE                       		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE COM_INTRO is '회사소개';
COMMENT ON COLUMN COM_INTRO.COMNO is '회사번호';
COMMENT ON COLUMN COM_INTRO.COM_NAME is '회사이름';
COMMENT ON COLUMN COM_INTRO.COM_FORM is '기업형태';
COMMENT ON COLUMN COM_INTRO.COM_TYPE is '업종';
COMMENT ON COLUMN COM_INTRO.SALES is '매출액';
COMMENT ON COLUMN COM_INTRO.HOMEPAGE is '홈페이지';
COMMENT ON COLUMN COM_INTRO.ADDRESS is '회사주소';
COMMENT ON COLUMN COM_INTRO.NUM_PEOPLE is '사원수';
COMMENT ON COLUMN COM_INTRO.EDATE is '설립일';
COMMENT ON COLUMN COM_INTRO.CEO_NAME is '대표자명';
COMMENT ON COLUMN COM_INTRO.COR_MEMBERNO is '기업 회원 번호';
COMMENT ON COLUMN COM_INTRO.VISIBLE is '출력모드';


/**********************************/
/* Table Name: 회사대분류 */
/**********************************/
CREATE TABLE COM_CATE(
		CATENO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		COMNO                         		NUMBER(10)		 NULL ,
		CATE_NAME                     		VARCHAR2(100)		 NOT NULL,
		CATE_SEQNO                    		NUMBER(10)		 NOT NULL,
		CATE_VISIBLE                  		CHAR(1)		 NOT NULL,
		CATE_DATE                     		DATE		 NOT NULL,
		CATE_CNT                      		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (COMNO) REFERENCES COM_INTRO (COMNO)
);

COMMENT ON TABLE COM_CATE is '회사대분류';
COMMENT ON COLUMN COM_CATE.CATENO is '대분류 번호';
COMMENT ON COLUMN COM_CATE.COMNO is '회사번호';
COMMENT ON COLUMN COM_CATE.CATE_NAME is '대분류 이름';
COMMENT ON COLUMN COM_CATE.CATE_SEQNO is '출력순서';
COMMENT ON COLUMN COM_CATE.CATE_VISIBLE is '출력모드';
COMMENT ON COLUMN COM_CATE.CATE_DATE is '등록일';
COMMENT ON COLUMN COM_CATE.CATE_CNT is '등록된 글 수';


/**********************************/
/* Table Name: 구인 */
/**********************************/
CREATE TABLE com_recruit(
		recruitno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB(10)		 NOT NULL,
		homepage                      		VARCHAR2(500)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		comno                         		NUMBER(10)		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
  FOREIGN KEY (CATENO) REFERENCES COM_CATE (CATENO)
);

COMMENT ON TABLE com_recruit is '구인';
COMMENT ON COLUMN com_recruit.recruitno is '구인번호';
COMMENT ON COLUMN com_recruit.CATENO is '대분류 번호';
COMMENT ON COLUMN com_recruit.title is '제목';
COMMENT ON COLUMN com_recruit.content is '내용';
COMMENT ON COLUMN com_recruit.homepage is '홈페이지';
COMMENT ON COLUMN com_recruit.visible is '출력모드';
COMMENT ON COLUMN com_recruit.comno is '회사번호';
COMMENT ON COLUMN com_recruit.passwd is '패스워드';


