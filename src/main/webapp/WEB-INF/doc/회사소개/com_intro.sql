/**********************************/
/* Table Name: 기업 회원 */
/**********************************/

DROP TABLE cor_member CASCADE CONSTRAINTS; 
DROP TABLE cor_member;
CREATE TABLE cor_member(
		cor_memberno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		cor_id                        		VARCHAR2(50)		 NOT NULL,
		cor_passwd                    		VARCHAR2(20)		 NOT NULL,
		cor_name                      		VARCHAR2(20)		 NOT NULL,
		cor_resident                  		VARCHAR2(13)		 NOT NULL,
		cor_sex                       		VARCHAR2(10)		 NOT NULL,
		cor_phone                     		VARCHAR2(20)		 NOT NULL,
		cor_addr                      		VARCHAR2(100)		 NOT NULL,
		cor_mail                      		VARCHAR2(50)		 NOT NULL,
		cor_date                      		DATE		 NOT NULL
);

COMMENT ON TABLE corporate_member is '기업 회원';
COMMENT ON COLUMN corporate_member.cor_memberno is '기업 회원 번호';
COMMENT ON COLUMN corporate_member.cor_id is '기업 회원 아이디';
COMMENT ON COLUMN corporate_member.cor_passwd is '기업 회원 비밀번호';
COMMENT ON COLUMN corporate_member.cor_name is '기업 회원 이름';
COMMENT ON COLUMN corporate_member.cor_resident is '기업 회원 주민 번호';
COMMENT ON COLUMN corporate_member.cor_sex is '기업 회원 성별 ';
COMMENT ON COLUMN corporate_member.cor_phone is '기업 회원 전화 번호';
COMMENT ON COLUMN corporate_member.cor_addr is '기업 회원 주소';
COMMENT ON COLUMN corporate_member.cor_mail is '기업 회원 이메일';
COMMENT ON COLUMN corporate_member.cor_date is '기업 회원 가입 날짜';

DROP SEQUENCE cormem_seq;
CREATE SEQUENCE cormem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 회사소개 */
/**********************************/
DROP TABLE com_intro CASCADE CONSTRAINTS; 
DROP TABLE com_intro;

CREATE TABLE com_intro(
		comno                         		NUMBER(7)		    NOT NULL		 PRIMARY KEY,
		com_name                      	VARCHAR2(1000)		 NOT NULL,
		com_form                      		VARCHAR2(1000)		 NOT NULL,
		com_type                      		VARCHAR2(1000)		 NOT NULL,
		sales                         		    VARCHAR2(50)	         NOT NULL,
		homepage                      	VARCHAR2(1000)		 NOT NULL,
		address                       		VARCHAR2(1000)		 NOT NULL,
		num_people                    	VARCHAR2(50)	         NOT NULL,
		edate                          		VARCHAR2(500)	                 NOT NULL,
		ceo_name                      		VARCHAR2(1000)		 NOT NULL,
		cor_memberno                  	NUMBER(7)		     NULL ,
        visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
  FOREIGN KEY (cor_memberno) REFERENCES corporate_member (cor_memberno)
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
COMMENT ON COLUMN com_intro.edate is '설립일';
COMMENT ON COLUMN com_intro.ceo_name is '대표자명';
COMMENT ON COLUMN com_intro.cor_memberno is '기업 회원 번호';
COMMENT ON COLUMN com_intro.visible is '출력모드';


DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,edate,ceo_name,cor_memberno,visible)
VALUES(comintro_seq.nextval, '솔데스크','학원','컴퓨터학원','10억원','www.soldesk.com','종로구관철로','50명','2010-01-01','솔원장',1,'Y');

INSERT INTO corporate_member(cor_memberno,cor_id,cor_passwd,cor_name ,cor_resident ,cor_sex , cor_phone,cor_addr,cor_mail,cor_date)
VALUES(cormem_seq.nextval,'abc','1234','홍길동','1990-01-01','여자','010-111-1111','서울특별시','seoul@naver',sysdate);


-- 목록
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name,visible
FROM com_intro
ORDER BY comno ASC;

commit;

-- 조회
SELECT comno, com_name, com_form,com_type, sales, homepage,address,num_people,edate,ceo_name
FROM com_intro
WHERE comno=1;

-- 수정
UPDATE com_intro
SET com_form='대기업'
WHERE comno = 1;

-- 삭제
DELETE com_intro
WHERE comno = 3;

-- 출력 모드의 변경
UPDATE com_intro
SET visible='Y'
WHERE comno=2;

-- 출력 순서에따른 전체 목록
SELECT comno, com_name, com_type, visible
FROM com_intro
ORDER BY comno ASC;

