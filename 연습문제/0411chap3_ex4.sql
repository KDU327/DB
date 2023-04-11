select * from book;
select * from customer;
select * from orders;
select * from  bookcompany;

/*새로운 도서 ("스포츠 세계", "대한미디어", 10000원)이 마당서점에 입고되었다. 삽입이 안 될
  경우 필요한 데이터가 더 있는지 찾아보시오.*/
insert into book
values (11, '스포츠 세계', '대한미디어', 10000);

/*'삼성당'에서 출판한 도서를 삭제하시오.*/
delete from book
where  publisher = '삼성당';

/*'이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안되면 원인을 생각해 보시오.*/
delete from book
where  publisher = '이상미디어';
/*자식 레코드가 있기 때문에 삭제할 수 없다.*/

/*출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.*/
update book
set    publisher = '대한출판사'
where  bookid    = 11;

/*(테이블 생성) 출판사에 대한 정보를 저장하는 테이블 Bookcompany(name, address, begin)을 
  생성하고자 한다. name은 기본키이며 varchar2(20), address는 varchar2(20), begin은 DATE
  타입으로 선언하여 생성하시오.*/
create table bookcompany
(
  name    varchar2(20) primary key,
  address varchar2(20),
  begin   date
);

/*(테이블 수정) Bookcompany 테이블에 인턴넷 주소를 저장하는 webaddress 속성을 varchar(30)으로
  추가하시오.*/
alter table bookcompany add webadress varchar2(30);

/*Bookcompany 테이블에 임의의 투플 name=한빛아카데미, address=서울시 마포구, begin=1993-01-01,
  webaddress=http://hanbit.co.kr을 삽입하십시오.*/
insert into bookcompany
values ('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');
