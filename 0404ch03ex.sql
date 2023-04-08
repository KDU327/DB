select *
from   book;

select *
from   customer;

select *
from   orders;

select avg(saleprice)
from   orders;

/*�������� ������ ������ ���ǻ� ��*/
select count(b.publisher)
from   book b, customer c, orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '������';

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
select b.bookname, o.saleprice, b.price - o.saleprice
from   book b, customer c, orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '������';

/*�������� �������� ���� ������ �̸�*/
select bookname
from   book
where  bookid not in (
                        select o.bookid
                        from   customer c, orders o
                        where  c.custid = o.custid
                        and    c.name   = '������'
                     );

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
select name
from   Customer
where  name in (select name
               from   Customer
               where  custid = 5);

/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
select sum(saleprice), avg(saleprice)
from   Orders;

/*���� �̸��� ���� ���ž�*/
select c.name, o.saleprice
from   Customer c, Orders o
where  c.custid = o.custid
group  by c.name, o.saleprice;

/*���� �̸��� ���� ������ ���� ���*/
select c.name, b.bookname
from   Book b, Customer c, Orders o
where  b.bookid = o.bookid
and    c.custid = o.custid;

/*������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
select max(b.price - o.saleprice)
from   Book b, Orders o
where  b.bookid = o.bookid;

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
select name
from   Customer
where  custid in (select o1.custid
                  from   Orders o1, Orders o2
                  group  by o1.custid
                  having avg(o1.saleprice) > avg(o2.saleprice));