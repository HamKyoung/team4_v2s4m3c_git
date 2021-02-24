/**********************************/
/* Table Name: 관리자 */
/**********************************/
drop table admin;
CREATE TABLE admin(
		adminno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		id                        		VARCHAR2(50)		 NOT NULL UNIQUE,
		passwd                    		VARCHAR2(20)		 NOT NULL,
		name                      		VARCHAR2(20)		 NOT NULL
);

DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


-- 등록
insert into admin(adminno, id, passwd, name)
values(admin_seq.nextval, 'admin', '1234', '관리자');

SELECT *
FROM admin;

SELECT COUNT(*) as cnt
FROM admin
WHERE id='admin' AND passwd='1234';


SELECT adminno, id, passwd, name
FROM admin
WHERE id = 'admin';


commit;
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

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test1', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test2', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM gen_member;

commit;


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


DROP TABLE questions;

DROP SEQUENCE questions_seq;
CREATE SEQUENCE questions_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  -- insert
INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', '첫번째 질문', '오늘은 무슨요일 입니까?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', '두번째 질문', '오늘은 몇일 입니까?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '2', '세번째 질문', '오늘은 몇월 입니까?', sysdate, '0', '1234');

-- list
SELECT ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd
FROM questions
ORDER BY ques_no ASC;

SELECT q.ques_no, q.gen_memberno, q.ques_title, q.ques_con, q.ques_date, q.ques_views, q.ques_passwd, gm.gen_name
FROM questions q, gen_member gm
WHERE q.gen_memberno = gm.gen_memberno
ORDER BY q.ques_no DESC;



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


DROP TABLE answer;

DROP SEQUENCE answer_seq;

CREATE SEQUENCE answer_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지



INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '1', '첫번째 질문에 대한 답변', '첫번째 답변입니다.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '2', '두번째 질문에 대한 답변', '두번째 답변입니다.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '3', '세번째 질문에 대한 답변', '세번째 답변입니다.', sysdate, '0');

-- list
SELECT ans_no, ques_no, ans_title, ans_con, ans_date, ans_views
FROM answer
ORDER BY ques_no ASC;


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

ALTER TABLE notice
ADD (notice_word VARCHAR2(300));

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


DROP TABLE notice;

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  -- insert
INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, '첫번째 공지사항', '첫번째 공지사항 내용', '1', '0', 'N', sysdate, 'notice.jpg', 'notice_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1)
VALUES(notice_seq.nextval, '두번째 공지사항', '두번째 공지사항 내용', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657);

INSERT INTO notice(notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_file1, notice_thumb1, notice_size1, notice_word)
VALUES(notice_seq.nextval, '세번째 공지사항', '세번째 공지사항 내용', '1', '0', 'N', sysdate, 'notice2.jpg', 'notice2_t.jpg', 23657, '알림');

-- list
SELECT notice_no, notice_name, notice_con, notice_seqno, notice_views, notice_visible, notice_date, notice_word
FROM notice
ORDER BY notice_seqno ASC;

/**********************************/
/* Table Name: 회사소개 */
/**********************************/
DROP TABLE COM_INTRO CASCADE CONSTRAINTS;
DROP SEQUENCE comintro_seq;

CREATE TABLE COM_INTRO(
		COMNO                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
        COR_MEMBERNO                  		NUMBER(7)		 NULL ,
		COM_NAME                      		VARCHAR2(1000)		 NOT NULL,
		COM_FORM                      		VARCHAR2(1000)		 NOT NULL,
		COM_TYPE                      		VARCHAR2(1000)		 NOT NULL,
		SALES                         		VARCHAR2(50)		 NOT NULL,
		HOMEPAGE                      		VARCHAR2(1000)		 NOT NULL,
		ADDRESS                       		VARCHAR2(1000)		 NOT NULL,
		NUM_PEOPLE                    		VARCHAR2(50)		 NOT NULL,
		EDATE                         		VARCHAR2(500)		 NOT NULL,
		CEO_NAME                         VARCHAR2(1000)		 NOT NULL,
		VISIBLE                       		CHAR(1)		DEFAULT 'Y'  NOT NULL,
        FOREIGN KEY (COR_MEMBERNO) REFERENCES  corporate_member(COR_MEMBERNO)
);


COMMENT ON TABLE COM_INTRO is '회사소개';
COMMENT ON COLUMN COM_INTRO.COMNO is '회사번호';
COMMENT ON COLUMN COM_INTRO.COR_MEMBERNO is '기업회사번호';
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


DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO com_intro(comno,cor_memberno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, 1, '솔데스크','학원','컴퓨터학원','10억원','www.soldesk.com','종로구관철로','50명','2010-01-01','솔원장','Y');

INSERT INTO com_intro(comno, cor_memberno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, 1, '삼성전자','000','000','10억원','www.soldesk.com','종로구관철로','1000명','2010-01-01','솔원장','Y');


-- 목록
SELECT comno, cor_memberno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name,visible
FROM com_intro
ORDER BY comno ASC;
 
 commit;
 
 /**********************************/
/* Table Name: 구직신청 */
/**********************************/
DROP TABLE jobsup;
CREATE TABLE jobsup(
		jobsupno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        gen_memberno                  		NUMBER(7)		 NOT NULL ,
		comno                        		NUMBER(10)		 NOT NULL ,
		jobsup_title                  		VARCHAR2(300)		 NOT NULL,
		jobsup_msg                    		VARCHAR2(1000)		 NOT NULL,
		jobsup_date                   		DATE		 NOT NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE jobsup is '구직 신청';
COMMENT ON COLUMN jobsup.jopsupno is '구직 신청 번호';
COMMENT ON COLUMN jobsup.jopsup_title is '지원 제목';
COMMENT ON COLUMN jobsup.jobsup_msg is '지원 메세지';
COMMENT ON COLUMN jobsup.jobsup_date is '지원 등록일';
COMMENT ON COLUMN jobsup.gen_memberno is '회원 번호';
COMMENT ON COLUMN jobsup.comno is '회사 번호';


DROP SEQUENCE jobsup_seq;
CREATE SEQUENCE jobsup_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
-- 등록
INSERT INTO jobsup(jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 2, '믿음직하고 꼼꼼한사람입니다.', '저는 이 회사에 지원하고 싶은 이유는 뭣보다 돈이필요해서 입니다.', sysdate);
  

-- 목록
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
ORDER BY jobsupno ASC;
 
 COMMIT;
 /**********************************/
/* Table Name: 회사카테고리(직무별) */
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
  FOREIGN KEY (comno) REFERENCES  com_intro(comno)
);

COMMENT ON TABLE com_cate is '회사대분류';
COMMENT ON COLUMN com_cate.cateno is '대분류 번호';
COMMENT ON COLUMN com_cate.comno is '회사번호';
COMMENT ON COLUMN com_cate.cate_name is '대분류 이름';
COMMENT ON COLUMN com_cate.cate_seqno is '출력순서';
COMMENT ON COLUMN com_cate.cate_visible is '출력모드';
COMMENT ON COLUMN com_cate.cate_date is '등록일';
COMMENT ON COLUMN com_cate.cate_cnt is '등록된 글 수';

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--등록  
--(부모테이블 먼저)
INSERT INTO com_intro(comno, cor_memberno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, 1, '솔데스크','학원','컴퓨터학원','10억원','www.soldesk.com','종로구관철로','50명','2010-01-01','솔원장',1,'Y');

--(자식테이블)
INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 1, '경영＊사무', 1, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 1, '마케팅＊광고＊홍보', 2, 'Y', sysdate, 0);

INSERT INTO com_cate(cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt)
VALUES(cate_seq.nextval, 1, 'IT＊인터넷', 3, 'Y', sysdate, 0);


-- 목록
SELECT cateno, comno, cate_name, cate_seqno, cate_visible, cate_date, cate_cnt
FROM com_cate
ORDER BY cateno ASC;

SELECT r.comno as r_comno, r.com_name as r_com_name,
           c.cateno, c.comno, c.cate_name, c.cate_seqno, c.cate_visible, c.cate_date, c.cate_cnt
FROM com_intro r, com_cate c
WHERE r.comno = c.comno
ORDER BY r.comno ASC, c.cate_seqno ASC;

commit;

/**********************************/
/* Table Name: 구인 */
/**********************************/
DROP TABLE recruit CASCADE CONSTRAINTS;
drop table recruit;
CREATE TABLE recruit(
		recruitno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
        seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		content                       		CLOB		 NOT NULL,
		homepage                      		VARCHAR2(500)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		comno                         		NUMBER(8)         DEFAULT 0         NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
        word                                  VARCHAR2(300)         NULL ,
        rdate                                 DATE               NOT NULL,
        sdate                                 VARCHAR2(30)         NULL ,
        edate                                 VARCHAR2(300)         NULL ,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,
  FOREIGN KEY (cateno) REFERENCES COM_CATE (cateno)
);

COMMENT ON TABLE recruit is '구인';
COMMENT ON COLUMN recruit.recruitno is '구인번호';
COMMENT ON COLUMN recruit.cateno is '대분류 번호';
COMMENT ON COLUMN recruit.title is '제목';
COMMENT ON COLUMN recruit.seqno is '순서';
COMMENT ON COLUMN recruit.content is '내용';
COMMENT ON COLUMN recruit.homepage is '홈페이지';
COMMENT ON COLUMN recruit.visible is '출력모드';
COMMENT ON COLUMN recruit.comno is '회사번호';
COMMENT ON COLUMN recruit.passwd is '패스워드';
COMMENT ON COLUMN recruit.word is '검색어';
COMMENT ON COLUMN recruit.rdate is '등록일';
COMMENT ON COLUMN recruit.sdate is '접수시작일';
COMMENT ON COLUMN recruit.edate is '접수마감일';
COMMENT ON COLUMN recruit.file1 is '메인 이미지';
COMMENT ON COLUMN recruit.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN recruit.size1 is '메인 이미지 크기';


DROP SEQUENCE recruit_seq;
CREATE SEQUENCE recruit_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  
1) 글 등록(이미지 관련 컬러 추가)
-- cateno: 1이 사전에 등록이되어 있어야 INSERT 가능
INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년 하반기 직원 공개채용', 1, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년도 현성그룹 신입 / 경력사원 모집', 2, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년도 삼성그룹 신입모집', 3, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);
             
INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2021년도 쿠팡 신입 / 경력사원 모집', 4, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);


INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021년 개발자 채용', 1, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021년도 현성그룹 신입 / 경력사원 모집', 2, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate, sdate, edate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,2, '2021년도 카카오 경력모집', 3, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, '2021-01-01', '2021-01-15', 'spring.jpg', 'spring_t.jpg', 23657);


2) 전체목록
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate, sdate, edate
FROM recruit 
ORDER BY recruitno DESC;

commit;

) 검색 + 페이징 + 메인 이미지
-- step 1
SELECT recruitno, cateno, title, content, rdate
FROM recruit
WHERE cateno=1 AND title LIKE '%채용%'
ORDER BY recruitno DESC;

-- step 2
SELECT recruitno, cateno, title, content, rdate, rownum as r
FROM (
          SELECT recruitno, cateno, title, content, rdate
          FROM recruit
          WHERE cateno=1 AND title LIKE '%채용%'
          ORDER BY recruitno DESC
);

-- step 3, 1 page
SELECT recruitno, cateno, title, content, rdate ,r
FROM (
           SELECT recruitno, cateno, title, content, rdate ,rownum as r
           FROM (
                     SELECT recruitno, cateno, title, content, rdate
                     FROM recruit
                     WHERE cateno=1 AND title LIKE '%채용%'
                     ORDER BY recruitno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

/**********************************/
/* Table Name: 공채달력 */
/**********************************/
drop table re_calendar;
CREATE TABLE re_calendar(
		calendar_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		RECRUITNO                     		NUMBER(10)		 NULL ,
		c_rdate                       		VARCHAR2(50)		 NOT NULL,
		c_edate                       		VARCHAR2(50)		 NOT NULL,
		c_title                       		VARCHAR2(300)		 NOT NULL,
		c_cnt                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		c_date                        		DATE		 NOT NULL,
  FOREIGN KEY (RECRUITNO) REFERENCES RECRUIT (RECRUITNO)
);

COMMENT ON TABLE re_calendar is '공채달력';
COMMENT ON COLUMN re_calendar.calendar_no is '공채달력번호';
COMMENT ON COLUMN re_calendar.RECRUITNO is '구인번호';
COMMENT ON COLUMN re_calendar.c_rdate is '접수 시작일';
COMMENT ON COLUMN re_calendar.c_edate is '접수 마감일';
COMMENT ON COLUMN re_calendar.c_title is '제목';
COMMENT ON COLUMN re_calendar.c_cnt is '조회수';
COMMENT ON COLUMN re_calendar.c_date is '등록날짜';



DROP SEQUENCE re_calendar_seq;
CREATE SEQUENCE re_calendar_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

  -- insert
INSERT INTO re_calendar(calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date)
VALUES(re_calendar_seq.nextval, 1, '2021-02-11', '2021-03-11', '사람을 구합니다.', 0, sysdate);

INSERT INTO re_calendar(calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date)
VALUES(re_calendar_seq.nextval, 1, '2021-03-11', '2021-04-11', '새로운 사람', 0, sysdate);

INSERT INTO re_calendar(calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date)
VALUES(re_calendar_seq.nextval, 1, '2021-04-11', '2021-05-11', '가족같이 일 할 직원', 0, sysdate);

-- list
SELECT c.c_rdate, c.c_edate, c.c_title, c.RECRUITNO, ci.com_name
FROM re_calendar c, RECRUIT re, COM_CATE cc, COM_INTRO ci
WHERE re.RECRUITNO = c.RECRUITNO AND re.CATENO = cc.CATENO AND cc.comno = ci.comno
ORDER BY re.RECRUITNO DESC;


-- read, 조회
SELECT calendar_no, RECRUITNO, c_rdate, c_edate, c_title, c_cnt, c_date
FROM re_calendar
WHERE calendar_no = 1;



-- dalete, 삭제
DELETE FROM re_calendar
WHERE calendar_no = 4;


-- update, 수정
UPDATE re_calendar
SET c_rdate='2021-02-20', c_edate='2021-02-21'
WHERE calendar_no = 1;



commit;

/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
DROP TABLE attachfile;
CREATE TABLE attachfile(
        attachfileno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        recruitno                   NUMBER(10)         NULL ,
        fname                             VARCHAR2(100)         NOT NULL,
        fupname                      VARCHAR2(100)         NOT NULL,
        thumb                         VARCHAR2(100)         NULL ,
        fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE     NOT NULL,
  FOREIGN KEY (recruitno) REFERENCES recruit (recruitno)
);

COMMENT ON TABLE attachfile is '첨부파일';
COMMENT ON COLUMN attachfile.recruitno is '구인번호';
COMMENT ON COLUMN attachfile.contentsno is '컨텐츠번호';
COMMENT ON COLUMN attachfile.fname is '원본 파일명';
COMMENT ON COLUMN attachfile.fupname is '업로드 파일명';
COMMENT ON COLUMN attachfile.thumb is 'Thumb 파일명';
COMMENT ON COLUMN attachfile.fsize is '파일 사이즈';
COMMENT ON COLUMN attachfile.rdate is '등록일';

DROP SEQUENCE attachfile_seq;
CREATE SEQUENCE attachfile_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 1) 등록  
INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   


-- 2) 목록( contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachfileno, recruitno, fname, fupname, thumb, fsize, rdate
FROM attachfile
ORDER BY recruitno DESC,  attachfileno ASC;

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

DROP SEQUENCE cor_member_seq;
CREATE SEQUENCE cor_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


-- 등록
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '테스트', '1111111', '남자', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test1', '1234', '테스트', '1111111', '남자', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date)
values(cor_member_seq.nextval, 'test2', '1234', '테스트', '1111111', '남자', '01011111111', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM cor_member;

-- 목록
SELECT cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date
FROM cor_member
ORDER BY cor_memberno ASC;

commit;

/**********************************/
/* Table Name: 합격자소서 */
/**********************************/
DROP TABLE  PASS_SELF;
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

DROP SEQUENCE pass_self_seq;
CREATE SEQUENCE pass_self_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '합격자소서 제목', '첫번째 항목', '두번째 항목', '세번째 항목', '네번째 항목', '마지막 항목', '첫번째 답변', '두번째 답변', '세번째 답변', '네번째 답변',
'다섯번째 답변', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '합격자소서 제목2', '첫번째 항목2', '두번째 항목2', '세번째 항목2', '네번째 항목2', '마지막 항목2', '첫번째 답변2', '두번째 답변2', '세번째 답변2', '네번째 답변2',
'다섯번째 답변2', sysdate, '0');

INSERT INTO pass_self(pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views)
VALUES(pass_self_seq.nextval, '1', '1', '합격자소서 제목3', '첫번째 항목3', '두번째 항목3', '세번째 항목3', '네번째 항목3', '마지막 항목3', '첫번째 답변3', '두번째 답변3', '세번째 답변3', '네번째 답변3',
'다섯번째 답변3', sysdate, '0');
  
-- list
SELECT pass_self_no, comno, cor_memberno, pass_self_title, pass_self_item1, pass_self_item2, pass_self_item3, pass_self_item4, pass_self_item5, 
                                pass_self_ans1, pass_self_ans2, pass_self_ans3, pass_self_ans4, pass_self_ans5, pass_self_date, pass_self_views
FROM pass_self
ORDER BY pass_self_no DESC;

SELECT p.pass_self_no, p.comno, p.cor_memberno, p.cor_memberno, p.pass_self_title, p.pass_self_date, p.pass_self_views, c.com_name
FROM pass_self p, conpany_intro c
WHERE p.comno = c.comno
ORDER BY pass_self_no DESC;

commit;

/**********************************/
/* Table Name: 합격자소서 첨부파일 */
/**********************************/
CREATE TABLE ps_attachfile(
		ps_attachfileno               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		pass_self_no                  		NUMBER(7)		 NOT NULL,
		ps_fname                      		VARCHAR2(100)		 NOT NULL,
		ps_upname                     		VARCHAR2(100)		 NOT NULL,
		ps_thumb                      		VARCHAR2(100)		 NULL ,
		ps_fsize                      		NUMBER(10)		 NOT NULL,
		ps_rdate                      		DATE		 NOT NULL,
  FOREIGN KEY (pass_self_no) REFERENCES pass_self (pass_self_no)
);


COMMENT ON TABLE ps_attachfile is '합격자소서 첨부파일';
COMMENT ON COLUMN ps_attachfile.ps_attachfileno is '첨부파일 번호';
COMMENT ON COLUMN ps_attachfile.pass_self_no is '합격자소서 번호';
COMMENT ON COLUMN ps_attachfile.ps_fname is '원본 파일명';
COMMENT ON COLUMN ps_attachfile.ps_upname is '업로드 파일명';
COMMENT ON COLUMN ps_attachfile.ps_thumb is 'Thumb 파일명';
COMMENT ON COLUMN ps_attachfile.ps_fsize is '파일 사이즈';
COMMENT ON COLUMN ps_attachfile.ps_rdate is '등록일';


DROP SEQUENCE ps_attachfile_seq;
CREATE SEQUENCE ps_attachfile_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

commit;


-- 1) 등록
INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval, 3, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO ps_attachfile(ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate)
VALUES(ps_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);     


-- 2) 목록( pass_self_no 기준 내림 차순, ps_attachfileno 기준 오름차순)
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
ORDER BY pass_self_no DESC,  ps_attachfileno ASC;


-- 3) 글별 파일 목록(pass_self_no 기준 내림 차순, ps_attachfileno 기준 오르차순)
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE pass_self_no = 1
ORDER BY ps_attachfileno ASC;


SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE ps_attachfileno=10;


-- 4) 하나의 파일 삭제
DELETE FROM ps_attachfile
WHERE ps_attachfileno = 9;


-- 5) FK pass_self_no 부모키 별 조회
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE pass_self_no=1;


-- 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM ps_attachfile
WHERE pass_self_no=1;


-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM ps_attachfile
WHERE pass_self_no=1;


-- 7) pass_self, ps_attachfile join
    SELECT c.pass_self_title, a.ps_attachfileno, a.pass_self_no, a.ps_fname, a.ps_upname, a.ps_thumb, a.ps_fsize, a.ps_rdate
    FROM pass_self c, ps_attachfile a
    WHERE c.pass_self_no = a.pass_self_no
    ORDER BY c.pass_self_no DESC,  a.ps_attachfileno ASC;


-- 8) 조회
SELECT ps_attachfileno, pass_self_no, ps_fname, ps_upname, ps_thumb, ps_fsize, ps_rdate
FROM ps_attachfile
WHERE ps_attachfileno=8;


/**********************************/
/* Table Name: 회사뉴스 */
/**********************************/
DROP TABLE jobnws;
CREATE TABLE jobnws(
		jobnwsno                        		NUMBER(30)		 NOT NULL,
		jobnws_title                    		VARCHAR2(1000)		 NOT NULL,
		jobnws_content                  		CLOB 		 NOT NULL,
		jobnws_url                      		VARCHAR2(500)		 NOT NULL,
        jobnws_passwd                      	VARCHAR2(15)		 NOT NULL,
		jobnws_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_good                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_coment                   		VARCHAR2(1000)		 NULL ,
		jobnws_date                     		DATE		 NOT NULL,
		jobnws_file1                    		VARCHAR2(100)		 NULL ,
		jobnws_thumb1                       VARCHAR2(100)		 NULL ,
		jobnws_size1                    		NUMBER(10)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE jobnws is '회사뉴스';
COMMENT ON COLUMN jobnws.jobnwsno is '뉴스 번호';
COMMENT ON COLUMN jobnws.jobnws_title is '뉴스 제목';
COMMENT ON COLUMN jobnws.jobnws_content is '뉴스 내용';
COMMENT ON COLUMN jobnws.jobnws_url is '뉴스 출처';
COMMENT ON COLUMN jobnws.jobnws_cnt is '뉴스 조회수';
COMMENT ON COLUMN jobnws.jobnws_good is '뉴스 추천수';
COMMENT ON COLUMN jobnws.jobnws_coment is '뉴스 댓글';
COMMENT ON COLUMN jobnws.jobnws_date is '등록일';
COMMENT ON COLUMN jobnws.jobnws_file1 is '뉴스 메인 이미지';
COMMENT ON COLUMN jobnws.jobnws_thumb1 is '뉴스 메인 이미지 Preview';
COMMENT ON COLUMN jobnws.jobnws_size1 is '뉴스 매인 이미지 크기';


ALTER TABLE jobnws ADD CONSTRAINT IDX_jobnws_PK PRIMARY KEY (jobnwsno);


DROP SEQUENCE jobnws_seq;
CREATE SEQUENCE jobnws_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name:  뉴스 */
/**********************************/

-- 등록
INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, '삼성채용뉴스', '이러한 조건하에', 'https://', 0, 0, '좋은 도움이됬어요', '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- 뉴스 테이블에 추가
INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1 )
VALUES(jobnws_seq.nextval, '삼성채용뉴스', '이러한 조건하에', 'https://', 0, 0, '좋은 도움이됬어요', '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 'LG채용뉴스', '이러한 조건하에', 'https://', 0, 0, '좋은 도움이됬어요', '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM jobnws ORDER BY jobnwsno ASC;

COMMIT;


/**********************************/
/* Table Name: 설문조사 */
/**********************************/
drop table surveymember;
drop table surveyitem;
drop table survey;
CREATE TABLE survey(
		surveyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		topic                         		VARCHAR2(200)		 NOT NULL,
		startdate                     	VARCHAR2(10)		 NOT NULL,
		enddate                       	VARCHAR2(10)		 NOT NULL,
		poster                        	VARCHAR2(100)	     NULL,
		cnt                           		NUMBER(7)		     NULL ,
		continueyn                    		CHAR(1)		     NOT NULL
);

COMMENT ON TABLE survey is '설문조사';
COMMENT ON COLUMN survey.surveyno is '설문조사번호';
COMMENT ON COLUMN survey.topic is '제목';
COMMENT ON COLUMN survey.startdate is '시작날짜';
COMMENT ON COLUMN survey.enddate is '종료 날짜';
COMMENT ON COLUMN survey.poster is '포스터 파일';
COMMENT ON COLUMN survey.cnt is '참여인원';
COMMENT ON COLUMN survey.continueyn is '진행여부';

DROP SEQUENCE survey_seq;
CREATE SEQUENCE survey_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사1', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사2', '2020-11-04', '2020-11-11', 'poster', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, '설문조사2', '2020-11-04', '2020-11-11', ' ', 1, 'Y');

INSERT INTO survey(surveyno, topic, startdate, enddate, poster, cnt, continueyn)
VALUES(survey_seq.nextval, 'topic', '2020-11-04', '2020-11-11', ' ', 1, 'Y');

ALTER TABLE survey
ADD (word VARCHAR2(300));

--목록
SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn, word
FROM survey 
ORDER BY surveyno ASC;

SELECT surveyno, topic, startdate, enddate, poster, cnt, continueyn, word
FROM survey 
WHERE (topic LIKE '%' || 'topic' || '%' 
             OR poster LIKE '%' || topic || '%' 
             OR word LIKE '%' || topic || '%')
ORDER BY surveyno DESC;  

commit;

/**********************************/
/* Table Name: 설문 조사 항목 */
/**********************************/
drop table surveyitem;
DROP SEQUENCE surveyitem_seq;

CREATE TABLE surveyitem(
		sur_itemno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		surveyno                      		NUMBER(10)		 NOT NULL,
		itemseq                       		NUMBER(2)	DEFAULT 1	 NOT NULL,
		item                          		VARCHAR2(200)		 NOT NULL,
		itemfile                      		VARCHAR2(100)		 NULL,
		itemcnt                       		NUMBER(7)	DEFAULT 0	 NOT NULL,
  FOREIGN KEY (surveyno) REFERENCES survey (surveyno)
);

COMMENT ON TABLE surveyitem is '설문 조사 항목';
COMMENT ON COLUMN surveyitem.sur_itemno is '설문 조사 항목 번호';
COMMENT ON COLUMN surveyitem.surveyno is '설문 조사 번호';
COMMENT ON COLUMN surveyitem.itemseq is '항목 출력 순서';
COMMENT ON COLUMN surveyitem.item is '항목';
COMMENT ON COLUMN surveyitem.itemfile is '항목 파일';
COMMENT ON COLUMN surveyitem.itemcnt is '항목 선택 인원';

drop table surveyitem;
DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '테스트', '파일', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '테스트', '파일', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, '테스트', '파일', 0);

INSERT INTO surveyitem(sur_itemno, surveyno, itemseq, item, itemfile, itemcnt)
VALUES(surveyitem_seq.nextval, 1, 1, 'test', 'file', 0);

ALTER TABLE surveyitem
ADD (word VARCHAR2(300));

-- 목록
SELECT sur_itemno, surveyno, itemseq, item, itemfile, itemcnt, word
FROM surveyitem 
ORDER BY itemseq ASC;

commit;

-- 조회
SELECT sur_itemno, surveyno, itemseq, item, itemfile, itemcnt
FROM surveyitem 
WHERE sur_itemno=1;

/**********************************/
/* Table Name: 설문 참여 회원 */
/**********************************/
CREATE TABLE surveymember(
		sur_memberno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		sur_itemno                    		NUMBER(10)		 NOT NULL,
		gen_memberno                  		NUMBER(7)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (sur_itemno) REFERENCES surveyitem (sur_itemno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE surveymember is '설문 참여 회원';
COMMENT ON COLUMN surveymember.sur_memberno is '설문 참여 회원 번호';
COMMENT ON COLUMN surveymember.sur_itemno is '설문 조사 항목 번호';
COMMENT ON COLUMN surveymember.gen_memberno is '회원 번호';
COMMENT ON COLUMN surveymember.rdate is '설문 참여 날짜';

DROP SEQUENCE surveymember_seq;
CREATE SEQUENCE surveymember_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 1, sysdate);

INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 2, sysdate);

INSERT INTO surveymember(sur_memberno, sur_itemno, gen_memberno, rdate)
VALUES(surveymember_seq.nextval, 1, 3, sysdate);

-- 목록
SELECT sur_memberno, sur_itemno, gen_memberno, rdate
FROM surveymember 
ORDER BY sur_memberno ASC;

commit;

-- 조회
SELECT sur_memberno, sur_itemno, gen_memberno, rdate
FROM surveymember 
WHERE sur_memberno=1;


--멤버 조인
SELECT s.sur_memberno, s.sur_itemno, s.gen_memberno, s.rdate, g.gen_id as gid
FROM surveymember s , gen_member g
WHERE s.gen_memberno = g.gen_memberno
ORDER BY sur_memberno ASC


/**********************************/
/* Table Name: 이력서 */
/**********************************/

DROP TABLE mem_res CASCADE CONSTRAINTS;
DROP SEQUENCE mem_res_seq;

DROP TABLE res_scho CASCADE CONSTRAINTS;
DROP TABLE res_lice CASCADE CONSTRAINTS;

CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		        NOT NULL,
		res_phone                     		VARCHAR2(60)		        NOT NULL,
		res_mail                    		    VARCHAR2(200)		    NOT NULL,
		res_intro                     		    VARCHAR2(800)		    NOT NULL,
        res_school                           VARCHAR2(80)		        NOT NULL,
		res_major                            VARCHAR2(100)		    NOT NULL,
        res_lice                     		    VARCHAR2(50)		        NULL,
		res_lice_lev                 		    VARCHAR2(30)		        NULL ,
		res_work                      	    CLOB		                    DEFAULT 0		 NULL ,
		res_web                       	    VARCHAR2(100)		    NULL ,
		res_visible                   	        CHAR(1)		                DEFAULT 'Y'	 NOT NULL,
		res_date                      		DATE		                    NOT NULL,
		res_pic                       		    VARCHAR2(100)		    NULL ,
		res_thumb                     	    VARCHAR2(100)		    NULL ,
		res_size                      		    NUMBER(10)		        NULL ,
		gen_memberno               	    NUMBER(7)		            NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE MEM_RES is '이력서';
COMMENT ON COLUMN MEM_RES.RES_NO is '이력서 번호';
COMMENT ON COLUMN MEM_RES.GEN_NAME is '회원 이름';
COMMENT ON COLUMN MEM_RES.RES_PHONE is '연락처';
COMMENT ON COLUMN MEM_RES.RES_MAIL is '이메일';
COMMENT ON COLUMN MEM_RES.RES_INTRO is '자기소개';
COMMENT ON COLUMN MEM_RES.RES_SCHOOL is '최종학력';
COMMENT ON COLUMN MEM_RES.RES_MAJOR is '전공';
COMMENT ON COLUMN MEM_RES.RES_LICE is '자격증';
COMMENT ON COLUMN MEM_RES.RES_LICE_LEV is '자격증 급수';
COMMENT ON COLUMN MEM_RES.RES_WORK is '경력기술서';
COMMENT ON COLUMN MEM_RES.RES_WEB is '링크';
COMMENT ON COLUMN MEM_RES.RES_VISIBLE is '공개 여부';
COMMENT ON COLUMN MEM_RES.RES_DATE is '작성일';
COMMENT ON COLUMN MEM_RES.RES_PIC is '사진';
COMMENT ON COLUMN MEM_RES.RES_THUMB is '썸네일';
COMMENT ON COLUMN MEM_RES.RES_SIZE is '사진 용량';
COMMENT ON COLUMN MEM_RES.GEN_MEMBERNO is '회원 번호';

CREATE SEQUENCE mem_res_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '홍길동', '01012345678', 'team4@naver.com', '자기소개입니다.', '하나고등학교', '인문계', '토익', '900',
           '경력기술', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '가길동', '01012345678', 'team4@naver.com', '자기소개입니다.', '하나고등학교', '인문계', '토익', '900',
           '경력기술', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '나길동', '01012345678', 'team4@naver.com', '자기소개입니다.', '하나고등학교', '인문계', '토익', '900',
           '경력기술', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 3);       
           
--목록
SELECT * FROM mem_res
ORDER BY res_no ASC;


-- 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM mem_res
WHERE res_work LIKE '%경력%';

-- step 3, 1 page
SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
          res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, r
FROM (
           SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                     res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, rownum as r
           FROM (
                     SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno
                     FROM mem_res
                     WHERE res_work LIKE '%경력%'
                     ORDER BY res_no DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
          res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, r
FROM (
           SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                     res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, rownum as r
           FROM (
                     SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
                                res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno
                     FROM mem_res
                     WHERE res_work LIKE '%경력%'
                     ORDER BY res_no DESC
           )          
)
WHERE r >= 11 AND r <= 20;

-- read, 조회
SELECT res_no, gen_name, res_phone, res_mail, res_intro, res_school, res_major, res_lice, res_lice_lev, 
          res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno
FROM mem_res
WHERE res_no = 1;


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
SELECT*FROM com_review ORDER BY rev_no ASC;

commit;

DROP TABLE event CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 이벤트 */
/**********************************/
CREATE TABLE event(
		eventno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		eve_title                     		VARCHAR2(80)		 NOT NULL,
		eve_content                   		VARCHAR2(800)		 NOT NULL,
		eve_visible                   		CHAR(1)		 NOT NULL,
		eve_date                      		DATE		 NOT NULL,
		eve_pic                       		VARCHAR2(500)		 NULL ,
		eve_thumb                     		VARCHAR2(100)		 NULL ,
		eve_size                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eventno is '이벤트 번호';
COMMENT ON COLUMN event.eve_title is '이벤트 제목';
COMMENT ON COLUMN event.eve_content is '이벤트 내용';
COMMENT ON COLUMN event.eve_visible is '공개 여부';
COMMENT ON COLUMN event.eve_date is '작성일';
COMMENT ON COLUMN event.eve_pic is '사진';
COMMENT ON COLUMN event.eve_thumb is '썸네일';
COMMENT ON COLUMN event.eve_size is '사진 용량';


DROP SEQUENCE event_seq;
CREATE SEQUENCE event_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
-- 등록
INSERT INTO event(eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size)
VALUES(event_seq.nextval, '이벤트 제목', '이벤트 내용입니다. 기간: 2021.01.27~2021.12.31 이벤트를 개최합니다. 응모시 추첨을 통하여 상품을 드립니다.', 'Y', sysdate, '사진', '사진_t', 1); 
  
--목록
SELECT * FROM event
ORDER BY eventno ASC;


-- 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM event
WHERE eve_title LIKE '%제목%';

-- step 3, 1 page
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, r
FROM (
           SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, rownum as r
           FROM (
                     SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
                     FROM event
                     WHERE eve_title LIKE '%제목%'
                     ORDER BY eventno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, r
FROM (
           SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size, rownum as r
           FROM (
                     SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
                     FROM event
                     WHERE eve_title LIKE '%제목%'
                     ORDER BY eventno DESC
           )          
)WHERE r >= 11 AND r <= 20;

-- read, 조회
SELECT eventno,eve_title,eve_content,eve_visible,eve_date,eve_pic,eve_thumb,eve_size
FROM event
WHERE eventno = 1;

-- update, 수정
UPDATE event
SET eve_title='수정 완료', eve_content='수정 완료'
WHERE eventno = 1;

-- dalete, 삭제
DELETE FROM event
WHERE eventno = 3;

-- 출력 모드의 변경
UPDATE event
SET eve_visible='N'
WHERE eventno=1;

COMMIT;  

