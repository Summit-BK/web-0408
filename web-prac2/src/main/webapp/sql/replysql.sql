use board;
create table reply(
	reply_num int not null primary key auto_increment,
	board_num int not null,
	reply_userid varchar(100) not null,
	reply_contents varchar(1000) not null
	
);
