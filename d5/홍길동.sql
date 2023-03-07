USE bookrentalshop;

-- 1번 문제
SELECT CONCAT(SUBSTR(m.Names, 1, 1), ',', SUBSTR(m.Names, 2,3)	   
       )AS '회원명'
	 , m.Addr AS '주소'
     , m.Mobile AS '폰번호'
     , UPPER(Email) AS '이메일'
  FROM membertbl AS m
  ORDER BY Email DESC;

-- 2번 문제
SELECT (SELECT 'SF/판타지'
		  FROM divtbl
		 WHERE Division = b.Division
         ) AS '장르'
	 , b.Author AS '작가'
     , b.Names AS '책제목'
  FROM bookstbl AS b
 ORDER BY b.Author ASC;
 /*어떤 기준으로 나열해야 하는지 여러가지로
 해봤는데 잘 모르겠어서 작가이름 오름차순으로 했습니다*/

-- 3번 문제
SELECT *
  FROM divtbl;
INSERT INTO divtbl VALUES
	('I002', '네트워크');

-- 4번 문제
SELECT *
  FROM membertbl;
UPDATE membertbl SET Levels = 'D'
     , Mobile = '010-9839-9999' WHERE memberIdx = 1;

-- 5번 문제
SELECT IFNULL(bb.장르, '--합계--') AS '장르'
	 , bb.`장르별 총합계`
  FROM (
		SELECT d.Names AS '장르'
			 , CONCAT(FORMAT(SUM(b.Price), '0,000'), '원') AS '장르별 총합계'
		  FROM bookstbl AS b
          LEFT OUTER JOIN divtbl AS d
            ON b.Division = d.Division
		 GROUP BY 장르
		  WITH ROLLUP
          ) AS bb;