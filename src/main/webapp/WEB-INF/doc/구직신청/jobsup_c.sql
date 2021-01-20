/**********************************/
/* Table Name: 회사소개 */
/**********************************/
DROP TABLE com_intro;
CREATE TABLE com_intro(
comno                          NUMBER(10)  NOT NULL  PRIMARY KEY,
com_name                       VARCHAR2(50)  NOT NULL,
com_form                       VARCHAR2(20)  NOT NULL,
com_type                           VARCHAR2(100)  NOT NULL,
sales                          VARCHAR2(50)  NOT NULL,
homepage                       VARCHAR2(50)  NOT NULL,
address                        VARCHAR2(100)  NOT NULL,
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

-- 등록
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage, address, num_people, e_date, ceo_name)
VALUES(comintro_seq.nextval, '네이버클라우드', '1000대기업', '포털 및 기타 인터넷 정보매개 서비스업', '4925억 8052만원', 'http://www.nbp-corp.com/', '경기 성남시 분당구 분당내곡로117 11층', 8, sysdate, '박원기');

COMMIT;

-- 목록
SELECT comno, com_name, com_form, com_type, sales, homepage,address,num_people,e_date,ceo_name
FROM com_intro
ORDER BY comno ASC;

-- 조회
SELECT comno, com_name, com_form, com_type, sales, homepage, address,num_people, e_date,ceo_name
FROM com_intro
WHERE comno=2;

-- 수정
UPDATE com_intro
SET com_form='대기업'
WHERE cateno = 1;

-- 삭제
DELETE cate
WHERE cateno = 3;



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
  
-- 등록
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 'test@test.com', sysdate);

SELECT * FROM gen_member;

-- 목록
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- 조회
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;

COMMIT;

-- 수정
UPDATE gen_member
SET gen_id='test4', gen_name='test', gen_resident='2222222', gen_sex='여자', gen_phone='010222222222', gen_addr='테스트시 테스트동', gen_mail='메일'
WHERE gen_memberno = 4;

-- 삭제
DELETE FROM gen_member
WHERE gen_memberno =1;

COMMIT;

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

COMMIT;

DROP SEQUENCE jobsup_seq;
CREATE SEQUENCE jobsup_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
 COMMIT; 
  
  
-- 등록
INSERT INTO jobsup(jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date)
VALUES(jobsup_seq.nextval, 1, 2, '믿음직하고 꼼꼼한사람입니다.', '저는 이 회사에 지원하고 싶은 이유는 뭣보다 돈이필요해서 입니다.', sysdate);
  
COMMIT;

-- 목록
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
ORDER BY jobsupno ASC;

-- 조회
SELECT jobsupno, gen_memberno, comno, jobsup_title, jobsup_msg, jobsup_date
FROM jobsup
WHERE jobsupno = 1;

-- 수정
UPDATE jobsup
SET jobsup_title='믿음직하고 꼼꼼한사람입니다.', jobsup_msg='돈이필요해서 입니다'
WHERE jobsupno = 1;



COMMIT;
