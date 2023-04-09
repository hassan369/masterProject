create table users(
	id int identity(1,1) primary key,
	name varchar(50) NOT NULL, 
	email varchar(50) not null UNIQUE,
	password varchar(50) not null,
	isAdmin BIT not null DEFAULT 0
);

insert into users (name, email, password, isAdmin)
values ('wesam' , 'wesam@gmail.com', 'wesam97', 1);

insert into users (name, email, password)
values ('ashraf' , 'ashraf@gmail.com', 'ashraf98');

ALTER TABLE users
ADD imgSrc varchar(255);



create table product (
	id int identity(1,1) primary key,
	name varchar(50) not null,
	description varchar(50) not null,
	category varchar(50) not null,
	price numeric not null,
	imgSrc varchar(255) not null,
	discount numeric DEFAULT 0,
	countINStock int not null,
	
	
);

create table reviews (
	id int identity(1,1) primary key,
	user_name varchar(50) not null,
	product_id int not null,
	comment varchar(255),
	rating int ,
	foreign key (product_id) REFERENCES product(id)
);



create table cart (
	id int identity(1,1) primary key,
	product_id int not null, 
	isDeliverd BIT DEFAULT 0,

	user_id int not null,
	qty int default 0,
	foreign key (user_id) references users(id),
	foreign key(product_id) REFERENCES product(id),
);





