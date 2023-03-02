-- 그룹핑 <- 집계함수 사용 위해서
USE sqldb;

-- 숫자가 아닌건 합쳐지기 힘듦 => 컬럼하나만
-- GROUP BY에 작성된 컴럼명만 SELECT에 쓸 수 있음
SELECT userID AS '아이디'
     , SUM(amount) AS '구매갯수'
  FROM buytbl
 GROUP BY userID;
/*
 SELECT userID
     , price
  FROM buytbl
 GROUP BY userID, price;
*/

SELECT userID AS '아이디'
     , AVG(amount) AS '평균구매갯수'
  FROM buytbl
 GROUP BY userID;
 
-- HAVING; 집계함수 등의 결과값을 필터링 (위치: GROUP BY 뒤로 가야 함)
-- 집계함수는 WHERE절 사용 불가 => HAVING 사용
SELECT userID
	 , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
HAVING SUM(price * amount) >= 1000;

-- ROLLUP; 전체 합계 자동계산
SELECT userID
	 , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP;
  
-- 