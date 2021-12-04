--4.1
create view data as
    select date_part('year', buy.date) as year,
           date_part('month', buy.date) as month,
           date_part('week', buy.date) as week, brands.brand_id, count(buy.storage_id) as c from buy
    join sale on buy.storage_id = sale.storage_id and buy.date > current_date - interval '3 years'
    join model on sale.vehicle_id = model.vehicle_id
    join brand on model.model_id = brand.model_id
    join brands on brand.brand_id = brands.brand_id group by brands.brand_id, year, month, week order by year, month, week desc;
drop view data;
select * from data;
create view trends as select year, month, week, max(c) as m from data group by year, month, week;
drop view trends;
select * from trends;
create view show as select data.year as year, data.month as month, data.week as week, brands.brand_id, brands.name
    from trends join data on trends.year = data.year and trends.month = data.month and trends.m = data.c and trends.week = data.week
        join brands on brands.brand_id = data.brand_id;
drop view show;
--break by gender
select * from show;
select customer.gender, show.year, show.month, show.week, show.name from show
    join brand on show.brand_id = brand.brand_id
    join model on model.model_id = brand.model_id
    join sale on model.vehicle_id = sale.vehicle_id
    join buy on sale.storage_id = buy.storage_id
    join customer on buy.buyer_id = customer_id group by customer.gender, show.year, show.month, show.week, show.name;

--4.2
select v.wmi, v.vds, v.vis, c.first_name from suppliers
    join details d on suppliers.detail_id = d.detail_id
    and suppliers.org_name = 'Getrag' and d.name = 'transmission'
    join detail d2 on d.detail_id = d2.detail_id
    join model m on d2.model_id = m.model_id
    join vehicle v on m.vehicle_id = v.vehicle_id
    join sale s on v.vehicle_id = s.vehicle_id
    join buy b on s.storage_id = b.storage_id
    join buyer b2 on b.buyer_id = b2.buyer_id
    join customer c on b2.buyer_id = c.customer_id;

--4.3
select sum(models.price) as s, brands.name from buy
    join sale on buy.storage_id = sale.storage_id and buy.date > current_date - interval '1 year'
    join model on sale.vehicle_id = model.model_id
    join models on model.model_id = models.model_id
    join brand on models.model_id = brand.model_id
    join brands on brand.brand_id = brands.brand_id
    group by brands.name order by s desc limit 2;

--4.4
select count(*) as s, brands.name from buy
    join sale on buy.storage_id = sale.storage_id and buy.date > current_date - interval '1 year'
    join model on sale.vehicle_id = model.model_id
    join models on model.model_id = models.model_id
    join brand on models.model_id = brand.model_id
    join brands on brand.brand_id = brands.brand_id
    group by brands.name order by s desc limit 2;

--4.5
select date_part('month', buy.date) as month from buy
    join sale on buy.storage_id = sale.storage_id
    join model on sale.vehicle_id = model.vehicle_id
    join models on model.model_id = models.model_id and models.class = 'convertible'
group by month order by count(*) desc limit 1;

--4.6
select avg(buy.date - storages.start_date) from buy
    join sale on sale.storage_id = buy.storage_id
    join storages on buy.storage_id = storages.storage_id;
create view average_keep as select d.org_name, avg(buy.date - storages.start_date) as avg from buy
    join sale on sale.storage_id = buy.storage_id
    join storages on buy.storage_id = storages.storage_id
    join dealers d on sale.dealer_id = d.dealer_id
    group by d.org_name;
select * from average_keep where avg > (select avg(buy.date - storages.start_date) from buy
    join sale on sale.storage_id = buy.storage_id
    join storages on buy.storage_id = storages.storage_id) order by avg desc;