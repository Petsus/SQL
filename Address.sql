use petsus;

create table if not exists state(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null,
    initials varchar(2) not null,
    ibge_id integer not null
);

create table if not exists city(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null,
    ibge_id integer not null,
    state_id integer not null,
    
    constraint fk_city_state foreign key(state_id) references state(id) on delete cascade 
);

create table if not exists address(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    address varchar(255) not null,
    number integer not null,
    complement varchar(255),
    neighborhood varchar(255) not null,
    lat double not null,
    lng double not null,
    city_id integer not null,
	user_id integer null,
	postal_code varchar(8) not null,
    
    constraint fk_address_user foreign key(user_id) references authorization_user(id),
    constraint fk_address_city foreign key(city_id) references city(id)
);

create table if not exists town_hall(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    
    city_id integer not null,
    user_id integer not null,
    
    constraint fk_town_hall_user foreign key(user_id) references town_hall_user(id),
    constraint fk_town_hall_city foreign key(city_id) references city(id)
);