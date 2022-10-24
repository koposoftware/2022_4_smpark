-- ?쉶?썝?뀒?씠釉?
create table member(
    id varchar2(30),
    password varchar2(30) not null,
    name varchar2(20) not null,
    jumin1 char(6) not null,
    jumin2 char(7) not null,
    email varchar2(100),
    tel char(11),
    CONSTRAINT user_id_pk PRIMARY key(id)    
);

INSERT INTO member VALUES ('cjstk4_','1230','박수민','960422','2171611','cjstk4_@kakao.com','01047534861','경기도 광명시 오리로 887','1420호','1420','U',sysdate);

commit;