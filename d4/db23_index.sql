USE tabledb;

CREATE TABLE tbl1 (
    ID INT NOT NULL PRIMARY KEY,
    bridge INT NULL,
    contens VARCHAR(5000)
);

-- sqldb DB의 usertbl 데이터중 userID, name, bithYear, addr만 가져와서
-- tabledb.usertbl에 부어넣는것
INSERT INTO tabledb.usertbl 
SELECT userid, name, birthyear, addr 
  FROM sqldb.usertbl;