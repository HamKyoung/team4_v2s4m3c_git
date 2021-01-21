
/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE questions(
		ques_no                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		gen_memberno                  		NUMBER(7)		 NOT NULL ,
		ques_title                    		VARCHAR2(200)		 NOT NULL,
		ques_con                      		CLOB		 NOT NULL,
		ques_date                     		DATE		 NOT NULL,
		ques_views                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		ques_passwd                   		VARCHAR2(10)		 NOT NULL,
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

DROP TABLE questions;

DROP SEQUENCE questions_seq;
CREATE SEQUENCE questions_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

  -- insert
INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', 'ù��° ����', '������ �������� �Դϱ�?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '1', '�ι�° ����', '������ ���� �Դϱ�?', sysdate, '0', '1234');

INSERT INTO questions(ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd)
VALUES(questions_seq.nextval, '2', '����° ����', '������ ��� �Դϱ�?', sysdate, '0', '1234');

-- list
SELECT ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd
FROM questions
ORDER BY ques_no ASC;

SELECT q.ques_no, q.gen_memberno, q.ques_title, q.ques_con, q.ques_date, q.ques_views, q.ques_passwd, gm.gen_name
FROM questions q, gen_member gm
WHERE q.gen_memberno = gm.gen_memberno
ORDER BY q.ques_no DESC;

-- read, ��ȸ
SELECT ques_no, gen_memberno, ques_title, ques_con, ques_date, ques_views, ques_passwd
FROM questions
WHERE ques_no = 1;

-- update, ����
UPDATE questions
SET ques_title='������ �����մϴ�.', ques_con='������ ����'
WHERE ques_no = 1;

-- dalete, ����
DELETE FROM questions
WHERE ques_no = 4;

-- �н����� üũ
SELECT COUNT(*) as passwd_cnt
FROM questions
WHERE ques_no=1 AND ques_passwd=1234;

commit;




