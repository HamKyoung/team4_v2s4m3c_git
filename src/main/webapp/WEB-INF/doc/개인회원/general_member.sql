/**********************************/
/* Table Name: �Ϲ� ȸ�� */
/**********************************/
CREATE TABLE gen_member(
		gen_memberno                  		NUMBER(7)		 NOT NULL,
		gen_id                        		VARCHAR2(50)		 NOT NULL,
		gen_passwd                    		VARCHAR2(20)		 NOT NULL,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		gen_resident                  		VARCHAR2(13)		 NOT NULL,
		gen_sex                       		VARCHAR2(10)		 NOT NULL,
		gen_phone                     		VARCHAR2(20)		 NOT NULL,
		gen_addr                      		VARCHAR2(100)		 NOT NULL,
		gen_mail                      		VARCHAR2(50)		 NOT NULL,
		gen_date                      		DATE		 NOT NULL
);

COMMENT ON TABLE gen_member is '�Ϲ� ȸ��';
COMMENT ON COLUMN gen_member.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN gen_member.gen_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN gen_member.gen_passwd is '��й�ȣ ';
COMMENT ON COLUMN gen_member.gen_name is 'ȸ�� �̸�';
COMMENT ON COLUMN gen_member.gen_resident is '�ֹ� ��ȣ';
COMMENT ON COLUMN gen_member.gen_sex is '����';
COMMENT ON COLUMN gen_member.gen_phone is '��ȭ ��ȣ';
COMMENT ON COLUMN gen_member.gen_addr is 'ȸ�� �ּ�';
COMMENT ON COLUMN gen_member.gen_mail is '�̸���';
COMMENT ON COLUMN gen_member.gen_date is '���� ��¥';

drop table gen_member;
drop sequence gen_member_seq;

CREATE SEQUENCE gen_member_seq
  START WITH 1              -- ?��?�� 번호
  INCREMENT BY 1          -- 증�?�?
  MAXVALUE 9999999 -- 최�?�?: 9999999 --> NUMBER(7) ???��
  CACHE 2                       -- 2번�? 메모리에?���? 계산
  NOCYCLE;                     -- ?��?�� 1�??�� ?��?��?��?�� 것을 방�?

-- 등록
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '?��?��?��', '1111111', '?��?��', '01011111111', '?��?��?��?�� ?��?��?��?��', 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test1', '1234', '?��?��?��', '1111111', '?��?��', '01011111111', '?��?��?��?�� ?��?��?��?��', 'test@test.com', sysdate);

insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test2', '1234', '?��?��?��', '1111111', '?��?��', '01011111111', '?��?��?��?�� ?��?��?��?��', 'test@test.com', sysdate);

SELECT * FROM gen_member;

-- 목록
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date
FROM gen_member
ORDER BY gen_memberno ASC;

-- 조회
SELECT gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone, gen_addr ,gen_mail, gen_date
FROM gen_member
WHERE gen_memberno = 1;

commit;

-- ?��?��
UPDATE gen_member
SET gen_id='test4', gen_name='test', gen_resident='2222222', gen_sex='?��?��', gen_phone='010222222222', gen_addr='?��?��?��', gen_mail='메일'
WHERE gen_memberno = 4;

-- ?��?��
DELETE FROM gen_member
WHERE gen_memberno =1;

-- ?��?��?�� 중복 ?��?��
SELECT COUNT(*) as id_cnt
FROM gen_member
WHERE gen_id='test2';

-- ?��?��?��?�� ?��?��
SELECT COUNT(*) as passwd_check
FROM gen_member
WHERE gen_memberno=24 AND gen_passwd='1234';

--비�?번호 �?�?
UPDATE gen_member
SET gen_passwd='12345'
WHERE gen_memberno = 2;
