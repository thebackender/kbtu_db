--a
select * from client full outer join dealer on client.dealer_id = dealer.id;
--b
select dealer.name, client.name, client.city, client.priority, sell.id, sell.date, sell.amount from dealer
    left outer join client on client.dealer_id = dealer.id
    left outer join sell on client.id = sell.client_id;
--c
select dealer.name, client.name from dealer inner join client on client.city = dealer.location;
--d
select sell.id, sell.amount, client.name, client.city from sell inner join client on (sell.amount between 100 and 500) and client.id = sell.client_id;
--e
select * from dealer inner join client on dealer.location = client.city;
--f
select dealer.name, client.name, client.city, dealer.charge from dealer inner join client on client.dealer_id = dealer.id;
--g
select client.name, client.city, dealer.name, dealer.charge from client inner join dealer on client.dealer_id = dealer.id and dealer.charge > 0.12;
--h
select client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge from client
    left outer join sell on client.id = sell.client_id inner join dealer on sell.dealer_id = dealer.id;
--i
select client.name, client.priority,dealer.name, sell.id, sell.amount from dealer
    inner join client on dealer.id = client.dealer_id
    inner join sell on client.id = sell.client_id and sell.amount >= 2000;
