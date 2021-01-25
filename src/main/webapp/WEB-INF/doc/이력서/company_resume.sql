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
           '경력기술', 'www.naver.com', 'Y', sysdate, 'member.jpg', 'member_t.jpg', 1, 5);       
           
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

-- update, 수정
UPDATE mem_res
SET gen_name='가길동', res_phone='수정 완료', res_mail='수정 완료', res_intro='수정 완료',res_school='수정 완료',res_major='수정 완료',res_lice='수정 완료'
WHERE res_no = 1;

-- dalete, 삭제
DELETE FROM mem_res
WHERE res_no = 3;

-- 출력 모드의 변경
UPDATE mem_res
SET res_visible='N'
WHERE res_no=1;

COMMIT;