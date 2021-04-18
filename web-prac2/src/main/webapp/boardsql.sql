create database board;
use board;
create table board(
	board_num int not null primary key,
	board_title varchar(100) not null,
	board_contents varchar(5000) not null,
	board_userID varchar(100) not null,
	board_date varchar(150) not null,
	board_available TINYINT default 1,
	board_file varchar(300) not null,
	board_count int not null
);

