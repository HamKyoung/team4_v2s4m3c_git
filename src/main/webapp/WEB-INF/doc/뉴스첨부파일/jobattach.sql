/**********************************/
/* Table Name: ÷������ */
/**********************************/
DROP TABLE jobattach;
CREATE TABLE jobattach(
        jobattachno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        jobnwsno                   NUMBER(10)         NULL ,
        jobattach_fname                             VARCHAR2(100)         NOT NULL,
        jobattach_fupname                      VARCHAR2(100)         NOT NULL,
        jobattach_thumb                         VARCHAR2(100)         NULL ,
        jobattach_fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        jobattach_date                           DATE     NOT NULL,
  FOREIGN KEY (jobnwsno) REFERENCES jobnws (jobnwsno)
);

COMMENT ON TABLE  jobattachno is '����÷������';
COMMENT ON COLUMN jobattach.jobnwsno is '������ȣ';
COMMENT ON COLUMN jobattach.jobattach_fname is '���� ���ϸ�';
COMMENT ON COLUMN jobattach.jobattach_fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN jobattach.jobattach_thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN jobattach.jobattach_fsize is '���� ������';
COMMENT ON COLUMN jobattach.jobattach_date is '�����';

DROP SEQUENCE jobattach_seq;
CREATE SEQUENCE jobattach_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- 1) ���  
INSERT INTO jobattach(jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date)
VALUES(jobattach_seq.nextval, 4, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO jobattach(jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date)
VALUES(jobattach_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO jobattach(jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date)
VALUES(jobattach_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   


-- 2) ���( jobnwsno ���� ���� ����, jobattachno ���� ��������)
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
ORDER BY jobnwsno DESC,  jobattachno ASC;

-- 3) �ۺ� ���� ���(jobnwsno ���� ���� ����, jobattachno ���� ��������)
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
WHERE jobnwsno = 1
ORDER BY jobattach_fname ASC;

-- 4) �ϳ��� ���� ����
DELETE FROM jobattach
WHERE jobattachno = 1;

-- 5) FK contentsno �θ�Ű �� ��ȸ
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
WHERE jobnwsno=1;

-- �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM jobattach
WHERE jobnwsno=1;

-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM jobattach
WHERE jobnwsno=1;


   
-- 7) jobnws, Jobattach join
    SELECT c.title, 
               a.jobattachno, a.jobnwsno, a.jobattach_fname, a.jobattach_fupname, a.jobattach_thumb, a.jobattach_fsize, a.jobattach_date
    FROM jobnws c, jobattach a
    WHERE c.jobnwsno = a.jobnwsno
    ORDER BY c.jobnwsno DESC,  a.jobattachno ASC;
    
-- 8) ��ȸ
SELECT jobattachno, jobnwsno, jobattach_fname, jobattach_fupname, jobattach_thumb, jobattach_fsize, jobattach_date
FROM jobattach
WHERE jobattachno=1;    
