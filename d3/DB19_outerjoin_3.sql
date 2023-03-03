-- INNER JOIN
SELECT s.stdName, s.addr, c.clubName, t.roomNo
  FROM stdtbl AS s
  JOIN stdclubtbl AS c
    ON s.stdName = c.stdName
  JOIN clubtbl as t
    ON c.clubName = t.clubName;

-- ↓
    
SELECT s.stdName, s.addr, c.clubName, c.roomNo
  FROM stdtbl AS s
  INNER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
  INNER JOIN clubtbl as c
    ON c.clubName = j.clubName;