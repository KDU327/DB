/*0605*/
select *
from   book;

/*å ������ �౸�� ���� �ڷḸ ���� ���̺� ����*/
create view vw_book
as select *
   from   book
   where  bookname like '%�౸%';

select *
from   vw_book;

select *
from   customer;

/*�ּҰ� ���ѹα��� �����ڷ� ���� ���̺� ����*/
create view vw_customer
as select *
   from   customer
   where  address like '%���ѹα�%';

select *
from   vw_customer;

/*�� ����*/
create or replace view vw_customer(custid, name, address)
as select custid, name, address
   from   customer
   where  address like '%����%';

select *
from   vw_customer;

/*�� ����*/
drop view vw_customer;
drop view vw_book;