/**********************************/
/* Table Name: ȸ�紺�� */
/**********************************/
DROP TABLE jobnws;
CREATE TABLE jobnws(
		jobnwsno                        		NUMBER(30)		 NOT NULL,
		jobnws_title                    		VARCHAR2(1000)		 NOT NULL,
		jobnws_content                  		CLOB 		 NOT NULL,
		jobnws_url                      		VARCHAR2(500)		 NOT NULL,
        jobnws_passwd                      	VARCHAR2(15)		 NOT NULL,
		jobnws_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_good                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_coment                   		VARCHAR2(1000)		 NULL ,
		jobnws_date                     		DATE		 NOT NULL,
		jobnws_file1                    		VARCHAR2(100)		 NULL ,
		jobnws_thumb1                       VARCHAR2(100)		 NULL ,
		jobnws_size1                    		NUMBER(10)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE jobnws is 'ȸ�紺��';
COMMENT ON COLUMN jobnws.jobnwsno is '���� ��ȣ';
COMMENT ON COLUMN jobnws.jobnws_title is '���� ����';
COMMENT ON COLUMN jobnws.jobnws_content is '���� ����';
COMMENT ON COLUMN jobnws.jobnws_url is '���� ��ó';
COMMENT ON COLUMN jobnws.jobnws_cnt is '���� ��ȸ��';
COMMENT ON COLUMN jobnws.jobnws_good is '���� ��õ��';
COMMENT ON COLUMN jobnws.jobnws_coment is '���� ���';
COMMENT ON COLUMN jobnws.jobnws_date is '�����';
COMMENT ON COLUMN jobnws.jobnws_file1 is '���� ���� �̹���';
COMMENT ON COLUMN jobnws.jobnws_thumb1 is '���� ���� �̹��� Preview';
COMMENT ON COLUMN jobnws.jobnws_size1 is '���� ���� �̹��� ũ��';


ALTER TABLE jobnws ADD CONSTRAINT IDX_jobnws_PK PRIMARY KEY (jobnwsno);


DROP SEQUENCE jobnws_seq;
CREATE SEQUENCE jobnws_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
/**********************************/
/* Table Name:  ���� */
/**********************************/

-- ���
INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(news_seq.nextval, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- ���� ���̺� �߰�
INSERT INTO jobnws(jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1 )
VALUES(news_seq.nextval, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO jobnws(newsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(news_seq.nextval, 'LGä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM jobnws ORDER BY jobnwsno ASC;

-- ���
SELECT jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1
FROM jobnws
ORDER BY jobnwsno ASC;

-- ��ȸ
SELECT jobnwsno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_good, jobnws_coment, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1
FROM jobnws
WHERE jobnwsno=1;

-- ����
UPDATE jobnws
SET jobnws_title='LGä�봺��', jobnws_content = '�̷��� �����Ͽ�', jobnws_url='https://'
WHERE jobnwsno = 1;

commit;

-- �н����� �˻�
SELECT COUNT(*) as news_passwd_cnt
FROM jobnws
WHERE jobnwsno=1 AND jobnws_passwd='1234';

SELECT jobnwsno, jobnws_passwd
FROM jobnws 
ORDER BY jobnwsno DESC;   

-- ����
DELETE jobnws
WHERE jobnwsno = 2;

SELECT * FROM jobnws;

-- ��ȸ�� ����
UPDATE jobnws
SET jobnws_cnt = jobnws_cnt + 1 
WHERE jobnwsno = 1;

-- ��õ�� ����
UPDATE jobnws
SET jobnws_good = jobnws_good + 1 
WHERE jobnwsno = 1;

-- �÷� �߰�
ALTER TABLE jobnws
ADD (word VARCHAR2(1000));

DESCRIBE jobnws;

-- �÷� �Ӽ� ����
ALTER TABLE jobnws
MODIFY (jobnws_word VARCHAR2(30));
  
-- �÷��� ����
ALTER TABLE jobnws
RENAME COLUMN word to jobnws_word;
  
-- �÷� ����
ALTER TABLE jobnws
DROP COLUMN jobnws_word;
 



