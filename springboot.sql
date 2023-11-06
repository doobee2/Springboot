GRANT ALL PRIVILEGES ON test1.* TO 'test1'@'%';

SELECT CURRENT_TIMESTAMP();



CREATE TABLE test1(no int PRIMARY KEY AUTO_INCREMENT,
id VARCHAR(20), com VARCHAR(2000));

INSERT INTO test1 VALUES (DEFAULT, 'kim', '오늘 처음 스프링부트');
INSERT INTO test1 VALUES (DEFAULT, 'lee', '스프링 부트 더미 테스트2');

COMMIT;

SELECT * FROM test1;

CREATE TABLE tb_authorities (
  auth_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  user_id varchar(45) DEFAULT NULL COMMENT '사용자 아이디',
  authority varchar(45) DEFAULT NULL COMMENT '권한',
  PRIMARY KEY (auth_idx)
);

CREATE TABLE tb_code (
  code_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  code_no varchar(45) NOT NULL COMMENT '코드번호',
  code_name varchar(45) DEFAULT NULL,
  code_exp varchar(45) DEFAULT NULL COMMENT '코드명',
  PRIMARY KEY (code_idx,code_no)
);

CREATE TABLE tb_grp_code (
  grp_code_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  grp_cd_no varchar(20) DEFAULT NULL COMMENT '그룹코드 번호',
  grp_cd_exp varchar(45) DEFAULT NULL COMMENT '그룹 코드명',
  PRIMARY KEY (grp_code_idx)
);

CREATE TABLE tb_users (
  user_idx int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  user_id varchar(45) NOT NULL COMMENT '사용자 아이디',
  passwd varchar(100) NOT NULL COMMENT '패스워드',
  user_name varchar(20) DEFAULT NULL COMMENT '사용자 이름',
  email varchar(45) DEFAULT NULL COMMENT '이메일',
  tel varchar(45) DEFAULT NULL COMMENT '핸드폰번호',
  use_yn varchar(45) DEFAULT NULL COMMENT '사용여부',
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '가입일시',
  pt INT DEFAULT 0, 
  PRIMARY KEY (user_idx)
);

INSERT INTO tb_grp_code VALUES (DEFAULT, 200, '권한');

INSERT INTO tb_code VALUES (DEFAULT, '200', 'ADMIN', '관리자');
INSERT INTO tb_code VALUES (DEFAULT, '200', 'USER', '사용자');

##################################################

USE edumon;

CREATE TABLE kuser(
id int PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
password VARCHAR(300) NOT NULL,
username VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
address VARCHAR(300),
tel VARCHAR(20),
regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
lev VARCHAR(20) DEFAULT 'USER',
act VARCHAR(20) DEFAULT 'JOIN', 
CONSTRAINT key_name UNIQUE(NAME)
);

-- 더미 데이터
INSERT INTO kuser VALUES (DEFAULT, 'kim', '1234', '김', 'kim@gmail.com', '가산동', '010-1004-1004', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO kuser VALUES (DEFAULT, 'lee', '1234', '오', 'oh@gmail.com', '신림동', '010-7979-2848', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO kuser VALUES (DEFAULT, 'admin', '1234', '박세훈', 'park@gmail.com', '구로', '010-2424-7942', DEFAULT, DEFAULT, DEFAULT);

UPDATE kuser SET lev='ADMIN' WHERE NAME='admin';
UPDATE kuser SET lev='EMP' WHERE NAME='lee';

SELECT * FROM kuser;

UPDATE kuser SET PASSWORD='$2a$10$N4HrCSDECM/wNWqBGhzDMOrLN1Aw9WRHtmEqxuBK9sWJ3K97Jqau6';

COMMIT;



DROP TABLE kuser;

DESC kuser;









-- =========================================================

CREATE DATABASE tsherpa;

USE tsherpa;

-- 회원
CREATE TABLE USER(
	id int PRIMARY KEY AUTO_INCREMENT,	-- 회원 번호(코드)
	name VARCHAR(20) NOT NULL,	-- 실제 id
	password VARCHAR(300) NOT NULL,
	username VARCHAR(50) NOT NULL,	-- 회원이름
	email VARCHAR(100) NOT NULL,
	address VARCHAR(300),
	tel VARCHAR(20),
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
	lev VARCHAR(20) DEFAULT 'USER',
	act VARCHAR(20) DEFAULT 'JOIN', 
	CONSTRAINT key_name UNIQUE(NAME)
);

-- 회원 더미
INSERT INTO user VALUES (DEFAULT, 'lee1', '1234', '일슬비', 'lee1@gmail.com', '가산동', '010-1004-1004', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO user VALUES (DEFAULT, 'lee2', '1234', '이슬비', 'lee2@gmail.com', '신림동', '010-7979-2848', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO user VALUES (DEFAULT, 'admin', '1234', '관리자', 'park@gmail.com', '구로', '010-2424-7942', DEFAULT, DEFAULT, DEFAULT);

-- 등급 변경
UPDATE user SET lev='ADMIN' WHERE NAME='admin';
UPDATE user SET lev='EMP' WHERE NAME='lee1';

SELECT * FROM user;

UPDATE kuser SET PASSWORD='$2a$10$N4HrCSDECM/wNWqBGhzDMOrLN1Aw9WRHtmEqxuBK9sWJ3K97Jqau6';

COMMIT;

-- 공지사항
CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	visited INT DEFAULT 0
);

-- 자유게시판
CREATE TABLE free(
   fno INT PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(200) NOT NULL,
   content VARCHAR(1000),
   author VARCHAR(16) NOT NULL,
   regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   visited INT DEFAULT 0
);


-- =======================================================================================================

-- 카테고리 테이블
-- A:초등교과서, B:초등참고서, C:초등문제집, D:초등기타, E:중등교과서,
-- F:중등참고서, G:중등문제집, H:중등기타, I:고등교과서, J:고등참고서,
-- K:고등문제집, L:고등기타, M:일반교과서, N:일반참고서, O:일반문제집,
-- P:일반기타, Q:유아콘텐츠, R:유아놀이, S:유아기타, T:해외서적,  U:해외콘텐츠

-- 카테고리
create table category(
	cateId VARCHAR(4) PRIMARY KEY,
	cateName varchar(100) not NULL
);

SELECT * FROM category;
-- 상품
CREATE TABLE book(
	bno INT AUTO_INCREMENT PRIMARY KEY,	    -- 번호
	cateId VARCHAR(4) NOT NULL, 			-- 카테고리
	title VARCHAR(200) NOT NULL, 			-- 도서명
	content VARCHAR(2000), 					-- 도서설명
	publish VARCHAR(100), 					-- 출판사
	author VARCHAR(100), 					-- 저자
	cost INT NOT NULL, 						-- 가격
	puser VARCHAR(100), 					-- 판매자id
	img VARCHAR(100) 						-- 도서이미지
);
	

-- 상품 테이블 생성 ////
create table product(
	proNo INT PRIMARY KEY AUTO_INCREMENT,
	categoryId VARCHAR(4) NOT NULL,
	procategory VARCHAR(100), -- 상품번호와 카테고리 아이디 결합
	price INT DEFAULT 0, -- 상품 가격
	title VARCHAR(100) NOT NULL,
	author VARCHAR(100), -- 저자
	content VARCHAR(2000), -- 상품 설명
	img VARCHAR(5000) default 0, -- 상품 썸네일
	regdate timestamp default CURRENT_TIMESTAMP()
);

-- 강의 ////
CREATE TABLE lecture(
	lno INT AUTO_INCREMENT PRIMARY KEY,			-- 강의 번호 : 자동증가
	title VARCHAR(150) NOT NULL,					-- 강의 제목
	subTitle VARCHAR(500) NOT NULL,				-- 강의 소제목
	content VARCHAR(4000) NOT NULL,				-- 강의 내용
	lectureType INT NOT NULL,						-- 강의 타입 [ 온라인 : 0, 오프라인 : 1 ]
	studentCnt INT NOT NULL, 						-- 강의 수강 인원
	startDate TIMESTAMP,								-- 강의 시작 기간 - 오프라인 사용
	endDate TIMESTAMP,								-- 강의 종료 기간 - 오프라인 사용
	daily VARCHAR(200),								-- 강의 하루 일정 - 오프라인 사용
	teacherId VARCHAR(20) NOT NULL,				-- 강의 담당 선생 아이디
	teacherNm VARCHAR(20),
	thumbnail VARCHAR(100),                	-- 강의 썸네일
	lvideo VARCHAR(100)  ,    						-- 샘플영상
	sno INT NOT NULL, 								-- 과목
	cost INT NOT NULL, 								-- 강의가격
	bookname VARCHAR(150),							-- 교재명
	bthumbnail VARCHAR(100)    					-- 교재 썸네일
);

	
-- 입고 테이블 생성 ////
create table instock(
	inNo INT PRIMARY KEY AUTO_INCREMENT, -- 입고 번호
	proNo INT NOT NULL, -- 상품 번호
	amount INT NOT NULL DEFAULT 0, -- 입고 수량
	inPrice INT DEFAULT 0, -- 입고가
	regdate timestamp default CURRENT_TIMESTAMP -- 입고일
);

-- 출고 테이블 생성
create table outstock(
	outNo INT PRIMARY KEY AUTO_INCREMENT, -- 출고 번호
	proNo INT NOT NULL, -- 상품 번호
	amount INT NOT NULL DEFAULT 0, -- 출고량
	outPrice INT DEFAULT 0, -- 출고가
	regdate timestamp default CURRENT_TIMESTAMP -- 출고일
); 

-- 배송 테이블 생성
create table delivery(
	dno INT PRIMARY KEY AUTO_INCREMENT, -- 배송 번호
	payNo INT NOT NULL, -- 결제 번호
	memId VARCHAR(16) NOT NULL, -- 회원 아이디
	NAME VARCHAR(30) NOT NULL, -- 수신인 이름
	tel VARCHAR(13) NOT NULL, -- 수신인 연락처
	address VARCHAR(300) NOT NULL, -- 수신인 배송지
	dcom varchar(100), -- 배송 회사
	dtel varchar(13), -- 배송 기사 전화번호
	state integer default 0, -- 배송 상태(0: 배송 전, 1: 배송 중, 2: 도착, 3: 구매 결정)
	etd timestamp default CURRENT_TIMESTAMP, -- 예상 출발일
	eta DATE, -- 예상 도착일
	dcode varchar(30) -- 화물 코드
);

-- 결제 테이블 생성
create table payment(
	payNo INT PRIMARY KEY AUTO_INCREMENT, -- 결제 번호
	memId VARCHAR(16) not NULL, -- 회원 아이디
	proNo INT not NULL, -- 상품 번호
	payPrice INTEGER NOT NULL, -- 결제 금액
	amount integer default 1, -- 결제 수량
	method varchar(100), -- 결제 수단
	pcom varchar(100), -- 결제 회사(대행사)
	paccount VARCHAR(100), -- 결제 계좌/카드 번호
	dno INT -- 배송 번호
);


-- 카트 테이블 생성
create table cart(
	cartNo INT PRIMARY KEY AUTO_INCREMENT, -- 카트 번호
	memId VARCHAR(16) not NULL, -- 회원 아이디
	proNo integer not NULL, -- 상품 번호
	amount integer NOT NULL, -- 제품 수량
	price INTEGER DEFAULT 100,
	imgsrc1 VARCHAR(5000) DEFAULT 'no_img.jpg'
);


-- 리뷰 테이블
CREATE TABLE review(
	rno INT PRIMARY KEY AUTO_INCREMENT, -- 리뷰 번호
	memId VARCHAR(16) NOT NULL, -- 회원 아이디
	payNo INT NOT NULL, -- 결제 번호
	star INT DEFAULT 5, -- 별점
	content VARCHAR(1000), -- 리뷰 내용
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	proNo INT NOT NULL   -- 리뷰 대상 상품 번호
);