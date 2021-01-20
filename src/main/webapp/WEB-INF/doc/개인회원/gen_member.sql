/**********************************/
/* Table Name: 일반 회원 */
/**********************************/
drop table gen_member;
CREATE TABLE gen_member(
		gen_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		gen_id                        		VARCHAR2(50)		 NOT NULL UNIQUE ,
		gen_passwd                    		VARCHAR2(20)		 NOT NULL,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		gen_resident                  		VARCHAR2(13)		 NOT NULL,
		gen_sex                       		VARCHAR2(10)		 NOT NULL,
		gen_phone                     		VARCHAR2(20)		 NOT NULL,
		gen_zipcode                   		VARCHAR2(5)		 NULL ,
		gen_addr                      		VARCHAR2(100)		 NULL ,
		gen_addr1                     		VARCHAR2(50)		 NULL ,
		gen_mail                      		VARCHAR2(50)		 NOT NULL,
		gen_date                      		DATE		 NOT NULL
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
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test1', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test2', '1234', '테스트', '010101', '남자', '01012341234', 0, 0, 0, 'test@test.com', sysdate);

SELECT * FROM gen_member;

commit;

-- 목록
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- 조회
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;

commit;

-- 수정
UPDATE gen_member
SET gen_id='test4', gen_name='test', gen_resident='2222222', gen_sex='여자', gen_phone='010222222222', gen_addr='테스트시 테스트동', gen_mail='메일'
WHERE gen_memberno = 4;

-- 삭제
DELETE FROM gen_member
WHERE gen_memberno =1;

-- 아이디 중복체크
SELECT COUNT(*) as id_cnt
FROM gen_member
WHERE gen_id='test2';

-- 비밀번호 체크
SELECT COUNT(*) as passwd_check
FROM gen_member
WHERE gen_memberno=24 AND gen_passwd='1234';

--비밀번호 변경
UPDATE gen_member
SET gen_passwd='12345'
WHERE gen_memberno = 2;

--로그인
SELECT COUNT(*) as cnt
FROM gen_member
WHERE gen_id='test' AND gen_passwd='1234';

-- id를 이용한 회원 정보 조회
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_zipcode, gen_addr, gen_addr1, gen_mail, gen_date
FROM gen_member
WHERE gen_id = 'test';


