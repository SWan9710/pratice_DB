CREATE TABLE users(
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  age INTEGER NOT NULL,
  country TEXT NOT NULL,
  phone TEXT NOT NULL,
  balance INTEGER NOT NULL
);

-- 이름, 나이 조회하기
SELECT first_name, age FROM users; 

-- 전체 조회
SELECT * FROM users;

-- 고유번호 가지는 rowid와 이름 조회하기
SELECT rowid, first_name FROM users;

-- 테이블 삭제하기 table_name >> users
DROP TABLE table_name;

-- 이름 나이 조회를 나이읜 오름차순정렬
SELECT first_name, age FROM users ORDER BY age ASC;

-- 이름 나이 조회를 나이의 내림차순으로 정렬
SELECT first_name, age FROM users ORDER BY age DESC;

-- 이름 나이 계좌잔고 조회 나이의 오름차순 정렬 후 나이가 동일할때 계좌의 내림차순 정렬
SELECT first_name, age, balance FROM users ORDER BY age, balance DESC;

-- 모든 지역 조회하기
SELECT country FROM users;

-- 중복지역 제거하기
SELECT DISTINCT country FROM users;

-- 중복지역 제거 지역순으로 오름차순 정렬
SELECT DISTINCT country FROM users ORDER BY country;

-- 이름과 지역이 중복 없이 모든 이름과 지역 조회하기
SELECT DISTINCT first_name, country FROM users;

-- 이름과 지역이 중복 없이 모든 이름과 지역 오름차순 정렬하여 조회하기
SELECT DISTINCT first_name, country FROM users ORDER BY country;

-- 나이가 30살 이상인 사람들의 이름, 나이, 계좌 잔고 조회하기
SELECT first_name, age, balance FROM users WHERE age >= 30;

-- 나이가 30살 이상이고 계좌 잔고가 50만원 초과인 사람들의 이름 나이 계좌 잔고 조회하기
SELECT first_name, age, balance FROM users WHERE age >= 30 AND balance > 500000;

-- 이름에 '호'가 포함되는 사람들의 이름과 성 조회하기
SELECT first_name, last_name FROM users WHERE first_name LIKE '%호%';

-- 이름이 '준' 으로 끝나는 사람들의 이름 조회하기
SELECT first_name FROM users WHERE first_name LIKE '%준';

-- 서울 지역 전화번호를 가진 사람들의 이름과 전화번호 조회하기
SELECT first_name, phone FROM users WHERE phone LIKE '02-%';

-- 나이가 20대인 사람들의 이름과 나이 조회하기
SELECT first_name, age FROM users WHERE age LIKE '2_';

-- 전화번호 중간 4자리가 51로 시작하는 사람들의 이름과 전화번호 조회하기
SELECT first_name, phone FROM users WHERE phone LIKE'%-52__-%';

-- 경기도 혹은 강원도에 사는 사람들의 이름과 지역 조회하기
SELECT first_name, country FROM users WHERE country IN('경기도','강원도');

-- IN 대신 OR 사용해도 동일한 결과 나옴
SELECT first_name, country FROM users WHERE country = '경기도' or country = '강원도';

-- 경기도 혹은 강원도에 살지 않는 사람들의 이름과 지역 조회하기
SELECT first_name, country FROM users WHERE country NOT IN('경기도','강원도');

-- 나이가 20살 이상 30살 이하인 사람들의 이름과 나이 조회하기
SELECT first_name, age FROM users WHERE age BETWEEN 20 and 30;

-- BETWEEN 대신 AND 사용할 수도 있음
SELECT first_name, age FROM users WHERE age >= 20 AND age <= 30;

-- 나이가 20살 이상, 30살 이하가 아닌 사람들의 이름과 나이 조회하기
SELECT first_name, age FROM users WHERE age NOT BETWEEN 20 AND 30;

-- or로 표현가능
SELECT first_name, age FROM users WHERE age < 20 OR age > 30;

-- 첫 번째부터 열 번째 데이터까지 rowid와 이름 조회하기
SELECT rowid, first_name FROM users LIMIT 10;

-- 계좌 잔고가 가장 많은 10명의 이름과 계좌 잔고 조회하기
SELECT first_name, balance FROM users ORDER BY balance DESC LIMIT 10;

-- 나이가 가장 어린 5명의 이름과 나이 조회하기
SELECT first_name, age FROM users ORDER BY age LIMIT 5;

-- 11번째부터 20번째 데이터의 rowid와 이름 조회하기
SELECT rowid, first_name FROM users LIMIT 10 OFFSET 10;

