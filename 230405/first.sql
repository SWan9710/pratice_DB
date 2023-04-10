CREATE TABLE contacts (
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  email TEXT NOT NULL UNIQUE
);

-- 테이블 이름 변경하는 ALTER TABLE
ALTER TABLE contacts RENAME TO new_contacts;

