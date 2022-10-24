select 
	 s.SAVING_CODE as savingCode
	, s.SAVING_NAME as savingName
	, s.SAVING_DETAIL as savingDetail
	, s.MIN_AMOUNT as minAmount
	, s.MAX_AMOUNT as maxAmount
	, s.MIN_AGE as minAge
	, s.MAX_AGE as maxAge
	, s.CONSUME_CODE as consumeCode
	, s.MIN_PERIOD as minPeriod
	, s.MAX_PERIOD as maxPeriod
	, s.BASE_RATE as baseRate
	, s.PRIME_RATE as primeRate
	, decode(sf.FAVORITE_YN, null, 'N', sf.FAVORITE_YN) as favoriteYn
from saving s
left outer join SAVING_FAVORITE sf on s.SAVING_CODE = sf.SAVING_CODE
where 1=1;



CREATE TABLE SAVING_FAVORITE
(
    favorite_code    number(5) NOT NULL,
	saving_code number(5) NOT NULL,
    favorite_yn    VARCHAR2(1) NOT NULL,
);

create SEQUENCE seq_saving_favorite nocache;


INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 1, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 2, 'Y');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 3, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 4, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES  
(seq_saving_favorite.nextval, 5, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 6, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 7, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 8, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 9, 'N');
INSERT INTO SAVING_FAVORITE (FAVORITE_CODE, SAVING_CODE, FAVORITE_YN) VALUES 
(seq_saving_favorite.nextval, 10, 'N');



ALTER TABLE CHALLENGE ADD FRIEND_ID VARCHAR(100);