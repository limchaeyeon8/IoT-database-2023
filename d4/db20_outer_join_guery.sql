/* 
쇼핑몰에 가입하고 물건을 한 번도
구매하지 않은 회원까지 모두 출력
*/
SELECT u.*
     , b.userID
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM USERtbl AS U
  LEFT OUTER JOIN buytbl AS b
    ON u.userID = b.userID
 WHERE b.userID IS NULL;
 
 /*
 학생 중에 동아리에
 가입하지 않은 학생
 */
SELECT s.stdName, s.addr
     , j.num, c.clubName, c.roomNo
 FROM stdtbl AS s
 
 LEFT OUTER JOIN stdclubtbl AS j
   ON s.stdName = j.stdName
 LEFT OUTER JOIN clubtbl AS c
   ON c.clubName = j.clubName
   
UNION -- 집합(두 쿼리 결과를 합쳐줌)
   
SELECT s.stdName, s.addr
     , j.num, c.clubName, c.roomNo
 FROM stdtbl AS s
 LEFT OUTER JOIN stdclubtbl AS j
   ON s.stdName = j.stdName
RIGHT OUTER JOIN clubtbl AS c
   ON c.clubName = j.clubName;
   
-- 