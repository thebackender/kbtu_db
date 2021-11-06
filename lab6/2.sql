--a
create view a as select sell.date, count(distinct sell.client_id), avg(sell.amount), sum(sell.amount) from sell
    inner join client on sell.client_id = client.id group by sell.date order by sell.date asc;
drop view a;
select * from a;

--b
create view b as select date, a.avg from a order by a.avg desc limit 5;
drop view b;
select * from b;
--c
create view c as select dealer.name, count(sell.amount), avg(sell.amount), sum(sell.amount) as total from sell
    inner join dealer on dealer.id = sell.dealer_id group by dealer.name;
drop view c;
select * from c;
--d
create view d as select dealer.name, sum(sell.amount * dealer.charge) as earnings from sell
    inner join dealer on sell.dealer_id = dealer.id group by dealer.name;
drop view d;
select * from d;
--e
create view e as select dealer.location, count(sell.amount), avg(sell.amount), sum(sell.amount) from sell
    inner join dealer on dealer.id = sell.dealer_id group by dealer.location;
drop view e;
select * from e;
--f
create view f as select client.city, count(sell.amount), avg(sell.amount), sum(sell.amount) from sell
    inner join client on sell.client_id = client.id group by client.city;
select * from f;
--g
create view g as select f.city from f join e on f.city = e.location and f.sum > e.sum;
select * from g;
drop view g;