-- UPDATE & TRANSACTION
-- 어떤 업무를 할 때 한 번에 끝날 수 있는 일
START TRANSACTION;

-- 경고!!! UPDATE 구문에는 WHERE절 빼면 안 됨!(의도하고 빼야하는 경우 제외)
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '66667788'
     , addr = '부산'
 WHERE userID = 'LCY';
 
COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면 안 됨 // 트랜잭션 안 해놓으면 롤백도 안 됨
DELETE FROM usertbl_bak;
 WHERE userID = 'ICY';