select *
from   book;

select *
from   customer;

select *
from   orders;

/*���缭���� ������ �Ѽ�*/
select count(*)
from   Book;

/*���缭������ ������ ����ϴ� ���ǻ��� �Ѽ�*/
select count(distinct publisher)
from   Book;

/*��� ���� �̸�, �ּ�*/
select name, address
from   Customer;

/*2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
select orderid
from   Orders
where  orderdate between '20/07/04' and '20/07/07';

/*2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
select orderid
from   Orders
where  orderdate not between '20/07/04' and '20/07/07';

/*���� '��'���� ���� �̸��� �ּ�*/
select name, address
from   Customer
where  name like '��%';

/*���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�*/
select name, address
from   Customer
where  name like '��%��';