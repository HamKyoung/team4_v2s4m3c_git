DROP TABLE com_review;

DROP SEQUENCE com_review_seq;

/**********************************/
/* Table Name: 회사소개 */
/**********************************/
DROP TABLE com_intro;
CREATE TABLE com_intro(
comno                          NUMBER(10)  NOT NULL  PRIMARY KEY,
com_name                       VARCHAR2(50)  NOT NULL,
com_form                       VARCHAR2(20)  NOT NULL,
com_type                           VARCHAR2(50)  NOT NULL,
sales                          VARCHAR2(50)  NOT NULL,
homepage                       VARCHAR2(50)  NOT NULL,
address                        VARCHAR2(50)  NOT NULL,
num_people                     NUMBER(10)  NOT NULL,
e_date                           DATE  NOT NULL,
ceo_name                       VARCHAR2(10)  NOT NULL
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
COMMENT ON COLUMN com_intro.e_date is '설립일';
COMMENT ON COLUMN com_intro.ceo_name is '대표자명';

DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,e_date,ceo_name)
VALUES(comintro_seq.nextval, '네이버클라우드', '1000대기업', '서비스업', '4925억 8052만원', 'http://www.nbp-corp.com/', '성남시 분당구 분당내곡로117 11층', 500, sysdate, '박원기');

select*from com_intro;

/**********************************/
/* Table Name: 일반 회원 */
/**********************************/
DROP TABLE gen_member;
CREATE TABLE gen_member(
gen_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
gen_id                         VARCHAR2(50)  NOT NULL UNIQUE ,
gen_passwd                     VARCHAR2(20)  NOT NULL,
gen_name                       VARCHAR2(20)  NOT NULL,
gen_resident                   VARCHAR2(13)  NOT NULL,
gen_sex                        VARCHAR2(10)  NOT NULL,
gen_phone                      VARCHAR2(20)  NOT NULL,
gen_zipcode                    VARCHAR2(5)  NULL ,
gen_addr                       VARCHAR2(100)  NULL ,
gen_addr1                      VARCHAR2(50)  NULL ,
gen_mail                       VARCHAR2(50)  NOT NULL,
gen_date                       DATE  NOT NULL
);

COMMENT ON TABLE gen_member is '일반 회원';
COMMENT ON COLUMN gen_member.gen_memberno is '회원 번호';
COMMENT ON COLUMN gen_member.gen_id is '회원 아이디';
COMMENT ON COLUMN gen_member.gen_passwd is '비밀번호 ';
COMMENT ON COLUMN gen_member.gen_name is '회원 이름';
COMMENT ON COLUMN gen_member.gen_resident is '생년월일';
COMMENT ON COLUMN gen_member.gen_sex is '성별';
COMMENT ON COLUMN gen_member.gen_phone is '전화 번호';
COMMENT ON COLUMN gen_member.gen_zipcode is '우편 번호';
COMMENT ON COLUMN gen_member.gen_addr is '회원 주소';
COMMENT ON COLUMN gen_member.gen_addr1 is '회원 주소1';
COMMENT ON COLUMN gen_member.gen_mail is '이메일';
COMMENT ON COLUMN gen_member.gen_date is '가입 날짜';

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 'test@test.com', sysdate);

select*from gen_member;

/**********************************/
/* Table Name: 회사리뷰 */
/**********************************/
CREATE TABLE com_review(
		rev_no                        		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(50)		 NOT NULL,
		rev_title                     		    VARCHAR2(50)		 NOT NULL,
		rev_score                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rev_depart                    		VARCHAR2(50)		 NOT NULL,
		rev_content                   		VARCHAR2(1000)		 NOT NULL,
		rev_visible                   		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rev_good                      		NUMBER(10)		 NOT NULL,
		rev_bad                       		    NUMBER(10)		 NOT NULL,
		rev_date                      		    DATE		 NOT NULL,
		rev_cnt                           		    NUMBER(10)		 NOT NULL,
		comno                         		    NUMBER(10)		 NULL,
		gen_memberno                   NUMBER(7)		 NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE com_review_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

COMMENT ON TABLE com_review is '회사리뷰';
COMMENT ON COLUMN com_review.rev_no is '리뷰 번호';
COMMENT ON COLUMN com_review.com_name is '사명';
COMMENT ON COLUMN com_review.rev_title is '리뷰 제목';
COMMENT ON COLUMN com_review.rev_score is '회사 평점';
COMMENT ON COLUMN com_review.rev_depart is '근무부서';
COMMENT ON COLUMN com_review.rev_content is '리뷰 내용';
COMMENT ON COLUMN com_review.rev_visible is '출력모드';
COMMENT ON COLUMN com_review.rev_good is '추천수';
COMMENT ON COLUMN com_review.rev_bad is '신고수';
COMMENT ON COLUMN com_review.rev_date is '작성일';
COMMENT ON COLUMN com_review.rev_cnt is '등록된 글 수';
COMMENT ON COLUMN com_review.comno is '회사번호';
COMMENT ON COLUMN com_review.gen_memberno is '회원 번호';

-- 등록
INSERT INTO com_review(rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, 
rev_visible, rev_good, rev_bad, rev_date, rev_cnt, comno, gen_memberno)
VALUES(com_review_seq.nextval, '솔데스크', '제목', '5', '행정', '역에서 가까운 학원', 
'Y', '1','0', sysdate, '1', '1', '1');

INSERT INTO com_review(rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, 
rev_visible, rev_good, rev_bad, rev_date, rev_cnt, comno, gen_memberno)
VALUES(com_review_seq.nextval, '제일기획', '제목', '5', '데이터마케팅', '밥이 맛있음', 
'Y', '1','0', sysdate, '1', '2', '2');

-- 목록
SELECT*FROM com_intro ORDER BY comno ASC;
SELECT*FROM gen_member ORDER BY gen_memberno ASC;
SELECT*FROM com_review ORDER BY rev_no ASC;

-- 조회
SELECT rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, rev_date, comno, gen_memberno, rev_cnt
FROM com_review
WHERE comno=1;

-- 수정
UPDATE com_review
SET rev_score=5
WHERE rev_no = 1;

-- 삭제
DELETE com_review;

COMMIT;


     SELECT rev_no, com_name, rev_title, rev_score, rev_visible, rev_date, comno, r
     FROM (
                SELECT rev_no, com_name, rev_title, rev_score, rev_visible, rev_date, comno, rownum as r
                FROM (
                          SELECT rev_no, com_name, rev_title, rev_score, rev_visible, rev_date, comno
                          FROM com_review
                          ORDER BY comno ASC
                )
     )
     WHERE r >= 1 AND r <= 50;


     SELECT rev_no, com_name, rev_title, rev_score, rev_content, rev_visible, rev_date, comno, r
     FROM (
                SELECT rev_no, com_name, rev_title, rev_score, rev_content, rev_visible, rev_date, comno, rownum as r
                FROM (
                          SELECT rev_no, com_name, rev_title, rev_score, rev_content, rev_visible, rev_date, comno
                          FROM com_review
                          WHERE comno=1 AND (com_name LIKE '제일' || '기획' OR rev_content LIKE '제일') 
                          ORDER BY rev_no ASC
                )
     )
     WHERE r >= 1 AND r <= 50;


