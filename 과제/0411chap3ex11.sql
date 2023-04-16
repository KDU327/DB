/*극장 테이블*/
create table theater (
  t_no   number primary key,
  t_name varchar2(40),
  t_loc  varchar2(40)
);

/*상영관 테이블*/
create table cinema (
  t_no   number,
  c_no    number check(c_no >= 1 and c_no <= 10),
  c_movie varchar2(80),
  c_price number check(c_price > 0 and c_price < 20000),
  c_seat  number,
  primary key(t_no, c_no)
);

/*예약 테이블*/
create table reserve (
  t_no   number,
  c_no   number,
  cl_no  number,
  r_sn   number, /*sn = seat number*/
  r_date date,
  primary key(t_no, c_no, cl_no),
  unique (cl_no, r_sn)
);

/*고객 테이블*/
create table client(
  cl_no number primary key,
  cl_name varchar2(40),
  cl_address varchar2(100)
);

insert into theater
values (1, '롯데', '잠실');

insert into theater
values (2, '메가', '강남');

insert into theater
values (3, '대한', '잠실');

insert into cinema
values (1, 1, '어려운 영화', 15000, 48);

insert into cinema
values (3, 1, '멋진 영화', 7500, 120);

insert into cinema
values (3, 2, '재밌는 영화', 8000, 110);

insert into reserve
values (3, 2, 3, 15, '2020-09-01');

insert into reserve
values (3, 1, 4, 16, '2020-09-01');

insert into reserve
values (1, 1, 9, 48, '2020-09-01');

insert into client
values (3, '홍길동', '강남');

insert into client
values (4, '김철수', '잠실');

insert into client
values (9, '박영희', '강남');

select * from theater;
select * from cinema;
select * from reserve;
select * from client;

/*모든 극장의 이름과 위치를 보이시오.*/
select t_name, t_loc
from   theater;

/*'잠실'에 있는 극장을 보이시오.*/
select t_name
from   theater
where  t_loc = '잠실';

/*'잠실'에 사는 고객의 이름을 오름차순으로 보이시오.*/
select cl_name
from   client
where  cl_address = '잠실'
order  by cl_name;

/*가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.*/
select t_no, c_no, c_movie
from   cinema
where  c_price <= 8000;

/*극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
select c.cl_name
from   client c, theater t
where  t.t_loc = c.cl_address;

/*극장의 수는 몇 개인가?*/
select count(t_name)
from   theater;

/*상영되는 영화의 평균 가격은 얼마인가?*/
select avg(c_price)
from   cinema;

/*2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
select count(cl_no)
from   reserve
where  r_date = '2020-09-01';

/*'대한'극장에서 상영된 영화제목을 보이시오.*/
select c_movie
from   cinema
where  t_no like (
                  select t_no
                  from   theater
                  where  t_name = '대한'
                 );

/*'대한'극장에서 영화를 본 고객의 이름을 보이시오.*/
select cl_name
from   client c, theater t, reserve r
where  c.cl_no  = r.cl_no
and    r.t_no   = t.t_no
and    t.t_name = '대한';

/*'대한'극장의 전체 수입을 보이시오.*/
select sum(c.c_price)
from   cinema c, theater t, reserve r
where  c.t_no = t.t_no
and    r.c_no = c.c_no
and    r.t_no = t.t_no
and    t.t_name = '대한';

/*극장별 상영관 수를 보이시오.*/
select count(c_no)
from   cinema
group  by t_no;

/*'잠실'에 있는 극장의 상영관을 보이시오.*/
select c.c_no
from   theater t, cinema c
where  t.t_no  = c.t_no
and    t.t_loc = '잠실';

/*2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/
select count(cl.cl_name)/count(c.c_movie)
from   cinema c, client cl, reserve r
where  c.t_no = r.t_no
and    c.c_no = r.c_no
and    r.cl_no = cl.cl_no;

/*2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.*/
select c.c_movie
from   cinema c, reserve r
where  c.t_no = r.c_no
and    c.c_no = r.c_no
and    r.r_date = '2020-09-01'
group  by c.c_movie;
