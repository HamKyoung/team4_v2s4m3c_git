/**********************************/
/* Table Name: ������ */
/**********************************/
drop table admin;
CREATE TABLE admin(
		adminno                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		id                        		VARCHAR2(50)		 NOT NULL UNIQUE,
		passwd                    		VARCHAR2(20)		 NOT NULL,
		name                      		VARCHAR2(20)		 NOT NULL
);

DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


-- ���
insert into admin(adminno, id, passwd, name)
values(admin_seq.nextval, 'admin', '1234', '������');

SELECT *
FROM admin;

SELECT COUNT(*) as cnt
FROM admin
WHERE id='admin' AND passwd='1234';


SELECT adminno, id, passwd, name
FROM admin
WHERE id = 'admin';


commit;


/**********************************/
/* Table Name: ȸ�紺�� */
/**********************************/

DROP TABLE jobnws;
DROP TABLE jobnws CASCADE CONSTRAINTS;
CREATE TABLE jobnws(
		jobnwsno                        		NUMBER(30)		 NOT NULL PRIMARY KEY,
        adminno                              NUMBER(30)		 NOT NULL,
		jobnws_title                    		VARCHAR2(1000)		 NOT NULL,
		jobnws_content                  		CLOB 		 NOT NULL,
		jobnws_url                      		VARCHAR2(500)		 NOT NULL,
        jobnws_passwd                      	VARCHAR2(15)		 NOT NULL,
		jobnws_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		jobnws_date                     		DATE		 NOT NULL,
		jobnws_file1                    		VARCHAR2(100)		 NULL ,
		jobnws_thumb1                       VARCHAR2(100)		 NULL ,
		jobnws_size1                    		NUMBER(10)		 DEFAULT 0		 NULL,
        FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE jobnws is 'ȸ�紺��';
COMMENT ON COLUMN jobnws.jobnwsno is '���� ��ȣ';
COMMENT ON COLUMN admin.adminno is '������ ��ȣ';
COMMENT ON COLUMN jobnws.jobnws_title is '���� ����';
COMMENT ON COLUMN jobnws.jobnws_content is '���� ����';
COMMENT ON COLUMN jobnws.jobnws_passwd is '���� ��й�ȣ';
COMMENT ON COLUMN jobnws.jobnws_url is '���� ��ó';
COMMENT ON COLUMN jobnws.jobnws_cnt is '���� ��ȸ��';
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
INSERT INTO jobnws(jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 1, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://',  0,  '1234', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);


-- ���� ���̺� �߰�
INSERT INTO jobnws(jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 1, '�Ｚä�봺��', '�̷��� �����Ͽ�', 'https://', 0,  '1234', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);

INSERT INTO jobnws(jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1)
VALUES(jobnws_seq.nextval, 1 ,'LGä�봺��', '�̷��� �����Ͽ�', 'https://', 0,  '1234', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);


COMMIT;

SELECT * FROM jobnws ORDER BY jobnwsno ASC;

-- ���
SELECT jobnwsno, adminno, jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1
FROM jobnws
ORDER BY jobnwsno ASC;

-- ��ȸ
SELECT jobnwsno, adminno,jobnws_title, jobnws_content, jobnws_url, jobnws_cnt, jobnws_passwd, jobnws_date, jobnws_file1, jobnws_thumb1, jobnws_size1
FROM jobnws
WHERE jobnwsno=1;

-- ����
UPDATE jobnws
SET jobnws_title='LGä�봺��', jobnws_content = '�̷��� �����Ͽ�', jobnws_url='https://'
WHERE jobnwsno = 1;

commit;

-- �н����� �˻�
SELECT COUNT(*) as jobnws_passwd_cnt
FROM jobnws
WHERE jobnwsno=1 AND jobnws_passwd='1234';

SELECT jobnwsno, jobnws_passwd
FROM jobnws 
ORDER BY jobnwsno DESC;   

-- ����
DELETE jobnws
WHERE jobnwsno = 5;

SELECT * FROM jobnws;

-- ��ȸ�� ����
UPDATE jobnws
SET jobnws_cnt = jobnws_cnt + 1 
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
 



