create table member(
	member_id varchar(100) not null primary key,
    member_password varchar(200) not null,
    member_name varchar(100) not null,
    member_phone varchar(100) not null,
    member_email varchar(200) not null,
    member_address varchar(300) not null

);