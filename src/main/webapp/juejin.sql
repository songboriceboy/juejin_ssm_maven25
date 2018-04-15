create table userinfo(
	id int not null PRIMARY key auto_increment,
	username varchar(100) not null DEFAULT '',
	password varchar(100) not null DEFAULT ''
)ENGINE=INNODB;

create table articleinfo
(
  id int not null PRIMARY key auto_increment,
  title varchar(200) not null DEFAULT '',
  content longtext not null DEFAULT '',
	createtime datetime not null DEFAULT '1900-01-01 01:01:01',
	userid int not null DEFAULT 0
)ENGINE=INNODB;

create table commentinfo
(
  id int not null PRIMARY key auto_increment,
  content varchar(1000)  not null DEFAULT '',
  createtime datetime not null DEFAULT '1900-01-01 01:01:01',
  userid int not null DEFAULT 0,
  articleid int not null DEFAULT 0
)ENGINE=INNODB;

alter table userinfo add column avatar varchar(500) not null default '';
alter table articleinfo add column viewcount int not null default 1