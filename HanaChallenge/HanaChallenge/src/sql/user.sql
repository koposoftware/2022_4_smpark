-- ?��?��?��?���?
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

INSERT INTO member VALUES ('cjstk4_','1230','�ڼ���','960422','2171611','cjstk4_@kakao.com','01047534861','��⵵ ����� ������ 887','1420ȣ','1420','U',sysdate);

commit;