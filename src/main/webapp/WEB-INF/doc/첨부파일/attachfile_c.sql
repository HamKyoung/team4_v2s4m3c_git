/**********************************/
/* Table Name: ÷������ */
/**********************************/
DROP TABLE attachfile;
CREATE TABLE attachfile(
        attachfileno                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        recruitno                   NUMBER(10)         NULL ,
        fname                             VARCHAR2(100)         NOT NULL,
        fupname                      VARCHAR2(100)         NOT NULL,
        thumb                         VARCHAR2(100)         NULL ,
        fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE     NOT NULL,
  FOREIGN KEY (recruitno) REFERENCES recruit (recruitno)
);

COMMENT ON TABLE attachfile is '÷������';
COMMENT ON COLUMN attachfile.recruitno is '���ι�ȣ';
COMMENT ON COLUMN attachfile.contentsno is '��������ȣ';
COMMENT ON COLUMN attachfile.fname is '���� ���ϸ�';
COMMENT ON COLUMN attachfile.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN attachfile.thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN attachfile.fsize is '���� ������';
COMMENT ON COLUMN attachfile.rdate is '�����';

DROP SEQUENCE attachfile_seq;
CREATE SEQUENCE attachfile_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- 1) ���  
INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO attachfile(attachfileno, recruitno, fname, fupname, thumb, fsize, rdate)
VALUES(attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   


-- 2) ���( contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachfileno, recruitno, fname, fupname, thumb, fsize, rdate
FROM attachfile
ORDER BY recruitno DESC,  attachfileno ASC;

-- 3) �ۺ� ���� ���(contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT attachfileno, recruitno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE recruitno = 1
ORDER BY fname ASC;

-- 4) �ϳ��� ���� ����
DELETE FROM attachfile
WHERE attachfileno = 1;

-- 5) FK contentsno �θ�Ű �� ��ȸ
SELECT attachfileno, recruitno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE recruitno=1;

-- �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM attachfile
WHERE recruitno=1;

-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM attachfile
WHERE recruitno=1;


   
-- 7) recruit, Attachfile join
    SELECT c.title, 
               a.attachfileno, a.recruitno, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
    FROM recruit c, attachfile a
    WHERE c.recruitno = a.contentsno
    ORDER BY c.recruitno DESC,  a.attachfileno ASC;
    
-- 8) ��ȸ
SELECT attachfileno, recruitno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE attachfileno=1;    
