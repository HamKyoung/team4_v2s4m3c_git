/**********************************/
/* Table Name: 기업 회원 */
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

COMMENT ON TABLE corporate_member is '기업 회원';
COMMENT ON COLUMN corporate_member.cor_memberno is '기업 회원 번호';
COMMENT ON COLUMN corporate_member.cor_id is '기업 회원 아이디';
COMMENT ON COLUMN corporate_member.cor_passwd is '기업 회원 비밀번호';
COMMENT ON COLUMN corporate_member.cor_name is '기업 회원 이름';
COMMENT ON COLUMN corporate_member.cor_resident is '기업 회원 주민 번호';
COMMENT ON COLUMN corporate_member.cor_sex is '기업 회원 성별 ';
COMMENT ON COLUMN corporate_member.cor_phone is '기업 회원 전화 번호';
COMMENT ON COLUMN corporate_member.cor_addr is '기업 회원 주소';
COMMENT ON COLUMN corporate_member.cor_mail is '기업 회원 이메일';
COMMENT ON COLUMN corporate_member.cor_date is '기업 회원 가입 날짜';


/**********************************/
/* Table Name: 회사소개 */
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

COMMENT ON TABLE com_intro is '회사소개';
COMMENT ON COLUMN com_intro.comno is '회사번호';
COMMENT ON COLUMN com_intro.com_name is '회사이름';
COMMENT ON COLUMN com_intro.com_form is '기업형태';
COMMENT ON COLUMN com_intro.com_type is '업종';
COMMENT ON COLUMN com_intro.sales is '매출액';
COMMENT ON COLUMN com_intro.homepage is '홈페이지';
COMMENT ON COLUMN com_intro.address is '회사주소';
COMMENT ON COLUMN com_intro.num_people is '사원수';
COMMENT ON COLUMN com_intro.date is '설립일';
COMMENT ON COLUMN com_intro.ceo_name is '대표자명';
COMMENT ON COLUMN com_intro.cor_memberno is '기업 회원 번호';


/**********************************/
/* Table Name: 회사뉴스 */
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

COMMENT ON TABLE news is '회사뉴스';
COMMENT ON COLUMN news.newsno is '뉴스 번호';
COMMENT ON COLUMN news.news_title is '뉴스 제목';
COMMENT ON COLUMN news.news_content is '뉴스 내용';
COMMENT ON COLUMN news.news_url is '뉴스 출처';
COMMENT ON COLUMN news.news_cnt is '뉴스 조회수';
COMMENT ON COLUMN news.news_good is '뉴스 추천수';
COMMENT ON COLUMN news.news_coment is '뉴스 댓글';
COMMENT ON COLUMN news.date is '등록일';
COMMENT ON COLUMN news.comno is '회사번호';


/**********************************/
/* Table Name: 일반 회원 */
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

COMMENT ON TABLE general_member is '일반 회원';
COMMENT ON COLUMN general_member.gen_memberno is '회원 번호';
COMMENT ON COLUMN general_member.gen_id is '회원 아이디';
COMMENT ON COLUMN general_member.gen_passwd is '비밀번호 ';
COMMENT ON COLUMN general_member.gen_name is '회원 이름';
COMMENT ON COLUMN general_member.gen_resident is '주민 번호';
COMMENT ON COLUMN general_member.gen_sex is '성별';
COMMENT ON COLUMN general_member.gen_phone is '전화 번호';
COMMENT ON COLUMN general_member.gen_addr is '회원 주소';
COMMENT ON COLUMN general_member.gen_mail is '이메일';
COMMENT ON COLUMN general_member.gen_date is '가입 날짜';
COMMENT ON COLUMN general_member.rev_no is '리뷰 번호';


/**********************************/
/* Table Name: 회사리뷰 */
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

COMMENT ON TABLE com_review is '회사리뷰';
COMMENT ON COLUMN com_review.rev_no is '리뷰 번호';
COMMENT ON COLUMN com_review.com_name is '사명';
COMMENT ON COLUMN com_review.rev_title is '리뷰 제목';
COMMENT ON COLUMN com_review.rev_score is '회사 평점';
COMMENT ON COLUMN com_review.rev_depart is '근무부서';
COMMENT ON COLUMN com_review.rev_content is '리뷰 내용';
COMMENT ON COLUMN com_review.rev_prop is '회사 건의사항';
COMMENT ON COLUMN com_review.rev_visible is '출력모드';
COMMENT ON COLUMN com_review.rev_good is '추천수';
COMMENT ON COLUMN com_review.rev_bad is '신고수';
COMMENT ON COLUMN com_review.rev_date is '작성일';
COMMENT ON COLUMN com_review.rev_passwd is '비밀번호';
COMMENT ON COLUMN com_review.comno is '회사번호';
COMMENT ON COLUMN com_review.gen_memberno is '회원 번호';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		notice_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		notice_name                   		VARCHAR2(50)		 NOT NULL,
		notice_con                    		VARCHAR2(225)		 NOT NULL,
		notice_views                  		INTEGER(10)		 DEFAULT 0		 NOT NULL,
		notice_date                   		DATE		 NOT NULL
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.notice_no is '공지사항 번호';
COMMENT ON COLUMN notice.notice_name is '공지사항 제목';
COMMENT ON COLUMN notice.notice_con is '공지사항 내용';
COMMENT ON COLUMN notice.notice_views is '조회수';
COMMENT ON COLUMN notice.notice_date is '작성날짜';


