/**********************************/
/* Table Name: 회사뉴스 */
/**********************************/
DROP TABLE news;
CREATE TABLE news(
		newsno                        		NUMBER(30)		 NOT NULL,
		news_title                    		VARCHAR2(1000)		 NOT NULL,
		news_content                  		CLOB 		 NOT NULL,
		news_url                      		VARCHAR2(500)		 NOT NULL,
        news_passwd                      	VARCHAR2(15)		 NOT NULL,
		news_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		news_good                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		news_coment                   		VARCHAR2(1000)		 NULL ,
		news_date                     		DATE		 NOT NULL,
		news_file1                    		VARCHAR2(100)		 NULL ,
		news_thumb1                       VARCHAR2(100)		 NULL ,
		news_size1                    		NUMBER(10)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE news is '회사뉴스';
COMMENT ON COLUMN news.newsno is '뉴스 번호';
COMMENT ON COLUMN news.news_title is '뉴스 제목';
COMMENT ON COLUMN news.news_content is '뉴스 내용';
COMMENT ON COLUMN news.news_url is '뉴스 출처';
COMMENT ON COLUMN news.news_cnt is '뉴스 조회수';
COMMENT ON COLUMN news.news_good is '뉴스 추천수';
COMMENT ON COLUMN news.news_coment is '뉴스 댓글';
COMMENT ON COLUMN news.news_date is '등록일';
COMMENT ON COLUMN news.news_file1 is '뉴스 메인 이미지';
COMMENT ON COLUMN news.news_thumb1 is '뉴스 메인 이미지 Preview';
COMMENT ON COLUMN news.news_size1 is '뉴스 매인 이미지 크기';


ALTER TABLE news ADD CONSTRAINT IDX_news_PK PRIMARY KEY (newsno);


DROP SEQUENCE news_seq;
CREATE SEQUENCE news_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name:  뉴스 */
/**********************************/

-- 등록
INSERT INTO news(newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_passwd, news_date, news_file1, news_thumb1, news_size1)
VALUES(news_seq.nextval, '삼성채용뉴스', '이러한 조건하에', 'https://', 0, 0, '좋은 도움이됬어요', '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- 뉴스 테이블에 추가
INSERT INTO news(newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_passwd, news_date, news_file1, news_thumb1, news_size1 )
VALUES(news_seq.nextval, '삼성채용뉴스', '이러한 조건하에', 'https://', 0, 0, '좋은 도움이됬어요', '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO news(newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_passwd, news_date, news_file1, news_thumb1, news_size1)
VALUES(news_seq.nextval, 'LG채용뉴스', '이러한 조건하에', 'https://', 0, 0, '좋은 도움이됬어요', '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM news ORDER BY newsno ASC;

-- 목록
SELECT newsno, news_title, news_content, news_url, news_cnt, news_good, news_passwd, news_date, news_file1, news_thumb1, news_size1
FROM news
ORDER BY newsno ASC;

-- 조회
SELECT newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_date, news_file1, news_thumb1, news_size1
FROM news
WHERE newsno=1;

-- 수정
UPDATE news
SET news_title='LG채용뉴스', news_content = '이러한 조건하에', news_url='https://'
WHERE newsno = 1;

commit;

-- 패스워드 검사
SELECT COUNT(*) as news_passwd_cnt
FROM news
WHERE newsno=1 AND news_passwd='1234';

SELECT newsno, news_passwd
FROM news 
ORDER BY newsno DESC;   

-- 삭제
DELETE news
WHERE newsno = 2;

SELECT * FROM news;

-- 조회수 증가
UPDATE news
SET news_cnt = news_cnt + 1 
WHERE newsno = 1;

-- 추천수 증가
UPDATE news
SET news_good = news_good + 1 
WHERE newsno = 1;

-- 컬럼 추가
ALTER TABLE news
ADD (word VARCHAR2(1000));

DESCRIBE news;

-- 컬럼 속성 수정
ALTER TABLE news
MODIFY (news_word VARCHAR2(30));
  
-- 컬럼명 수정
ALTER TABLE news
RENAME COLUMN word to news_word;
  
-- 컬럼 삭제
ALTER TABLE news
DROP COLUMN news_word;
 



