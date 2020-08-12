�� �Ǹ�

--���� ������
create table carsize(
num number primary key,
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

--�� ���
create table grade(
grade varchar(2) primary key,
name varchar(20)
);

update member set grade='S' where custno=1;
select *from member;

insert into grade values('S', 'VIP');
insert into grade values('A', 'Gold');
insert into grade values('B', 'Silver');
insert into grade values('C', 'Bronze');
insert into grade values('D', 'Iron');

drop table grade;
-----------------------------------------------------------------------------------------------------------------------------
--��������
create SEQUENCE carsale_seq
start with 1 increment by 1 minvalue 1 nomaxvalue;

create table carsale(
carsale_num number primary key,
carsale_name varchar2(30) not null,
carsale_Category number not null,
carsale_Price number not null,
carsale_company number not null,
carsale_img varchar2(50) not null,
carsale_info clob not null,
CONSTRAINT FK_carsale FOREIGN KEY(carsale_Category) REFERENCES carsize(num),
CONSTRAINT FK_carsale2 FOREIGN KEY(carsale_company) REFERENCES company(num)
);

insert into carsale values(carsale_seq.nextval,'Morning',1,1545,2,'morning.png','http://auto.danawa.com/auto/?Work=model&Model=3871&attributeList=');
insert into carsale values(carsale_seq.nextval,'Avante',2,2453,1,'avante.png','http://auto.danawa.com/auto/?Work=model&Model=3821&attributeList=');
insert into carsale values(carsale_seq.nextval,'Spark',1,1487,5,'spark.png','http://auto.danawa.com/auto/?Work=model&Model=3594&attributeList=');
insert into carsale values(carsale_seq.nextval,'K5',2,3335,2,'k5.png','http://auto.danawa.com/auto/?Work=model&Model=3821&attributeList=');
insert into carsale values(carsale_seq.nextval,'SOUL',2,4834,2,'soul.png','http://auto.danawa.com/auto/?Work=model&Model=3617&attributeList=');
insert into carsale values(carsale_seq.nextval,'RAY',1,1570,2,'ray.png','http://auto.danawa.com/auto/?Work=model&Model=3548&attributeList=');
insert into carsale values(carsale_seq.nextval,'Malibu',2,3279,5,'malibu.png','http://auto.danawa.com/auto/?Work=model&Model=3603&attributeList=');
insert into carsale values(carsale_seq.nextval,'SM6',2,3422,4,'sm6.png','http://auto.danawa.com/auto/?Work=model&Model=3979&attributeList=');
insert into carsale values(carsale_seq.nextval,'Sonata',2,3599,1,'sonata.png','http://auto.danawa.com/auto/?Work=model&Model=3652&attributeList=');
insert into carsale values(carsale_seq.nextval,'K9',3,9203,2,'k9.png','http://auto.danawa.com/auto/?Work=model&Model=3542&attributeList=');
insert into carsale values(carsale_seq.nextval,'Grandeur',3,4489,1,'grandeur.png','http://auto.danawa.com/auto/?Work=model&Model=3737&attributeList=');
insert into carsale values(carsale_seq.nextval,'G70',2,5620,1,'g70.png','http://auto.danawa.com/auto/?Work=model&Model=3444&attributeList=');
insert into carsale values(carsale_seq.nextval,'G80',3,6214,1,'g80.png','http://auto.danawa.com/auto/?Work=model&Model=3656&attributeList=');
insert into carsale values(carsale_seq.nextval,'G90',3,15609,1,'g90.png','http://auto.danawa.com/auto/?Work=model&Model=3602&attributeList=');
insert into carsale values(carsale_seq.nextval,'Stinger',3,5227,2,'stinger.png','http://auto.danawa.com/auto/?Work=model&Model=3423&attributeList=');
insert into carsale values(carsale_seq.nextval,'Seltos',4,2896,2,'seltos.png','http://auto.danawa.com/auto/?Work=model&Model=3699&attributeList=');
insert into carsale values(carsale_seq.nextval,'Tivoli',4,2814,3,'tivoli.png','http://auto.danawa.com/auto/?Work=model&Model=3723&attributeList=');
insert into carsale values(carsale_seq.nextval,'Trax',4,2466,5,'trax.png','http://auto.danawa.com/auto/?Work=model&Model=3397&attributeList=');
insert into carsale values(carsale_seq.nextval,'Blazer',4,2780,5,'blazer.png','http://auto.danawa.com/auto/?Work=model&Model=3754&attributeList=');
insert into carsale values(carsale_seq.nextval,'Capture',4,2818,1,'capture.png','http://auto.danawa.com/auto/?Work=model&Model=3870&attributeList=');
insert into carsale values(carsale_seq.nextval,'XM3',4,2597,4,'xm3.png','http://auto.danawa.com/auto/?Work=model&Model=3701&attributeList=');
insert into carsale values(carsale_seq.nextval,'QM6',5,3859,4,'qm6.png','http://auto.danawa.com/auto/?Work=model&Model=3732&attributeList=');
insert into carsale values(carsale_seq.nextval,'Stonic',4,2165,2,'stonic.png','http://auto.danawa.com/auto/?Work=model&Model=3471&attributeList=');
insert into carsale values(carsale_seq.nextval,'Sportege',5,3172,2,'sportege.png','http://auto.danawa.com/auto/?Work=model&Model=3560&attributeList=');
insert into carsale values(carsale_seq.nextval,'Santafe',5,4276,1,'santafe.png','http://auto.danawa.com/auto/?Work=model&Model=3853&attributeList=');
insert into carsale values(carsale_seq.nextval,'Niro',4,4980,2,'niro.png','http://auto.danawa.com/auto/?Work=model&Model=3677&attributeList=');
insert into carsale values(carsale_seq.nextval,'Kona',4,4890,1,'kona.png','http://auto.danawa.com/auto/?Work=model&Model=3445&attributeList=');
insert into carsale values(carsale_seq.nextval,'Sorento',5,4467,2,'sorento.png','http://auto.danawa.com/auto/?Work=model&Model=3837&attributeList=');
insert into carsale values(carsale_seq.nextval,'Korando',5,3245,3,'korando.png','http://auto.danawa.com/auto/?Work=model&Model=3635&attributeList=');
insert into carsale values(carsale_seq.nextval,'RextonG4',6,4650,3,'g4.png','http://auto.danawa.com/auto/?Work=model&Model=3419&attributeList=');
insert into carsale values(carsale_seq.nextval,'RextonSports',7,3440,3,'rextonsports.png','http://auto.danawa.com/auto/?Work=model&Model=3544&attributeList=');
insert into carsale values(carsale_seq.nextval,'RextonSportsKan',7,3690,3,'rextonkan.png','http://auto.danawa.com/auto/?Work=model&Model=3659&attributeList=');
insert into carsale values(carsale_seq.nextval,'Palisade',6,5563,1,'palisade.png','http://auto.danawa.com/auto/?Work=model&Model=3563&attributeList=');
insert into carsale values(carsale_seq.nextval,'Mohabi',6,5689,2,'mohabi.png','http://auto.danawa.com/auto/?Work=model&Model=3700&attributeList=');
insert into carsale values(carsale_seq.nextval,'Travers',6,5522,5,'travers.png','http://auto.danawa.com/auto/?Work=model&Model=3543&attributeList=');
insert into carsale values(carsale_seq.nextval,'Carnival',6,6007,2,'carnival.png','http://auto.danawa.com/auto/?Work=model&Model=3484&attributeList=');
insert into carsale values(carsale_seq.nextval,'GV80',6,7049,1,'gv80.png','http://auto.danawa.com/auto/?Work=model&Model=3657&attributeList=');
insert into carsale values(carsale_seq.nextval,'Kamaro',7,5436,5,'kamaro.png','http://auto.danawa.com/auto/?Work=model&Model=3633&attributeList=');
insert into carsale values(carsale_seq.nextval,'Colorado',7,4350,5,'colorado.png','http://auto.danawa.com/auto/?Work=model&Model=3686&attributeList=');

drop SEQUENCE carsale_seq;
drop table carsale;
-----------------------------------------------------------------------------------------------------------------------------

--ȸ������
create SEQUENCE member_seq
start with 1 increment by 1 minvalue 1 nomaxvalue;

create table member(
custno number(6) primary key,
custname varchar2(20),
custpw varchar2(20),
phone varchar2(13),
adress clob,
joindate date,
grade char(1),
city char(2)
);

drop SEQUENCE member_seq;
drop table member;
-----------------------------------------------------------------------------------------------------------------------------

--����Ȯ��(ȸ���������� ����)

create table money(
custno NUMBER(6),
salenol number(8),
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
carsale_img clob,
carsale_name clob,
sdate date,
CONSTRAINT FK_money FOREIGN KEY(custno) REFERENCES member(custno)
);

select * from money where custno=2;

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

--�̺�Ʈ
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

insert into event values(event_seq.nextval, '�����̺�Ʈ1', '�����̺�Ʈ1', '2020/01/01~2020/01/31', 'event2.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ2', '�����̺�Ʈ2', '2020/02/02~2020/02/31', 'event2.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ3', '�����̺�Ʈ3', '2020/02/01~2020/02/31', 'event3.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ4', '�����̺�Ʈ4', '2020/03/01~2020/03/31', 'event4.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ5', '�����̺�Ʈ5', '2020/04/01~2020/04/31', 'event5.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ6', '�����̺�Ʈ6', '2020/06/01~2020/06/31', 'event6.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ7', '�����̺�Ʈ7', '2020/07/01~2020/07/31', 'event7.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ8', '�����̺�Ʈ8', '2020/08/01~2020/08/31', 'event8.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ9', '�����̺�Ʈ9', '2020/09/01~2020/09/31', 'event9.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ10', '�����̺�Ʈ10', '2020/10/01~2020/10/31', 'event10.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ11', '�����̺�Ʈ11', '2020/11/01~2020/11/31', 'event11.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ12', '�����̺�Ʈ12', '2020/12/01~2020/12/31', 'event12.png', sysdate);
insert into event values(event_seq.nextval, '�����̺�Ʈ12', '�����̺�Ʈ12', '2020/12/01~2020/12/31', 'event13.png', sysdate);

drop SEQUENCE event_seq;

drop table event;
----------------------------------------------------------------------------------------------------------------

--�����Խ���
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

insert into board values(board_seq.nextval,	'test1',	'test1	@test1	.test1'	,'test1',	'1111'	,sysdate	,1,	1,1,0,'test1');
insert into board values(board_seq.nextval,	'test2',	'test2	@test2	.test2'	,'test2',	'1112'	,sysdate	,2,	1,1,0,'test2');
insert into board values(board_seq.nextval,	'test3',	'test3	@test3	.test3'	,'test3',	'1113'	,sysdate	,3,	1,1,0,'test3');
insert into board values(board_seq.nextval,	'test4',	'test4	@test4	.test4'	,'test4',	'1114'	,sysdate	,4,	1,1,0,'test4');
insert into board values(board_seq.nextval,	'test5',	'test5	@test5	.test5'	,'test5',	'1115'	,sysdate	,5,	1,1,0,'test5');
insert into board values(board_seq.nextval,	'test6',	'test6	@test6	.test6'	,'test6',	'1116'	,sysdate	,6,	1,1,0,'test6');
insert into board values(board_seq.nextval,	'test7',	'test7	@test7	.test7'	,'test7',	'1117'	,sysdate	,7,	1,1,0,'test7');
insert into board values(board_seq.nextval,	'test8',	'test8	@test8	.test8'	,'test8',	'1118'	,sysdate	,8,	1,1,0,'test8');
insert into board values(board_seq.nextval,	'test9',	'test9	@test9	.test9'	,'test9',	'1119'	,sysdate	,9,	1,1,0,'test9');
insert into board values(board_seq.nextval,	'test10',	'test10	@test10	.test10'	,'test10',	'1120'	,sysdate	,10,	1,1,0,'test10');
insert into board values(board_seq.nextval,	'test11',	'test11	@test11	.test11'	,'test11',	'1121'	,sysdate	,11,	1,1,0,'test11');
insert into board values(board_seq.nextval,	'test12',	'test12	@test12	.test12'	,'test12',	'1122'	,sysdate	,12,	1,1,0,'test12');
insert into board values(board_seq.nextval,	'test13',	'test13	@test13	.test13'	,'test13',	'1123'	,sysdate	,13,	1,1,0,'test13');
insert into board values(board_seq.nextval,	'test14',	'test14	@test14	.test14'	,'test14',	'1124'	,sysdate	,14,	1,1,0,'test14');
insert into board values(board_seq.nextval,	'test15',	'test15	@test15	.test15'	,'test15',	'1125'	,sysdate	,15,	1,1,0,'test15');
insert into board values(board_seq.nextval,	'test16',	'test16	@test16	.test16'	,'test16',	'1126'	,sysdate	,16,	1,1,0,'test16');
insert into board values(board_seq.nextval,	'test17',	'test17	@test17	.test17'	,'test17',	'1127'	,sysdate	,17,	1,1,0,'test17');
insert into board values(board_seq.nextval,	'test18',	'test18	@test18	.test18'	,'test18',	'1128'	,sysdate	,18,	1,1,0,'test18');
insert into board values(board_seq.nextval,	'test19',	'test19	@test19	.test19'	,'test19',	'1129'	,sysdate	,19,	1,1,0,'test19');
insert into board values(board_seq.nextval,	'test20',	'test20	@test20	.test20'	,'test20',	'1130'	,sysdate	,20,	1,1,0,'test20');
insert into board values(board_seq.nextval,	'test21',	'test21	@test21	.test21'	,'test21',	'1131'	,sysdate	,21,	1,1,0,'test21');
insert into board values(board_seq.nextval,	'test22',	'test22	@test22	.test22'	,'test22',	'1132'	,sysdate	,22,	1,1,0,'test22');
insert into board values(board_seq.nextval,	'test23',	'test23	@test23	.test23'	,'test23',	'1133'	,sysdate	,23,	1,1,0,'test23');
insert into board values(board_seq.nextval,	'test24',	'test24	@test24	.test24'	,'test24',	'1134'	,sysdate	,24,	1,1,0,'test24');
insert into board values(board_seq.nextval,	'test25',	'test25	@test25	.test25'	,'test25',	'1135'	,sysdate	,25,	1,1,0,'test25');
insert into board values(board_seq.nextval,	'test26',	'test26	@test26	.test26'	,'test26',	'1136'	,sysdate	,26,	1,1,0,'test26');
insert into board values(board_seq.nextval,	'test27',	'test27	@test27	.test27'	,'test27',	'1137'	,sysdate	,27,	1,1,0,'test27');
insert into board values(board_seq.nextval,	'test28',	'test28	@test28	.test28'	,'test28',	'1138'	,sysdate	,28,	1,1,0,'test28');
insert into board values(board_seq.nextval,	'test29',	'test29	@test29	.test29'	,'test29',	'1139'	,sysdate	,29,	1,1,0,'test29');
insert into board values(board_seq.nextval,	'test30',	'test30	@test30	.test30'	,'test30',	'1140'	,sysdate	,30,	1,1,0,'test30');
insert into board values(board_seq.nextval,	'test31',	'test31	@test31	.test31'	,'test31',	'1141'	,sysdate	,31,	1,1,0,'test31');
insert into board values(board_seq.nextval,	'test32',	'test32	@test32	.test32'	,'test32',	'1142'	,sysdate	,32,	1,1,0,'test32');
insert into board values(board_seq.nextval,	'test33',	'test33	@test33	.test33'	,'test33',	'1143'	,sysdate	,33,	1,1,0,'test33');
insert into board values(board_seq.nextval,	'test34',	'test34	@test34	.test34'	,'test34',	'1144'	,sysdate	,34,	1,1,0,'test34');
insert into board values(board_seq.nextval,	'test35',	'test35	@test35	.test35'	,'test35',	'1145'	,sysdate	,35,	1,1,0,'test35');
insert into board values(board_seq.nextval,	'test36',	'test36	@test36	.test36'	,'test36',	'1146'	,sysdate	,36,	1,1,0,'test36');
insert into board values(board_seq.nextval,	'test37',	'test37	@test37	.test37'	,'test37',	'1147'	,sysdate	,37,	1,1,0,'test37');
insert into board values(board_seq.nextval,	'test38',	'test38	@test38	.test38'	,'test38',	'1148'	,sysdate	,38,	1,1,0,'test38');
insert into board values(board_seq.nextval,	'test39',	'test39	@test39	.test39'	,'test39',	'1149'	,sysdate	,39,	1,1,0,'test39');
insert into board values(board_seq.nextval,	'test40',	'test40	@test40	.test40'	,'test40',	'1150'	,sysdate	,40,	1,1,0,'test40');
insert into board values(board_seq.nextval,	'test41',	'test41	@test41	.test41'	,'test41',	'1151'	,sysdate	,41,	1,1,0,'test41');
insert into board values(board_seq.nextval,	'test42',	'test42	@test42	.test42'	,'test42',	'1152'	,sysdate	,42,	1,1,0,'test42');
insert into board values(board_seq.nextval,	'test43',	'test43	@test43	.test43'	,'test43',	'1153'	,sysdate	,43,	1,1,0,'test43');
insert into board values(board_seq.nextval,	'test44',	'test44	@test44	.test44'	,'test44',	'1154'	,sysdate	,44,	1,1,0,'test44');
insert into board values(board_seq.nextval,	'test45',	'test45	@test45	.test45'	,'test45',	'1155'	,sysdate	,45,	1,1,0,'test45');
insert into board values(board_seq.nextval,	'test46',	'test46	@test46	.test46'	,'test46',	'1156'	,sysdate	,46,	1,1,0,'test46');
insert into board values(board_seq.nextval,	'test47',	'test47	@test47	.test47'	,'test47',	'1157'	,sysdate	,47,	1,1,0,'test47');
insert into board values(board_seq.nextval,	'test48',	'test48	@test48	.test48'	,'test48',	'1158'	,sysdate	,48,	1,1,0,'test48');
insert into board values(board_seq.nextval,	'test49',	'test49	@test49	.test49'	,'test49',	'1159'	,sysdate	,49,	1,1,0,'test49');
insert into board values(board_seq.nextval,	'test50',	'test50	@test50	.test50'	,'test50',	'1160'	,sysdate	,50,	1,1,0,'test50');
insert into board values(board_seq.nextval,	'test51',	'test51	@test51	.test51'	,'test51',	'1161'	,sysdate	,51,	1,1,0,'test51');
insert into board values(board_seq.nextval,	'test52',	'test52	@test52	.test52'	,'test52',	'1162'	,sysdate	,52,	1,1,0,'test52');
insert into board values(board_seq.nextval,	'test53',	'test53	@test53	.test53'	,'test53',	'1163'	,sysdate	,53,	1,1,0,'test53');
insert into board values(board_seq.nextval,	'test54',	'test54	@test54	.test54'	,'test54',	'1164'	,sysdate	,54,	1,1,0,'test54');
insert into board values(board_seq.nextval,	'test55',	'test55	@test55	.test55'	,'test55',	'1165'	,sysdate	,55,	1,1,0,'test55');
insert into board values(board_seq.nextval,	'test56',	'test56	@test56	.test56'	,'test56',	'1166'	,sysdate	,56,	1,1,0,'test56');
insert into board values(board_seq.nextval,	'test57',	'test57	@test57	.test57'	,'test57',	'1167'	,sysdate	,57,	1,1,0,'test57');
insert into board values(board_seq.nextval,	'test58',	'test58	@test58	.test58'	,'test58',	'1168'	,sysdate	,58,	1,1,0,'test58');
insert into board values(board_seq.nextval,	'test59',	'test59	@test59	.test59'	,'test59',	'1169'	,sysdate	,59,	1,1,0,'test59');
insert into board values(board_seq.nextval,	'test60',	'test60	@test60	.test60'	,'test60',	'1170'	,sysdate	,60,	1,1,0,'test60');
insert into board values(board_seq.nextval,	'test61',	'test61	@test61	.test61'	,'test61',	'1171'	,sysdate	,61,	1,1,0,'test61');
insert into board values(board_seq.nextval,	'test62',	'test62	@test62	.test62'	,'test62',	'1172'	,sysdate	,62,	1,1,0,'test62');
insert into board values(board_seq.nextval,	'test63',	'test63	@test63	.test63'	,'test63',	'1173'	,sysdate	,63,	1,1,0,'test63');
insert into board values(board_seq.nextval,	'test64',	'test64	@test64	.test64'	,'test64',	'1174'	,sysdate	,64,	1,1,0,'test64');
insert into board values(board_seq.nextval,	'test65',	'test65	@test65	.test65'	,'test65',	'1175'	,sysdate	,65,	1,1,0,'test65');
insert into board values(board_seq.nextval,	'test66',	'test66	@test66	.test66'	,'test66',	'1176'	,sysdate	,66,	1,1,0,'test66');
insert into board values(board_seq.nextval,	'test67',	'test67	@test67	.test67'	,'test67',	'1177'	,sysdate	,67,	1,1,0,'test67');
insert into board values(board_seq.nextval,	'test68',	'test68	@test68	.test68'	,'test68',	'1178'	,sysdate	,68,	1,1,0,'test68');
insert into board values(board_seq.nextval,	'test69',	'test69	@test69	.test69'	,'test69',	'1179'	,sysdate	,69,	1,1,0,'test69');
insert into board values(board_seq.nextval,	'test70',	'test70	@test70	.test70'	,'test70',	'1180'	,sysdate	,70,	1,1,0,'test70');
insert into board values(board_seq.nextval,	'test71',	'test71	@test71	.test71'	,'test71',	'1181'	,sysdate	,71,	1,1,0,'test71');
insert into board values(board_seq.nextval,	'test72',	'test72	@test72	.test72'	,'test72',	'1182'	,sysdate	,72,	1,1,0,'test72');
insert into board values(board_seq.nextval,	'test73',	'test73	@test73	.test73'	,'test73',	'1183'	,sysdate	,73,	1,1,0,'test73');
insert into board values(board_seq.nextval,	'test74',	'test74	@test74	.test74'	,'test74',	'1184'	,sysdate	,74,	1,1,0,'test74');
insert into board values(board_seq.nextval,	'test75',	'test75	@test75	.test75'	,'test75',	'1185'	,sysdate	,75,	1,1,0,'test75');
insert into board values(board_seq.nextval,	'test76',	'test76	@test76	.test76'	,'test76',	'1186'	,sysdate	,76,	1,1,0,'test76');
insert into board values(board_seq.nextval,	'test77',	'test77	@test77	.test77'	,'test77',	'1187'	,sysdate	,77,	1,1,0,'test77');
insert into board values(board_seq.nextval,	'test78',	'test78	@test78	.test78'	,'test78',	'1188'	,sysdate	,78,	1,1,0,'test78');
insert into board values(board_seq.nextval,	'test79',	'test79	@test79	.test79'	,'test79',	'1189'	,sysdate	,79,	1,1,0,'test79');
insert into board values(board_seq.nextval,	'test80',	'test80	@test80	.test80'	,'test80',	'1190'	,sysdate	,80,	1,1,0,'test80');
insert into board values(board_seq.nextval,	'test81',	'test81	@test81	.test81'	,'test81',	'1191'	,sysdate	,81,	1,1,0,'test81');
insert into board values(board_seq.nextval,	'test82',	'test82	@test82	.test82'	,'test82',	'1192'	,sysdate	,82,	1,1,0,'test82');
insert into board values(board_seq.nextval,	'test83',	'test83	@test83	.test83'	,'test83',	'1193'	,sysdate	,83,	1,1,0,'test83');
insert into board values(board_seq.nextval,	'test84',	'test84	@test84	.test84'	,'test84',	'1194'	,sysdate	,84,	1,1,0,'test84');
insert into board values(board_seq.nextval,	'test85',	'test85	@test85	.test85'	,'test85',	'1195'	,sysdate	,85,	1,1,0,'test85');
insert into board values(board_seq.nextval,	'test86',	'test86	@test86	.test86'	,'test86',	'1196'	,sysdate	,86,	1,1,0,'test86');
insert into board values(board_seq.nextval,	'test87',	'test87	@test87	.test87'	,'test87',	'1197'	,sysdate	,87,	1,1,0,'test87');
insert into board values(board_seq.nextval,	'test88',	'test88	@test88	.test88'	,'test88',	'1198'	,sysdate	,88,	1,1,0,'test88');
insert into board values(board_seq.nextval,	'test89',	'test89	@test89	.test89'	,'test89',	'1199'	,sysdate	,89,	1,1,0,'test89');
insert into board values(board_seq.nextval,	'test90',	'test90	@test90	.test90'	,'test90',	'1200'	,sysdate	,90,	1,1,0,'test90');
insert into board values(board_seq.nextval,	'test91',	'test91	@test91	.test91'	,'test91',	'1201'	,sysdate	,91,	1,1,0,'test91');
insert into board values(board_seq.nextval,	'test92',	'test92	@test92	.test92'	,'test92',	'1202'	,sysdate	,92,	1,1,0,'test92');
insert into board values(board_seq.nextval,	'test93',	'test93	@test93	.test93'	,'test93',	'1203'	,sysdate	,93,	1,1,0,'test93');
insert into board values(board_seq.nextval,	'test94',	'test94	@test94	.test94'	,'test94',	'1204'	,sysdate	,94,	1,1,0,'test94');
insert into board values(board_seq.nextval,	'test95',	'test95	@test95	.test95'	,'test95',	'1205'	,sysdate	,95,	1,1,0,'test95');
insert into board values(board_seq.nextval,	'test96',	'test96	@test96	.test96'	,'test96',	'1206'	,sysdate	,96,	1,1,0,'test96');
insert into board values(board_seq.nextval,	'test97',	'test97	@test97	.test97'	,'test97',	'1207'	,sysdate	,97,	1,1,0,'test97');
insert into board values(board_seq.nextval,	'test98',	'test98	@test98	.test98'	,'test98',	'1208'	,sysdate	,98,	1,1,0,'test98');
insert into board values(board_seq.nextval,	'test99',	'test99	@test99	.test99'	,'test99',	'1209'	,sysdate	,99,	1,1,0,'test99');
insert into board values(board_seq.nextval,	'test100',	'test100	@test100	.test100'	,'test100',	'1210'	,sysdate	,100,	1,1,0,'test100');
insert into board values(board_seq.nextval,	'test101',	'test101	@test101	.test101'	,'test101',	'1211'	,sysdate	,101,	1,1,0,'test101');
insert into board values(board_seq.nextval,	'test102',	'test102	@test102	.test102'	,'test102',	'1212'	,sysdate	,102,	1,1,0,'test102');
insert into board values(board_seq.nextval,	'test103',	'test103	@test103	.test103'	,'test103',	'1213'	,sysdate	,103,	1,1,0,'test103');
insert into board values(board_seq.nextval,	'test104',	'test104	@test104	.test104'	,'test104',	'1214'	,sysdate	,104,	1,1,0,'test104');
insert into board values(board_seq.nextval,	'test105',	'test105	@test105	.test105'	,'test105',	'1215'	,sysdate	,105,	1,1,0,'test105');
insert into board values(board_seq.nextval,	'test106',	'test106	@test106	.test106'	,'test106',	'1216'	,sysdate	,106,	1,1,0,'test106');
insert into board values(board_seq.nextval,	'test107',	'test107	@test107	.test107'	,'test107',	'1217'	,sysdate	,107,	1,1,0,'test107');
insert into board values(board_seq.nextval,	'test108',	'test108	@test108	.test108'	,'test108',	'1218'	,sysdate	,108,	1,1,0,'test108');
insert into board values(board_seq.nextval,	'test109',	'test109	@test109	.test109'	,'test109',	'1219'	,sysdate	,109,	1,1,0,'test109');
insert into board values(board_seq.nextval,	'test110',	'test110	@test110	.test110'	,'test110',	'1220'	,sysdate	,110,	1,1,0,'test110');
insert into board values(board_seq.nextval,	'test111',	'test111	@test111	.test111'	,'test111',	'1221'	,sysdate	,111,	1,1,0,'test111');
insert into board values(board_seq.nextval,	'test112',	'test112	@test112	.test112'	,'test112',	'1222'	,sysdate	,112,	1,1,0,'test112');
insert into board values(board_seq.nextval,	'test113',	'test113	@test113	.test113'	,'test113',	'1223'	,sysdate	,113,	1,1,0,'test113');
insert into board values(board_seq.nextval,	'test114',	'test114	@test114	.test114'	,'test114',	'1224'	,sysdate	,114,	1,1,0,'test114');
insert into board values(board_seq.nextval,	'test115',	'test115	@test115	.test115'	,'test115',	'1225'	,sysdate	,115,	1,1,0,'test115');
insert into board values(board_seq.nextval,	'test116',	'test116	@test116	.test116'	,'test116',	'1226'	,sysdate	,116,	1,1,0,'test116');
insert into board values(board_seq.nextval,	'test117',	'test117	@test117	.test117'	,'test117',	'1227'	,sysdate	,117,	1,1,0,'test117');
insert into board values(board_seq.nextval,	'test118',	'test118	@test118	.test118'	,'test118',	'1228'	,sysdate	,118,	1,1,0,'test118');
insert into board values(board_seq.nextval,	'test119',	'test119	@test119	.test119'	,'test119',	'1229'	,sysdate	,119,	1,1,0,'test119');
insert into board values(board_seq.nextval,	'test120',	'test120	@test120	.test120'	,'test120',	'1230'	,sysdate	,120,	1,1,0,'test120');
insert into board values(board_seq.nextval,	'test121',	'test121	@test121	.test121'	,'test121',	'1231'	,sysdate	,121,	1,1,0,'test121');
insert into board values(board_seq.nextval,	'test122',	'test122	@test122	.test122'	,'test122',	'1232'	,sysdate	,122,	1,1,0,'test122');
insert into board values(board_seq.nextval,	'test123',	'test123	@test123	.test123'	,'test123',	'1233'	,sysdate	,123,	1,1,0,'test123');
insert into board values(board_seq.nextval,	'test124',	'test124	@test124	.test124'	,'test124',	'1234'	,sysdate	,124,	1,1,0,'test124');
insert into board values(board_seq.nextval,	'test125',	'test125	@test125	.test125'	,'test125',	'1235'	,sysdate	,125,	1,1,0,'test125');
insert into board values(board_seq.nextval,	'test126',	'test126	@test126	.test126'	,'test126',	'1236'	,sysdate	,126,	1,1,0,'test126');
insert into board values(board_seq.nextval,	'test127',	'test127	@test127	.test127'	,'test127',	'1237'	,sysdate	,127,	1,1,0,'test127');
insert into board values(board_seq.nextval,	'test128',	'test128	@test128	.test128'	,'test128',	'1238'	,sysdate	,128,	1,1,0,'test128');
insert into board values(board_seq.nextval,	'test129',	'test129	@test129	.test129'	,'test129',	'1239'	,sysdate	,129,	1,1,0,'test129');
insert into board values(board_seq.nextval,	'test130',	'test130	@test130	.test130'	,'test130',	'1240'	,sysdate	,130,	1,1,0,'test130');
insert into board values(board_seq.nextval,	'test131',	'test131	@test131	.test131'	,'test131',	'1241'	,sysdate	,131,	1,1,0,'test131');
insert into board values(board_seq.nextval,	'test132',	'test132	@test132	.test132'	,'test132',	'1242'	,sysdate	,132,	1,1,0,'test132');
insert into board values(board_seq.nextval,	'test133',	'test133	@test133	.test133'	,'test133',	'1243'	,sysdate	,133,	1,1,0,'test133');
insert into board values(board_seq.nextval,	'test134',	'test134	@test134	.test134'	,'test134',	'1244'	,sysdate	,134,	1,1,0,'test134');
insert into board values(board_seq.nextval,	'test135',	'test135	@test135	.test135'	,'test135',	'1245'	,sysdate	,135,	1,1,0,'test135');
insert into board values(board_seq.nextval,	'test136',	'test136	@test136	.test136'	,'test136',	'1246'	,sysdate	,136,	1,1,0,'test136');
insert into board values(board_seq.nextval,	'test137',	'test137	@test137	.test137'	,'test137',	'1247'	,sysdate	,137,	1,1,0,'test137');



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