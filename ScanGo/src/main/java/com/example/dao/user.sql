create table if not exists User (
	userId int not null primary key auto_increment,
    username varchar(50) not null,
    password varchar(100) not null,
    email varchar(100) not null,
    phone varchar(50) not null,
    birthday timestamp not null,
    level int,
    authType enum('local', 'github', 'google') default 'local',
    authId varchar(100),
    createDate timestamp not null default current_timestamp
);


set @@global.time_zone = '+8:00';

SELECT @@global.time_zone;


ALTER TABLE `scango`.`user` CHANGE COLUMN `birthday` `birthday` DATE NULL DEFAULT NULL ;