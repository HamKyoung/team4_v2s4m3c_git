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
            
commit;

2) 전체목록
SELECT recruitno, cateno, title, content, homepage ,passwd, word, rdate
FROM recruit 
ORDER BY recruitno DESC;

commit;

2-1) cateno별 목록
SELECT recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1
FROM recruit 
WHERE cateno = 1
ORDER BY recruitno DESC;

3) 1건 조회
SELECT recruitno, cateno, title, seqno ,content, homepage, passwd, word, rdate,
                              file1, thumb1, size1
FROM recruit
WHERE recruitno = 1;

4) 수정
UPDATE recruit 
SET file1='', thumb1='', size1=0
commit;


UPDATE recruit 
SET title='제목', content='내용', homepage='http://', word='검색어'
WHERE recruitno = 1;

COMMIT;

-- 글 삭제, id="delete"
DELETE FROM recruit
WHERE recruitno=1;

-- 패스워드 검사, id="passwd_check"
SELECT COUNT(*) as passwd_cnt
FROM recruit
WHERE recruitno=5 AND passwd='1234';


