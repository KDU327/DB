select *
from   book;

select *
from   customer;

select *
from   orders;

select avg(saleprice)
from   orders;

/*박지성이 구매한 도서의 출판사 수*/
select count(b.publisher)
from   book b, customer c, orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '박지성';

/*박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
select b.bookname, o.saleprice, b.price - o.saleprice
from   book b, customer c, orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '박지성';

/*박지성이 구매하지 않은 도서의 이름*/
select bookname
from   book
where  bookid not in (
                        select o.bookid
                        from   customer c, orders o
                        where  c.custid = o.custid
                        and    c.name   = '박지성'
                     );

/*주문하지 않은 고객의 이름(부속질의 사용)*/
select name
from   Customer
where  name in (select name
               from   Customer
               where  custid = 5);

/*주문 금액의 총액과 주문의 평균 금액*/
select sum(saleprice), avg(saleprice)
from   Orders;

/*고객의 이름과 고객별 구매액*/
select c.name, o.saleprice
from   Customer c, Orders o
where  c.custid = o.custid
group  by c.name, o.saleprice;

/*고객의 이름과 고객이 구매한 도서 목록*/
select c.name, b.bookname
from   Book b, Customer c, Orders o
where  b.bookid = o.bookid
and    c.custid = o.custid;

/*도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
select max(b.price - o.saleprice)
from   Book b, Orders o
where  b.bookid = o.bookid;

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
select name
from   Customer
where  custid in (select o1.custid
                  from   Orders o1, Orders o2
                  group  by o1.custid
                  having avg(o1.saleprice) > avg(o2.saleprice));