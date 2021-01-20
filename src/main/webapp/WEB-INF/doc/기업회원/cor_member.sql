/**********************************/
/* Table Name: 기업 회원 */
/**********************************/
drop table cor_member;
CREATE TABLE cor_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		cor_id                        		VARCHAR2(50)		 NOT NULL UNIQUE,
		cor_passwd                    		VARCHAR2(20)		 NOT NULL,
		cor_name                      		VARCHAR2(20)		 NOT NULL,
		cor_resident                  		VARCHAR2(13)		 NOT NULL,
		cor_sex                       		VARCHAR2(10)		 NOT NULL,
		cor_phone                     		VARCHAR2(20)		 NOT NULL,
		cor_zipcode                   		VARCHAR2(5)		 NULL ,
		cor_addr                      		VARCHAR2(100)		 NULL ,
		cor_addr1                     		VARCHAR2(50)		 NULL ,
		cor_mail                      		VARCHAR2(50)		 NOT NULL,
		cor_date                      		DATE		 NOT NULL
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

-- 조회
SELECT cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date
FROM cor_member
WHERE cor_memberno = 1;

-- 수정
UPDATE cor_member
SET cor_id='test2', cor_passwd='1234', cor_name='test', cor_resident='961111', cor_sex='남자', cor_phone='0101111111', cor_addr='주소', cor_mail='메일'
WHERE cor_memberno = 4;

-- 삭제
DELETE FROM cor_member
WHERE cor_memberno =1;

--비밀번호 변경
UPDATE cor_member
SET cor_passwd='1234'
WHERE cor_memberno=2;

commit;

-- 로그인
SELECT COUNT(*) as cnt
FROM cor_member
WHERE cor_id='test' AND cor_passwd='1234';

-- id를 이용한 회원 정보 조회
SELECT cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_zipcode, cor_addr, cor_addr1,  cor_mail, cor_date
FROM cor_member
WHERE cor_id = 'test';

