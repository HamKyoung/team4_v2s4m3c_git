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
/* Table Name: 회사뉴스 */
/**********************************/

DROP TABLE jobnws;
DROP TABLE jobnws CASCADE CONSTRAINTS;
CREATE TABLE jobnws(
		jobnwsno                        		NUMBER(30)		 NOT NULL PRIMARY KEY,
        adminno                              NUMBER(30)		 NOT NULL,
		jobnws_title                    		VARCHAR2(1000)		 NOT NULL,
		jobnws_content                  		CLOB 		 NOT NULL,
		jobnws_url                      		VARCHAR2(500)		 NOT NULL,
        jobnws_passwd                      	VARCHAR2(15)		 NOT NULL,
		jobnws_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_date                     		DATE		 NOT NULL,
		jobnws_file1                    		VARCHAR2(100)		 NULL ,
		jobnws_thumb1                       VARCHAR2(100)		 NULL ,
		jobnws_size1                    		NUMBER(10)		 DEFAULT 0		 NULL,
        FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE jobnws is '회사뉴스';
COMMENT ON COLUMN jobnws.jobnwsno is '뉴스 번호';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN jobnws.jobnws_title is '뉴스 제목';
COMMENT ON COLUMN jobnws.jobnws_content is '뉴스 내용';
COMMENT ON COLUMN jobnws.jobnws_passwd is '뉴스 비밀번호';
COMMENT ON COLUMN jobnws.jobnws_url is '뉴스 출처';
COMMENT ON COLUMN jobnws.jobnws_cnt is '뉴스 조회수';
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
INSERT INTO jobnws(jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 1, '삼성채용뉴스', '이러한 조건하에', 'https://',  0,  '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- 뉴스 테이블에 추가
INSERT INTO jobnws(jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 1, '삼성채용뉴스', '이러한 조건하에', 'https://', 0,  '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO jobnws(jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 1 ,'LG채용뉴스', '이러한 조건하에', 'https://', 0,  '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM jobnws ORDER BY jobnwsno ASC;

-- 목록
SELECT jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1
FROM jobnws
ORDER BY jobnwsno ASC;

-- 조회
SELECT jobnwsno, adminno,jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1
FROM jobnws
WHERE jobnwsno=1;

-- 수정
UPDATE jobnws
SET jobnws_title='LG채용뉴스', jobnws_content = '이러한 조건하에', jobnws_url='https://'
WHERE jobnwsno = 1;

commit;

-- 패스워드 검사
SELECT COUNT(*) as jobnws_passwd_cnt
FROM jobnws
WHERE jobnwsno=1 AND jobnws_passwd='1234';

SELECT jobnwsno, jobnws_passwd
FROM jobnws 
ORDER BY jobnwsno DESC;   

-- 삭제
DELETE jobnws
WHERE jobnwsno = 5;

SELECT * FROM jobnws;

-- 조회수 증가
UPDATE jobnws
SET jobnws_cnt = jobnws_cnt + 1 
WHERE jobnwsno = 1;

-- 컬럼 추가
ALTER TABLE jobnws
ADD (word VARCHAR2(1000));

DESCRIBE jobnws;

-- 컬럼 속성 수정
ALTER TABLE jobnws
MODIFY (jobnws_word VARCHAR2(30));
  
-- 컬럼명 수정
ALTER TABLE jobnws
RENAME COLUMN word to jobnws_word;
  
-- 컬럼 삭제
ALTER TABLE jobnws
DROP COLUMN jobnws_word;
 



