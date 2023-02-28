-- Active: 1677570406074@@127.0.0.1@3306@sqldb
-- 사용 데이터베이스 변경
USE emart;

-- 한 문장 끝은 세미콜론
SELECT * FROM indextbl;
SELECT * FROM emart.indextbl;
-- ^^ 두 개 동일한 의미

-- emart 위치에서 다른 DB 테이블(employees)의 데이터(titles)를 가져다 쓰고 싶으면~
-- emart user에서는 권한 없어서 사용 불가
SELECT * FROM employees.titles;

-- 필요한 column만 가져오려면~
SELECT first_name, last_name FROM indextbl;

-- sqldb를 사용
USE sqldb;

-- 특정 조건에서 조회(조건절 검색)
SELECT userID
     , name
     , birthYear
     , height
  FROM usertbl
 WHERE name = '김경호';	/* name은  키워드, 용인해줌 */
 
-- 관계 연산자(필터링)
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970
   AND height >= 182;

-- 사이의 값 조회
 SELECT *
   FROM usertbl
/*
  WHERE height >= 180
    AND height <= 183;
*/
  WHERE height BETWEEN 180 AND 183;
  
-- IN 연산자
SELECT *
  FROM usertbl
  /*
 WHERE addr = '경남' OR addr = '경북' OR addr = '전남';
  */
 WHERE addr IN ('경남', '경북', '전남');
 
-- 문자열 검색; 뉴스 본문 안에서 일정 단어를 검색할 때 반드시 필요
SELECT *
  FROM usertbl
 WHERE name LIKE '%김%';
/* '_' 문자열갯수 정확히 일치해야 함
 WHERE name LIKE '김__';
 */
 
 -- Subquery(서브쿼리)
	-- <사용위치>
    -- 1. 컬럼 위치
    -- 2. 테이블 위치
    -- 3. 조건절 위치
SELECT name
     , height
  FROM usertbl
 WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');
 -- 서브쿼리 내부에 컬럼(height) 단 1개만 사용해야 함
 -- WHERE절에 서브쿼리  결과가 한 개 이상이면 조건 연산자로 조회할 수 없음
	-- IN절 사용으로 해결
    
-- 가상 테이블; 테이블 조회로 (HDD에서) 가져온 데이터를 (메모리에 올려) 보여주는 결과
--  AS '별명'
SELECT u.userID
     , u.name
     , (2023 - u.birthYear) AS 'age'		/*현재 년도를 받아 태어난 년도를 빼서 나이를 구함*/
  FROM (
		SELECT userID, name, birthYear, addr
	      FROM usertbl
		) AS u
        -- 가상테이블에서 재조회
 WHERE u.birthYear > 1969;
 
-- 컬럼에 쓰는 서브쿼리
SELECT b.userID AS '아이디'
     , (SELECT name FROM usertbl WHERE userID = b.userID)  AS '이름'
       /*서브쿼리 SELECT에서 ALL(*) 사용할 수 없음; 오퍼랜드는 한 컬럼만 포함할 수 있다*/
     , b.prodName AS '제품명'
     , b.price * b.amount AS '판매액'
  FROM buytbl AS b;

-- 정렬 ORDER BY; default- ASC[ENDING] 안 적어도 오름차순
  -- ASCENDING ((ASC)) / DESCENDING ((DESC))
SELECT name
     , birthYear
     , height
  FROM usertbl
 WHERE birthYear > 1069
 ORDER BY birthYear ASC, height DESC;
 
-- DISTINCT; 중복 제거
-- 중복 제거할 컬럼만
SELECT DISTINCT addr
  FROM usertbl;
  
-- LIMIT; 갯수 제한
USE emart;

SELECT * FROM indextbl
 LIMIT 5;
 
USE sqlDB;
-- CREATE TABLE ~ SELECT; 테이블 복사
-- 조회하면서 새로운 테이블 생성
-- 일부 컬럼(열)만 복사 테이블 생성 가능
-- 임시테이블로 만들어지기 때문에 PK없이 일반 컬럼으로 만들어짐 (PK나 FK 같은 제약조건은 복사되지 않음)
CREATE TABLE elec_buytbl_new
SELECT num
	 , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';
 
