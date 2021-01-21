/**********************************/
/* Table Name: 일반 회원 */
/**********************************/
CREATE TABLE GEN_MEMBER(
		GEN_MEMBERNO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		GEN_ID                        		VARCHAR2(50)		 NOT NULL,
		GEN_PASSWD                    		VARCHAR2(20)		 NOT NULL,
		GEN_NAME                      		VARCHAR2(20)		 NOT NULL,
		GEN_RESIDENT                  		VARCHAR2(13)		 NOT NULL,
		GEN_SEX                       		VARCHAR2(10)		 NOT NULL,
		GEN_PHONE                     		VARCHAR2(20)		 NOT NULL,
		GEN_ZIPCODE                   		VARCHAR2(5)		 NULL ,
		GEN_ADDR                      		VARCHAR2(100)		 NULL ,
		GEN_ADDR1                     		VARCHAR2(50)		 NULL ,
		GEN_MAIL                      		VARCHAR2(50)		 NOT NULL,
		GEN_DATE                      		DATE		 NOT NULL,
  CONSTRAINT SYS_C008198 UNIQUE (GEN_ID)
);

COMMENT ON TABLE GEN_MEMBER is '일반 회원';
COMMENT ON COLUMN GEN_MEMBER.GEN_MEMBERNO is '회원 번호';
COMMENT ON COLUMN GEN_MEMBER.GEN_ID is '회원 아이디';
COMMENT ON COLUMN GEN_MEMBER.GEN_PASSWD is '비밀번호 ';
COMMENT ON COLUMN GEN_MEMBER.GEN_NAME is '회원 이름';
COMMENT ON COLUMN GEN_MEMBER.GEN_RESIDENT is '생년월일';
COMMENT ON COLUMN GEN_MEMBER.GEN_SEX is '성별';
COMMENT ON COLUMN GEN_MEMBER.GEN_PHONE is '전화 번호';
COMMENT ON COLUMN GEN_MEMBER.GEN_ZIPCODE is '우편 번호';
COMMENT ON COLUMN GEN_MEMBER.GEN_ADDR is '회원 주소';
COMMENT ON COLUMN GEN_MEMBER.GEN_ADDR1 is '회원 주소1';
COMMENT ON COLUMN GEN_MEMBER.GEN_MAIL is '이메일';
COMMENT ON COLUMN GEN_MEMBER.GEN_DATE is '가입 날짜';


/**********************************/
/* Table Name: 질문 */
/**********************************/
CREATE TABLE QUESTIONS(
		QUES_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		GEN_MEMBERNO                  		NUMBER(7)		 NOT NULL,
		QUES_TITLE                    		VARCHAR2(200)		 NOT NULL,
		QUES_CON                      		CLOB(4000)		 NOT NULL,
		QUES_DATE                     		DATE		 NOT NULL,
		QUES_VIEWS                    		NUMBER(10)		 NOT NULL,
		QUES_PASSWD                   		VARCHAR2(10)		 NOT NULL,
  FOREIGN KEY (GEN_MEMBERNO) REFERENCES GEN_MEMBER (GEN_MEMBERNO)
);

COMMENT ON TABLE QUESTIONS is '질문';
COMMENT ON COLUMN QUESTIONS.QUES_NO is '질문 번호';
COMMENT ON COLUMN QUESTIONS.GEN_MEMBERNO is '회원 번호';
COMMENT ON COLUMN QUESTIONS.QUES_TITLE is '질문 제목';
COMMENT ON COLUMN QUESTIONS.QUES_CON is '질문 내용';
COMMENT ON COLUMN QUESTIONS.QUES_DATE is '질문 등록날짜';
COMMENT ON COLUMN QUESTIONS.QUES_VIEWS is '질문 조회수';
COMMENT ON COLUMN QUESTIONS.QUES_PASSWD is '질문 비밀번호';


/**********************************/
/* Table Name: 답변 */
/**********************************/
CREATE TABLE ANSWER(
		ANS_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		QUES_NO                       		NUMBER(10)		 NULL ,
		ANS_TITLE                     		VARCHAR2(200)		 NOT NULL,
		ANS_CON                       		CLOB(4000)		 NOT NULL,
		ANS_DATE                      		DATE		 NOT NULL,
		ANS_VIEWS                     		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (QUES_NO) REFERENCES QUESTIONS (QUES_NO)
);

COMMENT ON TABLE ANSWER is '답변';
COMMENT ON COLUMN ANSWER.ANS_NO is '답변 번호';
COMMENT ON COLUMN ANSWER.QUES_NO is '질문 번호';
COMMENT ON COLUMN ANSWER.ANS_TITLE is '답변 제목';
COMMENT ON COLUMN ANSWER.ANS_CON is '답변 내용';
COMMENT ON COLUMN ANSWER.ANS_DATE is '답변 등록날짜';
COMMENT ON COLUMN ANSWER.ANS_VIEWS is '답변 조회수';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE NOTICE(
		NOTICE_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NOTICE_NAME                   		VARCHAR2(200)		 NOT NULL,
		NOTICE_CON                    		CLOB(4000)		 NOT NULL,
		NOTICE_SEQNO                  		NUMBER(7)		 NOT NULL,
		NOTICE_VIEWS                  		NUMBER(10)		 NOT NULL,
		NOTICE_VISIBLE                		CHAR(1)		 NOT NULL,
		NOTICE_DATE                   		DATE		 NOT NULL,
		NOTICE_FILE1                  		VARCHAR2(100)		 NULL ,
		NOTICE_THUMB1                 		VARCHAR2(100)		 NULL ,
		NOTICE_SIZE1                  		NUMBER(10)		 NULL ,
		NOTICE_WORD                   		VARCHAR2(300)		 NULL 
);

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.NOTICE_NO is '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICE_NAME is '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CON is '공지사항 내용';
COMMENT ON COLUMN NOTICE.NOTICE_SEQNO is '공지사항 출력 순서';
COMMENT ON COLUMN NOTICE.NOTICE_VIEWS is '공지사항 조회수';
COMMENT ON COLUMN NOTICE.NOTICE_VISIBLE is '공지사항 출력모드';
COMMENT ON COLUMN NOTICE.NOTICE_DATE is '공지사항 작성날짜';
COMMENT ON COLUMN NOTICE.NOTICE_FILE1 is '공지사항 이미지';
COMMENT ON COLUMN NOTICE.NOTICE_THUMB1 is '공지사항 메인 이미지 Preview';
COMMENT ON COLUMN NOTICE.NOTICE_SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN NOTICE.NOTICE_WORD is 'NOTICE_WORD';


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
COMMENT ON COLUMN COM_INTRO.VISIBLE is '출력모드';


/**********************************/
/* Table Name: 기업 회원 */
/**********************************/
CREATE TABLE CORPORATE_MEMBER(
		COR_MEMBERNO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COR_ID                        		VARCHAR2(50)		 NOT NULL,
		COR_PASSWD                    		VARCHAR2(20)		 NOT NULL,
		COR_NAME                      		VARCHAR2(20)		 NOT NULL,
		COR_RESIDENT                  		VARCHAR2(13)		 NOT NULL,
		COR_SEX                       		VARCHAR2(10)		 NOT NULL,
		COR_PHONE                     		VARCHAR2(20)		 NOT NULL,
		COR_ADDR                      		VARCHAR2(100)		 NOT NULL,
		COR_MAIL                      		VARCHAR2(50)		 NOT NULL,
		COR_DATE                      		DATE		 NOT NULL
);

COMMENT ON TABLE CORPORATE_MEMBER is '기업 회원';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_MEMBERNO is '기업 회원 번호';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_ID is '기업 회원 아이디';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_PASSWD is '기업 회원 비밀번호';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_NAME is '기업 회원 이름';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_RESIDENT is '기업 회원 주민 번호';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_SEX is '기업 회원 성별 ';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_PHONE is '기업 회원 전화 번호';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_ADDR is '기업 회원 주소';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_MAIL is '기업 회원 이메일';
COMMENT ON COLUMN CORPORATE_MEMBER.COR_DATE is '기업 회원 가입 날짜';


/**********************************/
/* Table Name: 합격자소서 */
/**********************************/
CREATE TABLE PASS_SELF(
		PASS_SELF_NO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		COMNO                         		NUMBER(10)		 NULL ,
		COR_MEMBERNO                  		NUMBER(7)		 NULL ,
		PASS_SELF_TITLE               		VARCHAR2(200)		 NOT NULL,
		PASS_SELF_ITEM1               		VARCHAR2(500)		 NOT NULL,
		PASS_SELF_ITEM2               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ITEM3               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ITEM4               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ITEM5               		VARCHAR2(500)		 NULL ,
		PASS_SELF_ANS1                		VARCHAR2(2000)		 NOT NULL,
		PASS_SELF_ANS2                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_ANS3                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_ANS4                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_ANS5                		VARCHAR2(2000)		 NULL ,
		PASS_SELF_DATE                		DATE		 NOT NULL,
		PASS_SELF_VIEWS               		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (COMNO) REFERENCES COM_INTRO (COMNO),
  FOREIGN KEY (COR_MEMBERNO) REFERENCES CORPORATE_MEMBER (COR_MEMBERNO)
);

COMMENT ON TABLE PASS_SELF is '합격자소서';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_NO is '합격자소서 번호';
COMMENT ON COLUMN PASS_SELF.COMNO is '회사번호';
COMMENT ON COLUMN PASS_SELF.COR_MEMBERNO is '기업 회원 번호';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_TITLE is '합격자소서 제목';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM1 is '합격자소서 항목1';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM2 is '합격자소서 항목2';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM3 is '합격자소서 항목3';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM4 is '합격자소서 항목4';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ITEM5 is '합격자소서 항목5';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS1 is '합격자소서 답변1';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS2 is '합격자소서 답변2';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS3 is '합격자소서 답변3';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS4 is '합격자소서 답변4';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_ANS5 is '합격자소서 답변5';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_DATE is '합격자소서 등록일';
COMMENT ON COLUMN PASS_SELF.PASS_SELF_VIEWS is '합격자소서 조회수';


