create user movie identified by movie;
grant dba to movie;

conn movie/movie

create table theater(
	theater_name varchar2(50),
	constraint theater_pk primary key(theater_name)
);

create table member(
	id varchar2(50),
	password varchar2(50),
	name varchar2(50),
	birth varchar2(50),
	gender varchar2(50),
	phone varchar2(50),
	addr varchar2(255),
	email varchar2(50),
	my_theater varchar2(100),
	regdate date,
	constraint member_fk foreign key(my_theater)
		references theater(theater_name),
	constraint member_pk primary key(id)
);

create table movie(
	film_number varchar2(50),
	film_name varchar2(50),
	director varchar2(50),
	actor varchar2(255),
	rate varchar2(50),
	runtime number,
	price number,
	country varchar2(50),
	genre varchar2(50),
	release_date date,
	end_date date,
	story varchar2(255),
	cut varchar2(255),
	trailer varchar2(255),
	constraint movie_pk primary key(film_number)
);

create table room(
	theater_name varchar2(50),
	room_name varchar2(50),
	a number,
	b number,
	c number,
	d number,
	e number,
	f number,
	g number,
	h number,
	i number,
	j number,
	constraint room_fk foreign key(theater_name)
		references theater(theater_name),
	constraint room_pk primary key(theater_name,room_name)
);

create sequence seq;
create table schedule(
	seq number,
	film_number varchar2(50),
	theater_name varchar2(50),
	room_name varchar2(50),
	show_date varchar2(50),
	show_time varchar2(50),
	seat_status number,
	constraint schedule_fk foreign key(film_number)
		references movie(film_number),
	constraint schedule_fk2 foreign key(theater_name,room_name)
		references room(theater_name,room_name),
	constraint schedule_pk primary key(seq)
);

create table seat(
	seq number,
	seat_number number,
	constraint seat_fk foreign key(seq)
		references schedule(seq),
	constraint seat_pk primary key(seq,seat_number)
);

create table ticket(
	ticket_number varchar2(50),
	id varchar2(50),
	film_number varchar2(50),
	theater_name varchar2(50),
	room_name varchar2(50),
	today varchar2(50),
	ticket_date varchar2(50),
	start_time varchar2(50),
	end_time varchar2(50),
	seat_number number,
	adult number,
	old_man number,
	teenager number,
	price number,
	constraint ticket_fk foreign key(theater_name,room_name)
		references room(theater_name,room_name),
	constraint ticket_fk2 foreign key(film_number)
		references movie(film_number),
	constraint ticket_fk3 foreign key(id)
		references member(id),
	constraint ticket_pk primary key(ticket_number)	
);


insert into theater values('강남');
insert into theater values('영등포');
insert into theater values('구로');
insert into theater values('마포');
insert into theater values('동서울');
insert into theater values('동수원');
insert into theater values('부천');
insert into theater values('수원');
insert into theater values('군자');
insert into theater values('신도림');
insert into theater values('용산');
insert into theater values('인천');
insert into theater values('대전');
insert into theater values('해운대');
insert into theater values('제주');

insert into member values('choa','1','초아','90','여','010-1111-1111','서울특별시 강남구','choa@naver.com',null,sysdate);
insert into member values('hong','1','홍길동','44','남','010-2222-2222','서울특별시 동작구','hong@naver.com',null,sysdate-5);
insert into member values('yeon','1','태연','90','여','010-3333-3333','서울특별시 마포구','yeon@naver.com',null,sysdate-20);
insert into member values('bang','1','이방원','37','남','010-4444-4444','수원시 권선구','bang@naver.com',null,sysdate-150);
insert into member values('kim','1','김유신','55','남','010-5555-5555','서울특별시 구로구','kim@naver.com',null,sysdate-120);
insert into member values('jiwoo','1','지우','88','남','010-6666-6666','수원시 팔달구','jiwoo@naver.com',null,sysdate-35);
insert into member values('lux','1','럭스','78','여','010-7777-7777','수원시 호매실동','lux@naver.com',null,sysdate-27);
insert into member values('talon','1','탈론','94','남','010-8888-8888','부산시 해운대','talon@naver.com',null,sysdate-15);
insert into member values('zed','1','제드','90','남','010-9999-9999','부천시 원미구','zed@daum.net',null,sysdate);
insert into member values('shen','1','쉔','86','남','010-1010-1010','서울특별시 강서구','shen@daum.net',null,sysdate);
insert into member values('jonadan','1','조나단','80','남','010-1101-1101','서울특별시 강남구','jonadan@daum.net',null,sysdate-10);
insert into member values('jane','1','제인','90','여','010-1212-1212','서울특별시 강남구','jane@nate.com',null,sysdate-10);
insert into member values('iu','1','아이유','90','여','010-1313-1313','인천시 연수구','iu@nate.com',null,sysdate-25);
insert into member values('rise','1','라이즈','98','남','010-1414-1414','인천시 남동구','rise@lycos.com',null,sysdate-40);
insert into member values('fortune','1','미스포츈','93','여','010-1515-1515','인천시 남동구','fortune@lycos.com',null,sysdate-30);

insert into movie values('A001','내부자들','우민호','이병헌, 조승우, 백윤식','청소년 관람불가',130,10000,'한국','범죄, 드라마','2015/11/18','2015/12/18',null,null,null);
insert into movie values('A002','이터널 선샤인','미셸 공드리','짐 캐리, 케이트 윈슬렛, 커스틴 던스트, 마크 러팔로, 일라이저 우드','15세 이상',107,10000,'미국','로맨스, 멜로','2015/11/05','2015/12/05',null,null,null);
insert into movie values('A003','검은 사제들','장재현','김윤석, 강동원, 박소담','15세 이상',108,10000,'한국','미스터리, 드라마','2015/11/05','2015/12/05',null,null,null);
insert into movie values('A004','열정같은소리하고있네','정기훈','정재영, 박보영, 오달수, 진경, 배성우, 류현경, 류덕환, 윤균상','15세 이상',106,10000,'한국','드라마','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A005','괴물의 아이','호소다 마모루','야쿠쇼 코지, 미야자키 아오이, 소메타니 쇼타, 히로세 스즈, 오이즈미 요, 릴리 프랭키','12세 이상',119,10000,'일본','애니메이션, 어드벤처, 환타지','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A006','도리화가','이종필','류승룡, 배수지, 송새벽, 김남길, 이동휘, 안재홍','12세 이상',109,10000,'한국','드라마','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A007','헝거게임:더 파이널','프랜시스 로렌스','제니퍼 로렌스, 조쉬 허처슨, 리암 헴스워드, 니탈리 도머, 줄리안 무어, 필립 세이무어 호프만, 릴리 라베','15세 이상',137,10000,'미국','액션, 환타지','2015/11/18','2015/12/18',null,null,null);
insert into movie values('A008','크림슨 피크','길예르모 델 토로','톰 히들스턴, 제시카 차스테인, 미아 와시코브스카','청소년 관람불가',119,10000,'미국','스릴러, 환타지','2015/11/25','2015/12/25',null,null,null);
insert into movie values('A009','007 스펙터','샘 멘데스','다니엘 크레이그, 레아 세이두, 크리스토프 왈츠, 모니카 벨루치','15세 이상',148,10000,'미국, 영국','스릴러, 환타지','2015/11/11','2015/12/11',null,null,null);
insert into movie values('A010','프리덤','피터 코센스','쿠바 구딩 주니어, 베르나르드 포처, 윌리암 새들러','12세 이상',95,10000,'미국','드라마','2015/11/19','2015/12/19',null,null,null);

insert into room values('강남','1관',16,16,16,16,16,16,16,16,16,16);
insert into room values('강남','2관',16,16,16,16,16,16,16,16,16,0);
insert into room values('강남','3관',16,16,16,16,16,16,16,16,16,0);
insert into room values('강남','4관',12,16,16,16,16,16,16,16,16,0);
insert into room values('강남','5관',12,16,16,16,16,16,16,16,0,0);

insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/18','09:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/18','12:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/18','15:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/18','18:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/18','21:00',160);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/18','09:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/18','12:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/18','15:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/18','18:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/18','21:20',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/18','09:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/18','12:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/18','15:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/18','18:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/18','21:40',144);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/18','08:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/18','11:40',140);
insert into schedule values(seq.nextval,'A005','강남','4관','2015/11/18','14:40',140);
insert into schedule values(seq.nextval,'A006','강남','4관','2015/11/18','17:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/18','20:40',140);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/18','10:00',124);
insert into schedule values(seq.nextval,'A008','강남','5관','2015/11/18','13:20',124);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/18','15:40',124);
insert into schedule values(seq.nextval,'A009','강남','5관','2015/11/18','19:40',124);
insert into schedule values(seq.nextval,'A010','강남','5관','2015/11/18','23:00',124);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/19','09:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/19','12:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/19','15:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/19','18:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/19','21:00',160);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/19','09:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/19','12:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/19','15:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/19','18:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/19','21:20',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/19','09:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/19','12:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/19','15:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/19','18:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/19','21:40',144);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/19','08:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/19','11:40',140);
insert into schedule values(seq.nextval,'A005','강남','4관','2015/11/19','14:40',140);
insert into schedule values(seq.nextval,'A006','강남','4관','2015/11/19','17:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/19','20:40',140);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/19','10:00',124);
insert into schedule values(seq.nextval,'A008','강남','5관','2015/11/19','13:20',124);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/19','15:40',124);
insert into schedule values(seq.nextval,'A009','강남','5관','2015/11/19','19:40',124);
insert into schedule values(seq.nextval,'A010','강남','5관','2015/11/19','23:00',124);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/20','09:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/20','12:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/20','15:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/20','18:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/20','21:00',160);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/20','09:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/20','12:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/20','15:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/20','18:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/20','21:20',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/20','09:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/20','12:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/20','15:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/20','18:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/20','21:40',144);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/20','08:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/20','11:40',140);
insert into schedule values(seq.nextval,'A005','강남','4관','2015/11/20','14:40',140);
insert into schedule values(seq.nextval,'A006','강남','4관','2015/11/20','17:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/20','20:40',140);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/20','10:00',124);
insert into schedule values(seq.nextval,'A008','강남','5관','2015/11/20','13:20',124);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/20','15:40',124);
insert into schedule values(seq.nextval,'A009','강남','5관','2015/11/20','19:40',124);
insert into schedule values(seq.nextval,'A010','강남','5관','2015/11/20','23:00',124);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/21','09:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/21','12:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/21','15:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/21','18:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/21','21:00',160);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/21','09:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/21','12:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/21','15:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/21','18:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/21','21:20',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/21','09:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/21','12:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/21','15:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/21','18:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/21','21:40',144);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/21','08:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/21','11:40',140);
insert into schedule values(seq.nextval,'A005','강남','4관','2015/11/21','14:40',140);
insert into schedule values(seq.nextval,'A006','강남','4관','2015/11/21','17:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/21','20:40',140);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/21','10:00',124);
insert into schedule values(seq.nextval,'A008','강남','5관','2015/11/21','13:20',124);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/21','15:40',124);
insert into schedule values(seq.nextval,'A009','강남','5관','2015/11/21','19:40',124);
insert into schedule values(seq.nextval,'A010','강남','5관','2015/11/21','23:00',124);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/22','09:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/22','12:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/22','15:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/22','18:00',160);
insert into schedule values(seq.nextval,'A001','강남','1관','2015/11/22','21:00',160);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/22','09:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/22','12:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/22','15:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/22','18:20',144);
insert into schedule values(seq.nextval,'A002','강남','2관','2015/11/22','21:20',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/22','09:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/22','12:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/22','15:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/22','18:40',144);
insert into schedule values(seq.nextval,'A003','강남','3관','2015/11/22','21:40',144);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/22','08:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/22','11:40',140);
insert into schedule values(seq.nextval,'A005','강남','4관','2015/11/22','14:40',140);
insert into schedule values(seq.nextval,'A006','강남','4관','2015/11/22','17:40',140);
insert into schedule values(seq.nextval,'A004','강남','4관','2015/11/22','20:40',140);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/22','10:00',124);
insert into schedule values(seq.nextval,'A008','강남','5관','2015/11/22','13:20',124);
insert into schedule values(seq.nextval,'A007','강남','5관','2015/11/22','15:40',124);
insert into schedule values(seq.nextval,'A009','강남','5관','2015/11/22','19:40',124);
insert into schedule values(seq.nextval,'A010','강남','5관','2015/11/22','23:00',124);



update movie set STORY='A001S' where film_number='A001';
update movie set STORY='A002S' where film_number='A002';
update movie set STORY='A003S' where film_number='A003';
update movie set STORY='A004S' where film_number='A004';
update movie set STORY='A005S' where film_number='A005';
update movie set STORY='A006S' where film_number='A006';
update movie set STORY='A007S' where film_number='A007';
update movie set STORY='A008S' where film_number='A008';
update movie set STORY='A009S' where film_number='A009';
update movie set STORY='A010S' where film_number='A010';

update movie set cut='A001/A0011/A0012/A0013/A0014/A0015/A0016/A0017' where film_number='A001';
update movie set cut='A002/A0021/A0022/A0023/A0024/A0025/A0026' where film_number='A002';
update movie set cut='A003/A0031/A0032/A0033/A0034/A0035/A0036/A0037/A0038/A0039' where film_number='A003';
update movie set cut='A004/A0041/A0042/A0043/A0044/A0045/A0046/A0047/A0048/A0049' where film_number='A004';
update movie set cut='A005/A0051/A0052/A0053/A0054/A0055/A0056' where film_number='A005';
update movie set cut='A006/A0061/A0062/A0063/A0064/A0065/A0066/A0067/A0068' where film_number='A006';
update movie set cut='A007/A0071/A0072/A0073/A0074/A0075' where film_number='A007';
update movie set cut='A008/A0081/A0082/A0083/A0084/A0085/A0086/A0087/A0088/A0089' where film_number='A008';
update movie set cut='A009/A0091/A0092/A0093/A0094/A0095/A0096/A0097/A0098/A0099/A00910/A00911' where film_number='A009';
update movie set cut='A010/A0101/A0102/A0103/A0104/A0105/A0106' where film_number='A010';

update movie set TRAILER='PjAxHoauiTs/BKO8Zl5DR5Q/UZy8aopPmwE' where film_number='A001';
update movie set TRAILER='Zyzop2nzR4k/EHhHewjBCb4/yE-f1alkq9I' where film_number='A002';
update movie set TRAILER='_Mq89LG2gfw/TJeM0pD-vus/B0D9Gg8PI6s' where film_number='A003';
update movie set TRAILER='gZZin4RKaXw/WThABv8Kq1w/BzctMGVtnQA' where film_number='A004';
update movie set TRAILER='wo7X8NwnZAw/dOXRB9JiydQ/NF6wZOR2CCU' where film_number='A005';
update movie set TRAILER='u7YshVJx23A/MM_RRIhRpPg/gxAwcS_ErAY' where film_number='A006';
update movie set TRAILER='_hCceaMeHOE/x-8VXx5I0gg/uRnetgm_jUA' where film_number='A007';
update movie set TRAILER='i_WNdO0EsdE/mU20xVCPi2o/hPAxmoUXu_k' where film_number='A008';
update movie set TRAILER='FKWCV61We7I/5GrThQMuPK0/-wT76eIL5mo' where film_number='A009';
update movie set TRAILER='fvIzZ9qezV8/foMNxnyfLFU/vQFU-UKfEvE' where film_number='A010';

commit;