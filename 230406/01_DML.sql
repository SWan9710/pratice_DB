-- users table 생성
CREATE TABLE users (
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country TEXT NOT NULL,
    phone TEXT NOT NULL,
    balance INTEGER NOT NULL
);

SELECT COUNT(*) FROM users;

-- 전체 유저의 평균 balance
SELECT AVG(balance) FROM users;

-- 지역별 평균 balance 조회
-- 일단 지역 중복제거 해서 지역만 조회
SELECT DISTINCT country FROM users;

-- 지역이 전라북도인 지역의 평균
SELECT country, AVG(balance) FROM users WHERE country="전라북도";

-- 지역별 평균 balance 조회하기
SELECT country, AVG(balance) FROM users GROUP BY country ORDER BY AVG(balance) DESC;

-- 나이가 30살 이상인 사람들의 평균 나이
SELECT AVG(age) FROM users WHERE age>=30;

-- 각 지역별 몇 명씩 살고 있는지 조회하기
-- country 컬럼으로 그룹화
SELECT country FROM users GROUP BY country;

-- 그룹화 후 전체 수 세주기
SELECT country, COUNT(*) FROM users GROUP BY country;

-- 각 성씨가 몇 명씩 있는지 조회하기
SELECT last_name, COUNT(*) FROM users GROUP BY last_name;

-- count에 AS 적용하기
SELECT last_name, COUNT(*) AS number_of_name FROM users GROUP BY last_name;

CREATE TABLE classmates(
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    address TEXT NOT NULL
);

-- 단일 행 삽입하기
INSERT INTO classmates(name, age, address)
VALUES('홍길동',20,'서울');

-- 컬럼순서 없이
INSERT INTO classmates
VALUES
('김철수', 30, '경기'),
('이영미', 31, '경남'),
('정수완', 27, '부산'),
('신짱구', 24, '전라'),
('김철수', 45, '전북'),
('맹구', 12, '강원'),
('유리', 19, '서울');

-- 2번 데이터 이름 수정하는법
UPDATE classmates
SET name='김철수한무두루미',
address='제주도'
WHERE rowid = 2;

-- 테이블 수정하기
UPDATE classmates
SET name='이가영',
age = 26,
address = '부산'
WHERE rowid = 3;

UPDATE classmates
SET name='윤자현',
age = 26,
address = '부산'
WHERE rowid = 5;

UPDATE classmates
SET name='김예진',
age = 26,
address = '울산'
WHERE rowid = 6;

-- 테이블에서 행을 제거
DELETE FROM classmates WHERE rowid = 8;

-- 이름에 '영'이 포함되는 데이터 삭제하기
DELETE FROM classmates WHERE name LIKE '%영%';

-- 테이블의 모든 데이터 삭제하기
DELETE FROM classmates;