/*2023-05-30 �Լ� ����*/
/*���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø��� ���� ���Ͻÿ�.*/
SELECT custid "����ȣ", ROUND(SUM(saleprice)/COUNT(*), -2) "��ձݾ�"
FROM   Orders
GROUP  BY custid;

/*��¥�� ���� ���� ���*/
select to_date('2020-07-01', 'yyyy-mm-dd') + 5 before,
       to_date('2020-07-01', 'yyyy-mm-dd') - 5 after
from   dual;

/*���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.*/
select orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate + 10 "Ȯ��"
from   orders;

/*dbms ������ ������ ���� ��¥�� �ð�, ���� Ȯ��*/
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from   dual;

/*���缭�� �� �� ���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�*/
select substr(name, 1, 1) "��", count(*) "�ο�"
from   customer
group  by substr(name, 1, 1);

/*�̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�. ��, ��ȭ��ȣ�� ���� ���� '����ó ����'����
  ǥ���Ͻÿ�.(null���� �ٸ� ������ ��ü�ϴ� nvl�Լ�)*/
select name "�̸�", nvl(phone, '����ó ����') "��ȭ��ȣ"
from   customer;

/*����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.
  (sql��ȸ����� �������� ��Ÿ���� rownumber)*/
select rownum "����", custid, name, phone
from   customer
where  rownum <= 2;