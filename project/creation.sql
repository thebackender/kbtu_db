create database project;

create table brands(
    brand_id int NOT NULL PRIMARY KEY,
    name varchar NOT NULL UNIQUE,
    can_sell boolean NOT NULL
);
create table models(
    model_id int NOT NULL PRIMARY KEY ,
    name varchar NOT NULL UNIQUE,
    characteristics text,
    class varchar NOT NULL,
    price int NOT NULL CHECK(price > 0)
);
create table brand(
    brand_id int REFERENCES brands(brand_id),
    model_id int REFERENCES models(model_id),
    PRIMARY KEY (brand_id, model_id)
);
create table details(
    detail_id int NOT NULL PRIMARY KEY ,
    name varchar NOT NULL UNIQUE,
    cost int NOT NULL CHECK ( cost > 0 )
);
create table detail(
    detail_id int REFERENCES details(detail_id),
    model_id int REFERENCES models(model_id),
    PRIMARY KEY (detail_id, model_id)
);
create table owned_companies(
    company_id int NOT NULL PRIMARY KEY ,
    org_name varchar NOT NULL ,
    owned_date date NOT NULL ,
    price int NOT NULL CHECK ( price > 0 )
);
create table owned_constructors(
    constructor_id int REFERENCES owned_companies(company_id) PRIMARY KEY ,
    construct_duration int NOT NULL CHECK ( construct_duration > 0 ),
    construct_cost int NOT NULL CHECK ( construct_cost > 0 )
);
create table owned_suppliers(
    owned_supplier_id int REFERENCES owned_companies(company_id) PRIMARY KEY ,
    detail_id int REFERENCES details(detail_id),
    detail_send_duration int NOT NULL CHECK(detail_send_duration > 0)
);
create table suppliers(
    supplier_id int NOT NULL PRIMARY KEY ,
    org_name varchar NOT NULL,
    detail_id int REFERENCES details(detail_id)
);
create table contruct(
    constructor_id int REFERENCES owned_constructors(constructor_id),
    model_id int REFERENCES models(model_id),
    PRIMARY KEY (constructor_id, model_id)
);
create table vehicle(
    vehicle_id int NOT NULL PRIMARY KEY,
    wmi varchar(3) NOT NULL,
    vds varchar(6) NOT NULL,
    vis varchar(8) NOT NULL,
    UNIQUE(wmi, vds, vis)
);
create table model(
    vehicle_id int REFERENCES vehicle(vehicle_id),
    model_id int REFERENCES models(model_id),
    PRIMARY KEY (vehicle_id, model_id)
);
create table options(
    option_id int NOT NULL PRIMARY KEY ,
    color varchar NOT NULL,
    engine varchar,
    transmission varchar
);
create table option(
    vehicle_id int REFERENCES vehicle(vehicle_id),
    option_id int REFERENCES options(option_id),
    PRIMARY KEY (vehicle_id, option_id)
);
create table dealers(
    dealer_id int NOT NULL PRIMARY KEY ,
    org_name varchar NOT NULL,
    contract_duration int NOT NULL CHECK ( contract_duration > 0 )
);
create table storages(
    storage_id int NOT NULL PRIMARY KEY ,
    start_date date NOT NULL ,
    area double precision NOT NULL CHECK ( area > 10 ),
    rent_cost int NOT NULL CHECK(rent_cost BETWEEN 0 AND 100)
);
create table sale(
    storage_id int REFERENCES storages(storage_id),
    dealer_id int REFERENCES dealers(dealer_id),
    vehicle_id int REFERENCES vehicle(vehicle_id),
    PRIMARY KEY (storage_id, dealer_id, vehicle_id),
    UNIQUE(storage_id)
);
create table buyer(
    buyer_id int NOT NULL PRIMARY KEY ,
    amount int NOT NULL CHECK ( amount > 0 )
);
create table buy(
    storage_id int REFERENCES storages(storage_id),
    buyer_id int REFERENCES buyer(buyer_id),
    date date NOT NULL ,
    PRIMARY KEY (storage_id, buyer_id),
    UNIQUE(storage_id)
);
create table company(
    company_id int REFERENCES buyer(buyer_id) PRIMARY KEY ,
    name varchar NOT NULL
);
create table customer(
    customer_id int REFERENCES buyer(buyer_id) PRIMARY KEY ,
    first_name varchar NOT NULL ,
    last_name varchar NOT NULL ,
    gender varchar(1) NOT NULL CHECK ( gender = 'M' OR gender = 'F' ),
    income int NOT NULL CHECK ( income > 0 )
);
create table contacts(
    contact_id int NOT NULL PRIMARY KEY ,
    country varchar NOT NULL ,
    state varchar NOT NULL ,
    city varchar NOT NULL ,
    street_name varchar NOT NULL ,
    home_number int,
    number varchar NOT NULL
);