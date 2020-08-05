차 판매

--차량 사이즈
create table carsize(
num number,
name varchar(20)
);

insert into carsize values(1, 'Samll Car');
insert into carsize values(2, 'Mid-Size CAR');
insert into carsize values(3, 'Full-Size CAR');
insert into carsize values(4, 'Samll SUV');
insert into carsize values(5, 'Mid-Size SUV');
insert into carsize values(6, 'Full-Size SUV');
insert into carsize values(7, 'other');

drop table carsize;
-----------------------------------------------------------------------------------------------------------------------------
--차량정보
create SEQUENCE carsale_seq
start with 1 increment by 1 minvalue 1 nomaxvalue;

create table carsale(
carsale_num number primary key,
carsale_name varchar2(30) not null,
carsale_Category number not null,
carsale_Price number not null,
carsale_company varchar2(50) not null,
carsale_img varchar2(50) not null,
carsale_info clob not null
);

insert into carsale values(carsale_seq.nextval,'Morning',1,1545,'Kia','morning.png','http://auto.danawa.com/auto/?Work=model&Model=3871&attributeList=');
insert into carsale values(carsale_seq.nextval,'Avante',2,2453,'Hyundai','avante.png','http://auto.danawa.com/auto/?Work=model&Model=3821&attributeList=');
insert into carsale values(carsale_seq.nextval,'Spark',1,1487,'Chevrolet','spark.png','http://auto.danawa.com/auto/?Work=model&Model=3594&attributeList=');
insert into carsale values(carsale_seq.nextval,'K5',2,3335,'Kia','k5.png','http://auto.danawa.com/auto/?Work=model&Model=3821&attributeList=');
insert into carsale values(carsale_seq.nextval,'SOUL',2,4834,'Kia','soul.png','http://auto.danawa.com/auto/?Work=model&Model=3617&attributeList=');
insert into carsale values(carsale_seq.nextval,'RAY',1,1570,'Kia','ray.png','http://auto.danawa.com/auto/?Work=model&Model=3548&attributeList=');
insert into carsale values(carsale_seq.nextval,'Malibu',2,3279,'Chevrolet','malibu.png','http://auto.danawa.com/auto/?Work=model&Model=3603&attributeList=');
insert into carsale values(carsale_seq.nextval,'SM6',2,3422,'Samsung','sm6.png','http://auto.danawa.com/auto/?Work=model&Model=3979&attributeList=');
insert into carsale values(carsale_seq.nextval,'Sonata',2,3599,'Hyundai','sonata.png','http://auto.danawa.com/auto/?Work=model&Model=3652&attributeList=');
insert into carsale values(carsale_seq.nextval,'K9',3,9203,'Kia','k9.png','http://auto.danawa.com/auto/?Work=model&Model=3542&attributeList=');
insert into carsale values(carsale_seq.nextval,'Grandeur',3,4489,'Hyundai','grandeur.png','http://auto.danawa.com/auto/?Work=model&Model=3737&attributeList=');
insert into carsale values(carsale_seq.nextval,'G70',2,5620,'Hyundai','g70.png','http://auto.danawa.com/auto/?Work=model&Model=3444&attributeList=');
insert into carsale values(carsale_seq.nextval,'G80',3,6214,'Hyundai','g80.png','http://auto.danawa.com/auto/?Work=model&Model=3656&attributeList=');
insert into carsale values(carsale_seq.nextval,'G90',3,15609,'Hyundai','g90.png','http://auto.danawa.com/auto/?Work=model&Model=3602&attributeList=');
insert into carsale values(carsale_seq.nextval,'Stinger',3,5227,'Kia','stinger.png','http://auto.danawa.com/auto/?Work=model&Model=3423&attributeList=');
insert into carsale values(carsale_seq.nextval,'Seltos',4,2896,'Kia','seltos.png','http://auto.danawa.com/auto/?Work=model&Model=3699&attributeList=');
insert into carsale values(carsale_seq.nextval,'Tivoli',4,2814,'Smotor','tivoli.png','http://auto.danawa.com/auto/?Work=model&Model=3723&attributeList=');
insert into carsale values(carsale_seq.nextval,'Trax',4,2466,'Chevrolet','trax.png','http://auto.danawa.com/auto/?Work=model&Model=3397&attributeList=');
insert into carsale values(carsale_seq.nextval,'Blazer',4,2780,'Chevrolet','blazer.png','http://auto.danawa.com/auto/?Work=model&Model=3754&attributeList=');
insert into carsale values(carsale_seq.nextval,'Capture',4,2818,'Hyundai','capture.png','http://auto.danawa.com/auto/?Work=model&Model=3870&attributeList=');
insert into carsale values(carsale_seq.nextval,'XM3',4,2597,'Samsung','xm3.png','http://auto.danawa.com/auto/?Work=model&Model=3701&attributeList=');
insert into carsale values(carsale_seq.nextval,'QM6',5,3859,'Samsung','qm6.png','http://auto.danawa.com/auto/?Work=model&Model=3732&attributeList=');
insert into carsale values(carsale_seq.nextval,'Stonic',4,2165,'Kia','stonic.png','http://auto.danawa.com/auto/?Work=model&Model=3471&attributeList=');
insert into carsale values(carsale_seq.nextval,'Sportege',5,3172,'Kia','sportege.png','http://auto.danawa.com/auto/?Work=model&Model=3560&attributeList=');
insert into carsale values(carsale_seq.nextval,'Santafe',5,4276,'Hyundai','santafe.png','http://auto.danawa.com/auto/?Work=model&Model=3853&attributeList=');
insert into carsale values(carsale_seq.nextval,'Niro',4,4980,'Kia','niro.png','http://auto.danawa.com/auto/?Work=model&Model=3677&attributeList=');
insert into carsale values(carsale_seq.nextval,'Kona',4,4890,'Hyundai','kona.png','http://auto.danawa.com/auto/?Work=model&Model=3445&attributeList=');
insert into carsale values(carsale_seq.nextval,'Sorento',5,4467,'Kia','sorento.png','http://auto.danawa.com/auto/?Work=model&Model=3837&attributeList=');
insert into carsale values(carsale_seq.nextval,'Korando',5,3245,'Smotor','korando.png','http://auto.danawa.com/auto/?Work=model&Model=3635&attributeList=');
insert into carsale values(carsale_seq.nextval,'RextonG4',6,4650,'Smotor','g4.png','http://auto.danawa.com/auto/?Work=model&Model=3419&attributeList=');
insert into carsale values(carsale_seq.nextval,'RextonSports',7,3440,'Smotor','rextonsports.png','http://auto.danawa.com/auto/?Work=model&Model=3544&attributeList=');
insert into carsale values(carsale_seq.nextval,'RextonSportsKan',7,3690,'Smotor','rextonkan.png','http://auto.danawa.com/auto/?Work=model&Model=3659&attributeList=');
insert into carsale values(carsale_seq.nextval,'Palisade',6,5563,'Hyundai','palisade.png','http://auto.danawa.com/auto/?Work=model&Model=3563&attributeList=');
insert into carsale values(carsale_seq.nextval,'Mohabi',6,5689,'Kia','mohabi.png','http://auto.danawa.com/auto/?Work=model&Model=3700&attributeList=');
insert into carsale values(carsale_seq.nextval,'Travers',6,5522,'Chevrolet','travers.png','http://auto.danawa.com/auto/?Work=model&Model=3543&attributeList=');
insert into carsale values(carsale_seq.nextval,'Carnival',6,6007,'Kia','carnival.png','http://auto.danawa.com/auto/?Work=model&Model=3484&attributeList=');
insert into carsale values(carsale_seq.nextval,'GV80',6,7049,'Hyundai','gv80.png','http://auto.danawa.com/auto/?Work=model&Model=3657&attributeList=');
insert into carsale values(carsale_seq.nextval,'Kamaro',7,5436,'Chevrolet','kamaro.png','http://auto.danawa.com/auto/?Work=model&Model=3633&attributeList=');
insert into carsale values(carsale_seq.nextval,'Colorado',7,4350,'Chevrolet','colorado.png','http://auto.danawa.com/auto/?Work=model&Model=3686&attributeList=');

drop SEQUENCE carsale_seq;
drop table carsale;
-----------------------------------------------------------------------------------------------------------------------------

--회원관리
create SEQUENCE member_seq
start with 1 increment by 1 minvalue 1 nomaxvalue;

create table member(
custno number(6) primary key,
custname varchar2(20),
custpw varchar2(20),
phone varchar2(13),
adress varchar2(60),
joindate date,
grade char(1),
city char(2)
);

drop SEQUENCE member_seq;
drop table member;
-----------------------------------------------------------------------------------------------------------------------------

--예약확인(회원매출정보 명세서)

create table money(
custno NUMBER(6), 
salenol number(8),
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date
);


drop table money;
--create SEQUENCE money_seq
--start with 1 increment by 1 minvalue 1 nomaxvalue;
--drop SEQUENCE money_seq;
--create table money(
--custno number(6) primary key not null,
--salenol number(8) primary key not null,
--pcost number(8),
--amount number(4),
--price number(8),
--pcode varchar2(4),
--sdate date
--);
----------------------------------------------------------------------------------------------------------------

--이벤트
create SEQUENCE event_seq
start with 1 increment by 1 minvalue 1 nomaxvalue;

create table event(
num number primary key,
title varchar2(30) not null,
content clob not null,
term VARCHAR2(30) not null,
img clob,
reg_date DATE
);

insert into event values(event_seq.nextval, '메인이벤트2', '메인이벤트2', '2020/01/01~2020/01/31', 'event2.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트3', '메인이벤트3', '2020/02/01~2020/02/31', 'event3.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트4', '메인이벤트4', '2020/03/01~2020/03/31', 'event4.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트5', '메인이벤트5', '2020/04/01~2020/04/31', 'event5.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트6', '메인이벤트6', '2020/05/01~2020/05/31', 'event6.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트7', '메인이벤트7', '2020/06/01~2020/06/31', 'event7.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트8', '메인이벤트8', '2020/08/01~2020/08/31', 'event8.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트9', '메인이벤트9', '2020/09/01~2020/09/31', 'event9.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트10', '메인이벤트10', '2020/10/01~2020/10/31', 'event10.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트11', '메인이벤트11', '2020/11/01~2020/11/31', 'event11.png', sysdate);
insert into event values(event_seq.nextval, '메인이벤트12', '메인이벤트12', '2020/12/01~2020/12/31', 'event12.png', sysdate);

drop SEQUENCE event_seq;
drop table event;
----------------------------------------------------------------------------------------------------------------

--자유게시판
create sequence board_seq

    start with 1 increment by 1 minvalue 1 nomaxvalue;

create table board (

    Num number primary key ,
    Writer	varchar2(30) not null,
    Email	varchar2(40) not null,
    Subject	varchar2(40) not null,
    Password varchar2(15) not null,
    Reg_date	Date,
    Ref		number,
    Re_step	number,
    Re_level	number,
    ReadCount	number,
    Content	 clob not null

);

drop sequence board_seq;
drop table board;
----------------------------------------------------------------------------------------------------------------

--FAQ
create sequence FAQ_seq

    start with 1 increment by 1 minvalue 1 nomaxvalue;

create table FAQ (

    Num number primary key ,
    Subject	varchar2(40) not null,
    Reg_date	Date,
    Content	 clob not null

);

drop sequence FAQ_seq;
drop table FAQ;
----------------------------------------------------------------------------------------------------------------

--OnetoOne
create sequence OnetoOne_seq

    start with 1 increment by 1 minvalue 1 nomaxvalue;

create table OnetoOne (

    Num number primary key ,
    Subject	varchar2(40) not null,
    Email	varchar2(40) not null,
    phone varchar2(13),
    Reg_date	Date,
    Content	 clob not null

);


drop sequence OnetoOne_seq;
drop table OnetoOne;