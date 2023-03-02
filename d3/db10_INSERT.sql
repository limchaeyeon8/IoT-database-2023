-- INSERT
-- 컬럼을 다 적을 때 입력 안 할 걸럼은 NULL로 지정
-- NULL 컬럼은 생략 가능
-- 컬럼 지정 생략가능(단, 입력할 값의 순서가 컬럼 순서와 일치해야 함)

INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('LCY', '임채연', 2001, '부산', '010', '7252252', 171, '2023-03-02');

INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('ICY', '임자연', 2000, '부산', NULL, NULL, NULL, NULL);

-- AUTO_INCREMENT 의 경우 필드값을 입력하지 않아도 됨
/* 
단점: 실행할 때마다 인서트됨
중복 인력트된 것들을 삭제를 해도 num은 마지막 지워진 값의 다음 수부터 카운트
ㄴ 관계형데이터이기 때문에 다른 곳에서 사용했을 경우를 대비해 자동으로 안 땡겨짐
ㄴ 해결법: 다 지우고 다시 만들기
*/
INSERT INTO buytbl
(userID,prodName,groupName,price,amount)		/*num은 자동증가이기 때문에 입력 안 해도 됨*/
VALUES
('LCY', '노트북', '전자', 2500000, 1)