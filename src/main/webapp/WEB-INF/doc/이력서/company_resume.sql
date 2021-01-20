DROP TABLE mem_res CASCADE CONSTRAINTS;
DROP SEQUENCE mem_res_seq;

DROP TABLE res_scho CASCADE CONSTRAINTS;

DROP TABLE res_lice CASCADE CONSTRAINTS;

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
/* Table Name: 기업 회원 */
/**********************************/
CREATE TABLE cor_member(
cor_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
cor_id                         VARCHAR2(50)  NOT NULL UNIQUE,
cor_passwd                     VARCHAR2(20)  NOT NULL,
cor_name                       VARCHAR2(20)  NOT NULL,
cor_resident                   VARCHAR2(13)  NOT NULL,
cor_sex                        VARCHAR2(10)  NOT NULL,
cor_phone                      VARCHAR2(20)  NOT NULL,
cor_zipcode                    VARCHAR2(5)  NULL ,
cor_addr                       VARCHAR2(100)  NULL ,
cor_addr1                      VARCHAR2(50)  NULL ,
cor_mail                       VARCHAR2(50)  NOT NULL,
cor_date                       DATE  NOT NULL
);

COMMENT ON TABLE cor_member is '기업 회원';
COMMENT ON COLUMN cor_member.cor_memberno is '기업 회원 번호';
COMMENT ON COLUMN cor_member.cor_id is '기업 회원 아이디';
COMMENT ON COLUMN cor_member.cor_passwd is '기업 회원 비밀번호';
COMMENT ON COLUMN cor_member.cor_name is '기업 회원 이름';
COMMENT ON COLUMN cor_member.cor_resident is '기업 회원 생년월일';
COMMENT ON COLUMN cor_member.cor_sex is '기업 회원 성별 ';
COMMENT ON COLUMN cor_member.cor_phone is '기업 회원 전화 번호';
COMMENT ON COLUMN cor_member.cor_zipcode is '기업 회원 우편 번호';
COMMENT ON COLUMN cor_member.cor_addr is '기업 회원 주소';
COMMENT ON COLUMN cor_member.cor_addr1 is '기업 회원 주소1';
COMMENT ON COLUMN cor_member.cor_mail is '기업 회원 이메일';
COMMENT ON COLUMN cor_member.cor_date is '기업 회원 가입 날짜';

DROP SEQUENCE cor_member_seq;
CREATE SEQUENCE cor_member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


-- 등록
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '테스트', '1111111', '남자', '01011111111', 'test@test.com', sysdate);



/**********************************/
/* Table Name: 이력서 */
/**********************************/
CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		res_phone                     		VARCHAR2(60)		 NOT NULL,
		res_mail1                      		VARCHAR2(200)		 NOT NULL,
		res_mail2                      		VARCHAR2(200)		 NOT NULL,
		res_title                     		VARCHAR2(100)		    NOT NULL,
		res_intro                     		VARCHAR2(800)		    NOT NULL,
		res_work                      	CLOB		                    DEFAULT 0		 NULL ,
		res_web                       	VARCHAR2(100)		NULL ,
		res_visible                   	CHAR(1)		            DEFAULT 'Y'	 NOT NULL,
		res_date                      		DATE		                NOT NULL,
		res_pic                       		VARCHAR2(100)		 NULL ,
		res_thumb                     	VARCHAR2(100)		 NULL ,
		res_size                      		NUMBER(10)		         NULL ,
		gen_memberno               	NUMBER(7)		         NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE mem_res_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 이력서 학력정보 */
/**********************************/
CREATE TABLE res_scho(
		res_scname                     VARCHAR2(80)		            NOT NULL,
		res_major1                        VARCHAR2(100)		        NOT NULL,
		res_major2                    	VARCHAR2(100)		        NULL ,
		res_gotin                     		VARCHAR2(50)		            NOT NULL,
		res_grad                      	VARCHAR2(50)		            NOT NULL,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

/**********************************/
/* Table Name: 자격증 */
/**********************************/
CREATE TABLE res_lice(
		res_lice1                     		VARCHAR2(50)		 NULL 		 ,
		res_lice1_lev                 		VARCHAR2(30)		 NULL ,
		res_lice2                     		VARCHAR2(50)		 NULL,
		res_lice2_lev                 		VARCHAR2(30)		 NULL ,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

-- 등록
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '홍길동', '010-1234-5678', 'abcde', 'naver.com', '안녕하세요', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '김소영',  '010-1234-5678', 'abcde', 'naver.com', '안녕하세요', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '김철수',  '010-1234-5678', 'abcde', 'naver.com', '안녕하세요', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 3);

INSERT INTO res_scho(res_scname, res_major1, res_major2, res_gotin,res_grad)
VALUES('서울대학교', '디지털콘텐츠게임애니메이션공학부', '사회복지학과', 980076,998076);

INSERT INTO res_lice(res_lice1, res_lice1_lev, res_lice2, res_lice2_lev)
VALUES('토익', 960, '토스', 7, 2);

INSERT ALL
INTO mem_res
VALUES(mem_res_seq.nextval, '박지현', '01012554841', 'abcde', 'naver.com', '제목', '자기소개', 'ㅇㅇ회사 ㅇㅇ 직무 근무', 'www.daum.net', 'Y', sysdate, '사진', '썸네일', 10, 1)
INTO res_scho
VALUES ('제주대학교', '영어영문학과', '신문방송학과', 200106, 201115,mem_res_seq.nextval)
INTO res_lice
VALUES('토익', 990, '토스', 9,mem_res_seq.nextval)
SELECT * FROM DUAL; 


-- 목록
SELECT*FROM mem_res ORDER BY res_no ASC;
SELECT*FROM res_scho;
SELECT*FROM res_lice;
SELECT*FROM mem_res ORDER BY gen_memberno ASC;

-- 조회
SELECT r.res_no as mem_res_res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, 
s.res_no as res_scho_res_no, res_scname, res_major1, res_major2, res_gotin,res_grad, 
l.res_no as res_lice_res_no, res_lice1, res_lice1_lev, res_lice2, res_lice2_lev
FROM mem_res r, res_scho s, res_lice l
WHERE r.res_no=s.res_no AND s.res_no=l.res_no AND r.res_no = 1;

-- 수정
UPDATE mem_res
SET res_visible='N'
WHERE res_no = 1;

-- 삭제
DELETE mem_res
WHERE res_no = 8;

COMMIT;










