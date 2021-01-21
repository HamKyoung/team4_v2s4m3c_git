/**********************************/
/* Table Name: �Ϲ�ȸ�� */
/**********************************/
CREATE TABLE gen_member(
    gen_memberno                      NUMBER(7)    NOT NULL    PRIMARY KEY,
    gen_id                            VARCHAR2(50)     NOT NULL UNIQUE ,
    gen_passwd                        VARCHAR2(20)     NOT NULL,
    gen_name                          VARCHAR2(20)     NOT NULL,
    gen_resident                      VARCHAR2(13)     NOT NULL,
    gen_sex                           VARCHAR2(10)     NOT NULL,
    gen_phone                         VARCHAR2(20)     NOT NULL,
    gen_zipcode                       VARCHAR2(5)    NULL ,
    gen_addr                          VARCHAR2(100)    NULL ,
    gen_addr1                         VARCHAR2(50)     NULL ,
    gen_mail                          VARCHAR2(50)     NOT NULL,
    gen_date                          DATE     NOT NULL
);


drop table gen_member


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE questions(
    ques_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    gen_memberno                      NUMBER(7)    NOT NULL,
    ques_title                        VARCHAR2(200)    NOT NULL,
    ques_con                          CLOB     NOT NULL,
    ques_date                         DATE     NOT NULL,
    ques_views                        NUMBER(10)     DEFAULT 0     NOT NULL,
    ques_passwd                       VARCHAR2(10)     NOT NULL,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

COMMENT ON TABLE questions is '����';
COMMENT ON COLUMN questions.ques_no is '���� ��ȣ';
COMMENT ON COLUMN questions.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN questions.ques_title is '���� ����';
COMMENT ON COLUMN questions.ques_con is '���� ����';
COMMENT ON COLUMN questions.ques_date is '���� ��ϳ�¥';
COMMENT ON COLUMN questions.ques_views is '���� ��ȸ��';
COMMENT ON COLUMN questions.ques_passwd is '���� ��й�ȣ';
drop table questions
/**********************************/
/* Table Name: �亯 */
/**********************************/
CREATE TABLE answer(
    ans_no NUMBER(10) NOT NULL PRIMARY KEY,
    ques_no NUMBER(10),
    ans_title VARCHAR2(200) NOT NULL,
    ans_con CLOB NOT NULL,
    ans_date DATE NOT NULL,
    ans_views NUMERIC(10) DEFAULT 0 NOT NULL,
  FOREIGN KEY (ques_no) REFERENCES questions (ques_no)
);


COMMENT ON TABLE answer is '�亯';
COMMENT ON COLUMN answer.ans_no is '�亯 ��ȣ';
COMMENT ON COLUMN answer.ques_no is '���� ��ȣ';
COMMENT ON COLUMN answer.ans_title is '�亯 ����';
COMMENT ON COLUMN answer.ans_con is '�亯 ����';
COMMENT ON COLUMN answer.ans_date is '�亯 ��ϳ�¥';
COMMENT ON COLUMN answer.ans_views is '�亯 ��ȸ��';

DROP TABLE answer;

DROP SEQUENCE answer_seq;

CREATE SEQUENCE answer_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����



INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '1', 'ù��° ������ ���� �亯', 'ù��° �亯�Դϴ�.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '2', '�ι�° ������ ���� �亯', '�ι�° �亯�Դϴ�.', sysdate, '0');

INSERT INTO answer(ans_no, ques_no, ans_title, ans_con, ans_date, ans_views)
VALUES(answer_seq.nextval, '5', '����° ������ ���� �亯', '����° �亯�Դϴ�.', sysdate, '0');

-- list
SELECT ans_no, ques_no, ans_title, ans_con, ans_date, ans_views
FROM answer
ORDER BY ques_no ASC;

-- read, ��ȸ
SELECT ans_no, ques_no, ans_title, ans_con, ans_date, ans_views
FROM answer
WHERE ques_no = 1;

-- update, ����
UPDATE answer
SET ans_title='������ �亯 ����', ans_con='������ �亯 ����'
WHERE ans_no = 4;

-- dalete, ����
DELETE FROM answer
WHERE ans_no = 4;


SELECT COUNT(*) as ans_cnt
FROM answer
WHERE ques_no = 14;

commit;

