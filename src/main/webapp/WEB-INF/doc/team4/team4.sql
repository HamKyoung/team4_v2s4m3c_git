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


DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '솔데스크','학원','컴퓨터학원','10억원','www.soldesk.com','종로구관철로','50명','2010-01-01','솔원장','Y');

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,visible)
VALUES(comintro_seq.nextval, '삼성전자','000','000','10억원','www.soldesk.com','종로구관철로','1000명','2010-01-01','솔원장','Y');


-- 목록
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name,visible
FROM com_intro
ORDER BY comno ASC;
 
 commit;
 
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
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,cor_memberno,visible)
VALUES(comintro_seq.nextval, '솔데스크','학원','컴퓨터학원','10억원','www.soldesk.com','종로구관철로','50명','2010-01-01','솔원장',1,'Y');

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
INSERT INTO recruit(recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년 하반기 직원 공개채용', 1, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년도 현성그룹 신입 / 경력사원 모집', 2, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);

INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2020년도 삼성그룹 신입모집', 3, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
             
INSERT INTO recruit(recruitno, cateno, title, seqno, content, homepage, passwd, word, rdate,
                              file1, thumb1, size1)
VALUES(recruit_seq.nextval,1, '2021년도 쿠팡 신입 / 경력사원 모집', 4, '우리는 몇명뽑는다' ,'http://www.daum.net',
             '1234', '하반기', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
            

2) 전체목록
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;


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

