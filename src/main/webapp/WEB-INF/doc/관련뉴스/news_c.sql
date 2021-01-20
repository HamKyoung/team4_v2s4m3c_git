/**********************************/
/* Table Name: ȸ�紺�� */
/**********************************/
DROP TABLE news;
CREATE TABLE news(
		newsno                        		NUMBER(30)		 NOT NULL,
		news_title                    		VARCHAR2(1000)		 NOT NULL,
		news_content                  		CLOB 		 NOT NULL,
		news_url                      		VARCHAR2(500)		 NOT NULL,
        news_passwd                      	VARCHAR2(15)		 NOT NULL,
		news_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		news_good                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		news_coment                   		VARCHAR2(1000)		 NULL ,
		news_date                     		DATE		 NOT NULL,
		news_file1                    		VARCHAR2(100)		 NULL ,
		news_thumb1                       VARCHAR2(100)		 NULL ,
		news_size1                    		NUMBER(10)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE news is 'ȸ�紺��';
COMMENT ON COLUMN news.newsno is '���� ��ȣ';
COMMENT ON COLUMN news.news_title is '���� ����';
COMMENT ON COLUMN news.news_content is '���� ����';
COMMENT ON COLUMN news.news_url is '���� ��ó';
COMMENT ON COLUMN news.news_cnt is '���� ��ȸ��';
COMMENT ON COLUMN news.news_good is '���� ��õ��';
COMMENT ON COLUMN news.news_coment is '���� ���';
COMMENT ON COLUMN news.news_date is '�����';
COMMENT ON COLUMN news.news_file1 is '���� ���� �̹���';
COMMENT ON COLUMN news.news_thumb1 is '���� ���� �̹��� Preview';
COMMENT ON COLUMN news.news_size1 is '���� ���� �̹��� ũ��';


ALTER TABLE news ADD CONSTRAINT IDX_news_PK PRIMARY KEY (newsno);


DROP SEQUENCE news_seq;
CREATE SEQUENCE news_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
/**********************************/
/* Table Name:  ���� */
/**********************************/

-- ���
INSERT INTO news(newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_passwd, news_date, news_file1, news_thumb1, news_size1)
VALUES(news_seq.nextval, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- ���� ���̺� �߰�
INSERT INTO news(newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_passwd, news_date, news_file1, news_thumb1, news_size1 )
VALUES(news_seq.nextval, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO news(newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_passwd, news_date, news_file1, news_thumb1, news_size1)
VALUES(news_seq.nextval, 'LGä�봺��', '�̷��� �����Ͽ�', 'https://', 0, 0, '���� �����̉���', '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM news ORDER BY newsno ASC;

-- ���
SELECT newsno, news_title, news_content, news_url, news_cnt, news_good, news_passwd, news_date, news_file1, news_thumb1, news_size1
FROM news
ORDER BY newsno ASC;

-- ��ȸ
SELECT newsno, news_title, news_content, news_url, news_cnt, news_good, news_coment, news_date, news_file1, news_thumb1, news_size1
FROM news
WHERE newsno=1;

-- ����
UPDATE news
SET news_title='LGä�봺��', news_content = '�̷��� �����Ͽ�', news_url='https://'
WHERE newsno = 1;

commit;

-- �н����� �˻�
SELECT COUNT(*) as news_passwd_cnt
FROM news
WHERE newsno=1 AND news_passwd='1234';

SELECT newsno, news_passwd
FROM news 
ORDER BY newsno DESC;   

-- ����
DELETE news
WHERE newsno = 2;

SELECT * FROM news;

-- ��ȸ�� ����
UPDATE news
SET news_cnt = news_cnt + 1 
WHERE newsno = 1;

-- ��õ�� ����
UPDATE news
SET news_good = news_good + 1 
WHERE newsno = 1;

-- �÷� �߰�
ALTER TABLE news
ADD (word VARCHAR2(1000));

DESCRIBE news;

-- �÷� �Ӽ� ����
ALTER TABLE news
MODIFY (news_word VARCHAR2(30));
  
-- �÷��� ����
ALTER TABLE news
RENAME COLUMN word to news_word;
  
-- �÷� ����
ALTER TABLE news
DROP COLUMN news_word;
 



