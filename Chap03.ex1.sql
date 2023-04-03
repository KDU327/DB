select * 
from   book;

select *
from   customer;

select *
from   orders;

/*������ȣ�� 1�� ������ �̸�*/
select bookname
from   book
where  bookid = 1;

/*������ 20,000�� �̻��� ������ �̸�*/
select bookname
from   book
where  price >= 20000;

/*�������� �ѱ��ž�*/
select sum(saleprice)
from   orders
where  custid = 1;

/*�������� �ѱ��ž� orders ���̺��� custid�� �ܷ�Ű*/
select sum(o.saleprice)
from   orders o, customer c
where  c.custid = o.custid
and    c.name like '������';

/*�������� ������ ������ ��*/
select count(bookid)
from   orders
where  custid = 1;

/*�������� ������ ������ ��*/
select count(o.bookid)
from   orders o, customer c
where  c.custid = o.custid
and    c.name like '������';

/*�������� ������ ������ ���ǻ� ��*/
select count(publisher)
from   book b, customer c, orders o
where  c.custid = o.custid
and    b.bookid = o.bookid
and    c.name like '������';

/*���缭���� ������ �Ѽ�*/
select count(bookid)
from   book;

/*���缭������ ������ ����ϴ� ���ǻ��� �Ѽ�*/
select count(publisher)
from   book;

/*��� ���� �̸�, �ּ�*/
select name, address
from   customer;

/*2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
select orderid
from   orders
where  orderdate between '20/07/04' and '20/07/07';

/*2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
select orderid
from   orders
where  orderdate not between '20/07/04' and '20/07/07';

/*���� '��'���� ���� �̸��� �ּ�*/
select name, address
from   customer
where  name like '��%';

/*���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�*/
select name, address
from   customer
where  name like '��%��';