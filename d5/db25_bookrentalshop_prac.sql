/*BookRentalShop 연습*/
SELECT *
  FROM membertbl;
  
-- 서브쿼리; 성능이 떨어지는 영향(안 좋음)
SELECT b.Author AS '저자'
  -- , b.Division AS '장르'
	 , (SELECT Names
		  FROM divtbl
		 WHERE Division = b.Division) AS '장르'
	 , b.Names AS '책제목'
	 , b.ReleaseDate AS '출간일'
     , b.ISBN, b.Price AS '가격'
  FROM bookstbl AS b
 ORDER BY b.Names ASC;		-- select의 세 번째 컬럼 b.Names 대신 3, '책제목'으로(표준 SQL 방법은 아님)

-- 조인; 서브쿼리 쓸 바에는 조인으로 변경
SELECT b.Author AS '저자'
	 , b.Division
     , d.Names AS '장르'
     , Names AS '책제목'
     , b.ISBN
     , b.Price AS '가격'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
    ON b.Division = d.Division
 ORDER BY b.Names;
 
-- 서브쿼리((활용도 높은 경우))
SELECT (SELECT Names
		  FROM divtbl
		 WHERE Division = bb.Division) AS '장르'
	 , bb.장르별총합
  FROM (
		SELECT b.Division
			 , SUM(b.Price) AS '장르별총합'
		  FROM bookstbl AS b
		 GROUP BY b.Division
	   ) AS bb;
       
-- 내부조인		-- 테이블 4개 조인
SELECT m.Names '성함'
	 , m.Addr '주소'
     , m.Mobile	'연락처'
     , r.rentalDate AS '대여일자'
     , IFNULL(r.returnDate, '미반납') AS '반납일자'
  -- , r.bookIdx AS '책번호'
     , b.Names AS '책제목'
  -- , d.Division AS '장르'
	 , d.Names AS '장르'
     , b.price AS '가격'
  FROM membertbl AS m
 INNER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 INNER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
 INNER JOIN divtbl AS d
    ON b.Division = d.Division;
 
-- 외부조인
SELECT m.Names '성함'
	 , m.Addr '주소'
     , m.Mobile	'연락처'
     , r.rentalIdx
     , r.rentalDate AS '대여일자'
     , r.returnDate AS '반납일자'
  -- , r.bookIdx AS '책번호'
     , b.Names AS '책제목'
  -- , d.Division AS '장르'
	 , d.Names AS '장르'
     , b.price AS '가격'
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 LEFT OUTER  JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
 LEFT OUTER  JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE r.rentalIdx IS NULL;
 
-- 책을 두 권 이상 출판한 저자
SELECT bb.Author
  -- , bb.Division
     , d.Names AS '장르'
     , bb.출판권수
     , bb.합계금액
  FROM (
		SELECT b.Author
			 , b.Division
			 , COUNT(b.Author) AS '출판권수'
			 , SUM(b.Price) AS '합계금액'
		  FROM bookstbl AS b
		 GROUP BY b.Author, b.Division
		 HAVING COUNT(b.Author) >= 2
         ) AS bb
 INNER JOIN divtbl AS d
    ON bb.Division = d.Division
 ORDER BY bb.출판권수 DESC;