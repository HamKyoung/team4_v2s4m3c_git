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
CREATE TABLE RECRUIT(
		RECRUITNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CATENO                        		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		HOMEPAGE                      		VARCHAR2(500)		 NULL ,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		COMNO                         		NUMBER(8)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		SDATE                         		VARCHAR2(30)		 NULL ,
		EDATE                         		VARCHAR2(300)		 NULL ,
		FILE1                         		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (CATENO) REFERENCES COM_CATE (CATENO)
);

COMMENT ON TABLE RECRUIT is '구인';
COMMENT ON COLUMN RECRUIT.RECRUITNO is '구인번호';
COMMENT ON COLUMN RECRUIT.CATENO is '대분류 번호';
COMMENT ON COLUMN RECRUIT.TITLE is '제목';
COMMENT ON COLUMN RECRUIT.SEQNO is '순서';
COMMENT ON COLUMN RECRUIT.CONTENT is '내용';
COMMENT ON COLUMN RECRUIT.HOMEPAGE is '홈페이지';
COMMENT ON COLUMN RECRUIT.VISIBLE is '출력모드';
COMMENT ON COLUMN RECRUIT.COMNO is '회사번호';
COMMENT ON COLUMN RECRUIT.PASSWD is '패스워드';
COMMENT ON COLUMN RECRUIT.WORD is '검색어';
COMMENT ON COLUMN RECRUIT.RDATE is '등록일';
COMMENT ON COLUMN RECRUIT.SDATE is '접수시작일';
COMMENT ON COLUMN RECRUIT.EDATE is '접수마감일';
COMMENT ON COLUMN RECRUIT.FILE1 is '메인 이미지';
COMMENT ON COLUMN RECRUIT.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN RECRUIT.SIZE1 is '메인 이미지 크기';


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









