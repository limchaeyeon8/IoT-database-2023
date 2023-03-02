-- 변수 사용
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar1;
SET @myVar2 = '이름 ==> ';

SELECT @myVar2, name
  FROM usertbl
 WHERE height > 170;
 
SELECT name, height + @myVar1
  FROM usertbl;
  
-- 형변환
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CONVERT(birthYear, CHAR) FROM usertbl;

SELECT CAST('1000' AS decimal);

-- 암시적 형변환
SELECT 200 + 300;

SELECT CONCAT('Hello ', 'World');	-- 문자열 합치기
	
SELECT '200' + '300';		-- MySQL 이외에서는 '200300'

/*내장함수 리스트*/
-- 흐름함수
-- 100 > 200 ? '참' : '거짓' (((파이썬)))
SELECT IF(100>200, '참', '거짓');

-- NULL은 계산 오류 발생시킴(결과도 NULL)
SELECT IFNULL(100, '널입니다');
SELECT IFNULL(NULL, '널입니다');
SELECT IFNULL(NULL, 0) + 100;

-- NULLIF는 별로 안 씀// 두 수가 같으면 NULL
SELECT NULLIF(100, 100);

-- Query 작정 시 많이 사용!
SELECT name
     , birthYear
     , addr
     , CASE addr
	   WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역권'
       WHEN '한양' THEN '조선권'
       ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열 함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
SELECT ASCII('안'), CHAR(236);		-- 한글은 사용하면 안 됨

-- CHAR_LENGTH(글자길이), LENGTH(byte)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- UTF-8
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다');		-- 한글은 한 글자당 3 bytes

SELECT REPLACE('Hello World', 'Hello', 'Byebye');
-- DB는 인덱스를 1부터 시작
SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!       ') AS 'LTRIM'
	 , RTRIM('          Hello World!       ') AS 'RTRIM'
     , TRIM('          Hello World!       ') AS 'TRIM';
     
-- 'Hello' * 3
SELECT REPEAT('Hello', 3);

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2);


-- 수학함수
SELECT ABS(-10);	-- 10

-- 올림/내림/반올림
SELECT CEILING(4.3), FLOOR(4.9), ROUND(4.4);

-- 나눈 나머지
SELECT MOD(157, 10);	-- 7

-- RANDOM
SELECT RAND(), FLOOR(1 + (RAND() * (6)));		-- 주사위 놀이


-- 날짜 및 시간 함수
SELECT NOW();

SELECT ADDDATE('2023-03-02', INTERVAL 100 DAY);

SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT HOUR(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());

SELECT DAYOFWEEK(NOW());	# 1(일) ~ 7(토)
SELECT LAST_DAY(NOW());
SELECT LAST_DAY('2021-02-01');


-- 시스템 정보 함수
SELECT USER();

SELECT DATABASE(); 

-- ROW_COUNT(); 현재 어떤 일이 일어난 행 개수 출력
USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();

SELECT VERSION();
