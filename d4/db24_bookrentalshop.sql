/* 책 대여점 데이터베이스 실습 */

-- 1. divtbl(루트)
SELECT *
  FROM divtbl;
  
-- 2. bookstbl
SELECT *
  FROM bookstbl;
  
-- 3. membertbl
SELECT *
  FROM membertbl;

-- 4. rentaltbl
SELECT *
  FROM rentaltbl;

-- 책을 봅시다
SELECT REPLACE(b.Author, ',', '/') AS '저자명'
	 , b.Division AS '장르코드'
	 , b.Names AS '책제목'
     , DATE_FORMAT(b.ReleaseDate, '%Y년 %m월 %d일') AS '출판일'
     , FORMAT(b.Price, '0,000') AS '금액'
  FROM bookstbl AS b;
  
-- DATE_FORMAT 예제
SELECT DATE_FORMAT('2023-03-03 17:15:10', '%Y년 %m월 %d일 %p %H시%i분%s초 ') AS '일시';
  
-- 회원을 봅시다
SELECT CONCAT(SUBSTRING_INDEX(m.Names, 1),
			 ',',
			 LOWER(m.Names, -2)) AS '이름'
	 , m.Levels AS '등급'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
	
  FROM membertbl AS m
 ORDER BY m.Names ASC;	-- 이름 오름차순 정렬