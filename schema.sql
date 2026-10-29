-- ========================================================
-- 다함께 카차차 (CarChaCha) - 차량 대여 및 예약 플랫폼 DB 스키마
-- 개발 기간: 2022.12.14 ~ 2023.01.19
-- 데이터베이스: MySQL 8.0 / MariaDB 호환
-- ========================================================

CREATE DATABASE IF NOT EXISTS class2_220922_team1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE class2_220922_team1;

-- --------------------------------------------------------
-- 1. 테이블 초기화
-- --------------------------------------------------------
DROP TABLE IF EXISTS qna_comment;
DROP TABLE IF EXISTS qna;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS carinfo;
DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS userinfo;

-- --------------------------------------------------------
-- 2. 회원 테이블 (userinfo)
-- --------------------------------------------------------
CREATE TABLE userinfo (
    user_num      INT NOT NULL AUTO_INCREMENT COMMENT '회원 고유번호',
    user_id       VARCHAR(20) NOT NULL UNIQUE COMMENT '회원 아이디',
    user_pass     VARCHAR(20) NOT NULL COMMENT '비밀번호',
    user_name     VARCHAR(10) NOT NULL COMMENT '회원 이름',
    user_hp       VARCHAR(15) COMMENT '연락처',
    email         VARCHAR(45) COMMENT '이메일',
    address       VARCHAR(100) COMMENT '주소',
    user_birth    DATE COMMENT '생년월일',
    license_num   VARCHAR(20) COMMENT '운전면허 번호',
    license_type  VARCHAR(20) COMMENT '운전면허 종류 (1종 보통/2종 보통)',
    user_pt       INT DEFAULT 0 COMMENT '보유 포인트',
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '가입일시',
    PRIMARY KEY (user_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='회원 정보 테이블';

-- --------------------------------------------------------
-- 3. 차량 정보 테이블 (carinfo)
-- --------------------------------------------------------
CREATE TABLE carinfo (
    car_num     VARCHAR(15) NOT NULL COMMENT '차량 번호 (예: 12가 3456)',
    car_place   VARCHAR(100) NOT NULL COMMENT '대여/픽업 장소',
    per_hour    INT NOT NULL COMMENT '시간당 대여 요금 (원)',
    car_type    VARCHAR(10) NOT NULL COMMENT '차종 (경차/소형/준중형/중형/대형/SUV)',
    car_year    INT NOT NULL COMMENT '연식',
    car_model   VARCHAR(10) NOT NULL COMMENT '차량 모델명 (예: 아반떼, 팰리세이드)',
    car_brand   VARCHAR(10) NOT NULL COMMENT '제조사 (현대/기아 등)',
    car_image   VARCHAR(45) COMMENT '차량 이미지 파일명',
    car_fuel    VARCHAR(10) NOT NULL COMMENT '연료 (가솔린/디젤/하이브리드/전기/LPG)',
    PRIMARY KEY (car_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='대여 차량 정보 테이블';

-- --------------------------------------------------------
-- 4. 예약 테이블 (reservation) - 최승현 담당
-- --------------------------------------------------------
CREATE TABLE reservation (
    res_num     VARCHAR(25) NOT NULL COMMENT '예약 번호 (아임포트 결제 식별자 / 고유 UID)',
    res_car_num VARCHAR(15) NOT NULL COMMENT '예약 차량 번호',
    res_stime   DATETIME NOT NULL COMMENT '대여 시작 일시',
    res_time    INT NOT NULL COMMENT '대여 시간 (시간 단위)',
    user_num    VARCHAR(20) NOT NULL COMMENT '예약자 아이디 / 회원 식별자',
    return_car  INT DEFAULT 0 COMMENT '반납 여부 (0: 대여중, 1: 반납완료)',
    navi        INT DEFAULT 0 COMMENT '네비게이션 옵션 여부',
    sheet       INT DEFAULT 0 COMMENT '카시트 옵션 여부',
    hipass      INT DEFAULT 0 COMMENT '하이패스 옵션 여부',
    res_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예약 접수 일시',
    PRIMARY KEY (res_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='차량 예약 및 결제 정보 테이블';

-- --------------------------------------------------------
-- 5. 이용 후기/리뷰 테이블 (review)
-- --------------------------------------------------------
CREATE TABLE review (
    review_num     INT NOT NULL AUTO_INCREMENT COMMENT '리뷰 고유 번호',
    user_id        VARCHAR(20) NOT NULL COMMENT '작성자 아이디',
    car_num        VARCHAR(15) NOT NULL COMMENT '차량 번호',
    review_content VARCHAR(1500) NOT NULL COMMENT '후기 내용',
    review_star    VARCHAR(11) NOT NULL COMMENT '별점 (1~5)',
    review_date    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    readcount      INT DEFAULT 0 COMMENT '조회수',
    PRIMARY KEY (review_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='차량 이용후기 및 평점 테이블';

-- --------------------------------------------------------
-- 6. 공지사항 테이블 (notice)
-- --------------------------------------------------------
CREATE TABLE notice (
    notice_num       INT NOT NULL AUTO_INCREMENT COMMENT '공지사항 번호',
    user_id          VARCHAR(20) NOT NULL COMMENT '작성자 (관리자)',
    notice_sub       VARCHAR(50) NOT NULL COMMENT '공지 제목',
    notice_content   VARCHAR(1500) NOT NULL COMMENT '공지 내용',
    notice_image     VARCHAR(45) COMMENT '첨부 이미지 파일명',
    notice_readcount INT DEFAULT 0 COMMENT '조회수',
    notice_date      DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    PRIMARY KEY (notice_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='공지사항 게시판';

-- --------------------------------------------------------
-- 7. 1:1 문의사항 테이블 (qna)
-- --------------------------------------------------------
CREATE TABLE qna (
    qna_num       INT NOT NULL AUTO_INCREMENT COMMENT '문의글 번호',
    user_id       VARCHAR(20) NOT NULL COMMENT '작성자 아이디',
    qna_sub       VARCHAR(50) NOT NULL COMMENT '문의 제목',
    qna_content   VARCHAR(1500) NOT NULL COMMENT '문의 내용',
    qna_readcount INT DEFAULT 0 COMMENT '조회수',
    qna_secret    VARCHAR(1) DEFAULT '0' COMMENT '비밀글 여부 (1: 비밀글, 0: 일반글)',
    qna_image     VARCHAR(45) COMMENT '첨부 이미지 파일명',
    qna_date      DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시',
    PRIMARY KEY (qna_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='1:1 고객 문의 게시판';

-- --------------------------------------------------------
-- 8. 1:1 문의 댓글/답변 테이블 (qna_comment)
-- --------------------------------------------------------
CREATE TABLE qna_comment (
    qna_num      INT NOT NULL COMMENT '원글 문의 번호',
    comm_num     INT NOT NULL COMMENT '댓글 고유 번호',
    comm_content VARCHAR(1500) NOT NULL COMMENT '답변 내용',
    comm_date    DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 작성일시',
    user_id      VARCHAR(20) NOT NULL COMMENT '답변자 (관리자) 아이디',
    PRIMARY KEY (qna_num, comm_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='문의사항 관리자 답변 테이블';

-- ========================================================
-- 기초 테스트 데이터 삽입
-- ========================================================

-- 관리자 및 테스트 회원
INSERT INTO userinfo (user_num, user_id, user_pass, user_name, user_hp, email, address, user_birth, license_num, license_type, user_pt)
VALUES 
(1, 'admin', '1111', '관리자', '010-1111-1111', 'admin@carchacha.com', '부산광역시 부산진구 중앙대로 708', '1990-01-01', '11-22-333444-55', '1종 보통', 10000),
(2, 'yohnsuh', '1234', '조연서', '010-9949-6359', 'yohnsuh@gmail.com', '부산광역시 해운대구 센텀중앙로 55', '1995-02-25', '12-20-623550-40', '2종 보통', 2000),
(3, 'shchoi', '1234', '최승현', '010-2345-6789', 'shchoi@gmail.com', '부산광역시 동래구 중앙대로 1473', '1996-07-15', '11-12-345678-90', '1종 보통', 5000);

-- 차량 샘플 데이터 (PPT 시연 모델 반영)
INSERT INTO carinfo (car_num, car_place, per_hour, car_type, car_year, car_model, car_brand, car_image, car_fuel)
VALUES
('12하0891', '부산역 주차장', 10000, '대형', 2023, '팰리세이드', '현대', 'palisade.png', 'LPG'),
('12가3456', '서면역 1번 출구', 6500, '준중형', 2022, '아반떼', '현대', 'avante.png', '가솔린'),
('34나7890', '해운대역 광장', 8500, '중형', 2023, '쏘나타', '현대', 'sonata.png', '하이브리드'),
('78라5678', '광안리 해수욕장', 12000, '대형', 2023, '그랜저', '현대', 'grandeur.png', '가솔린'),
('90마9012', '사상터미널', 5000, '경차', 2021, '캐스퍼', '현대', 'casper.png', '가솔린');

-- 공지사항 샘플
INSERT INTO notice (notice_num, user_id, notice_sub, notice_content, notice_readcount, notice_date)
VALUES
(1, 'admin', '2023 신년 포인트적립 이벤트', '새해를 맞이하여 전 차종 대여 시 결제 금액의 10%를 포인트로 적립해 드립니다.', 120, '2023-01-17 10:00:00'),
(2, 'admin', '렌트 시 주의사항 안내드립니다.', '운전면허증 유효 여부를 사전에 확인해 주시기 바랍니다.', 85, '2023-01-16 11:30:00'),
(3, 'admin', '결제 시 오류 건에 대한 공지사항', '결제 팝업창 취소 시 예약이 정상 취소 처리됩니다.', 45, '2023-01-16 14:00:00');
