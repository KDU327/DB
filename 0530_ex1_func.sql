/*2023-05-30 함수 연습*/
/*고객별 평균 주문 금액을 백 원 단위로 반올림한 값을 구하시오.*/
SELECT custid "고객번호", ROUND(SUM(saleprice)/COUNT(*), -2) "평균금액"
FROM   Orders
GROUP  BY custid;

/*날짜의 이전 이후 계산*/
select to_date('2020-07-01', 'yyyy-mm-dd') + 5 before,
       to_date('2020-07-01', 'yyyy-mm-dd') - 5 after
from   dual;

/*마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.*/
select orderid "주문번호", orderdate "주문일", orderdate + 10 "확정"
from   orders;

/*dbms 서버에 설정된 현재 날짜와 시간, 요일 확인*/
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from   dual;

/*마당서점 고객 중 같은 성을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오*/
select substr(name, 1, 1) "성", count(*) "인원"
from   customer
group  by substr(name, 1, 1);

/*이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호가 없는 고객은 '연락처 없음'으로
  표시하시오.(null값을 다른 값으로 대체하는 nvl함수)*/
select name "이름", nvl(phone, '연락처 없음') "전화번호"
from   customer;

/*고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
  (sql조회결과를 순번으로 나타내는 rownumber)*/
select rownum "순번", custid, name, phone
from   customer
where  rownum <= 2;