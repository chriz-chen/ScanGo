create table if not exists User (
	userId int not null primary key auto_increment,
    firstName varchar(100) not null,
    lastName varchar(100) not null,
    email varchar(100) not null,
    password varchar(100) not null
);