create table product(
	product_id int primary key not null,
    product_name varchar(50) not null,
    product_price int not null,
    product_manufacturer varchar(50) not null,
    product_category varchar(50) not null,
    product_stock int not null,
    product_condition int not null,
    product_file varchar(50) not null,
    product_activation int not null,
    product_soldcount1 int not null
);