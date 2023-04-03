select * 
from   book;

select *
from   customer;

select *
from   orders;

/*도서번호가 1인 도서의 이름*/
select bookname
from   book
where  bookid = 1;

/*가격이 20,000원 이상인 도서의 이름*/
select bookname
from   book
where  price >= 20000;

/*박지성의 총구매액*/
select sum(saleprice)
from   orders
where  custid = 1;

/*박지성의 총구매액 orders 테이블에서 custid는 외래키*/
select sum(o.saleprice)
from   orders o, customer c
where  c.custid = o.custid
and    c.name like '박지성';

/*박지성의 구매한 도서의 수*/
select count(bookid)
from   orders
where  custid = 1;

/*박지성의 구매한 도서의 수*/
select count(o.bookid)
from   orders o, customer c
where  c.custid = o.custid
and    c.name like '박지성';

/*박지성이 구매한 도서의 출판사 수*/
select count(publisher)
from   book b, customer c, orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '박지성';

/*마당서점의 도서의 총수*/
select count(bookid)
from   book;

/*마당서점에서 도서를 출고하는 출판사의 총수*/
select count(publisher)
from   book;

/*모든 고객의 이름, 주소*/
select name, address
from   customer;

/*2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호*/
select orderid
from   orders
where  orderdate between '20/07/04' and '20/07/07';

/*2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
select orderid
from   orders
where  orderdate not between '20/07/04' and '20/07/07';

/*성이 '김'씨인 고객의 이름과 주소*/
select name, address
from   customer
where  name like '김%';

/*성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소*/
select name, address
from   customer
where  name like '김%아';