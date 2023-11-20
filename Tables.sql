drop database if exists petsus;
create database if not exists petsus;
use petsus;

create table if not exists clinic_animal(
	id integer not null auto_increment primary key,
    animal_id integer not null,
    clinic_id integer not null,
    
    constraint fk_clinic_animal_clinic foreign key(clinic_id) references clinic(id) on delete cascade,
    constraint fk_clinic_animal_animal foreign key(animal_id) references animal(id) on delete cascade
);

create table if not exists veterinary_clinic(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    veterinary_id integer not null,
    clinic_id integer not null,
    
    constraint fk_veterinary_clinic_veterinary_id foreign key(veterinary_id) references authorization_user(id) on delete cascade,
    constraint fk_veterinary_clinic_clinic_id foreign key(clinic_id) references clinic(id) on delete cascade
);

create table if not exists specialities(
	id integer not null auto_increment primary key,
	created_at datetime not null,
    updated_at datetime not null,
    name varchar(150) not null
);

create table if not exists veterinary_specialities(
	id integer not null auto_increment primary key,
	created_at datetime not null,
    updated_at datetime not null,
    veterinary_id integer not null,
    specialities_id integer not null,
    
    constraint fk_veterinary_specialities_veterinary_id foreign key(veterinary_id) references authorization_user(id) on delete cascade,
    constraint fk_veterinary_specialities_specialities_id foreign key(specialities_id) references specialities(id) on delete cascade
    
);

create table if not exists news(
	id integer not null auto_increment primary key,
	created_at datetime not null,
    updated_at datetime not null,
    name varchar(150) not null,
	content text not null, 
	date_event datetime,
    image text not null,
    city_id integer,
    
    constraint fk_news_city foreign key(city_id) references city(id)
);

create table if not exists notification(
	id integer not null auto_increment primary key,
	created_at datetime not null,
    updated_at datetime not null,
    title text not null,
    subtitle text not null,
    image text,
    animal_id integer,
    user_id integer,
    notification_id varchar(150) not null unique,
    
    constraint fk_notification_user foreign key(user_id) references user(id),
    constraint fk_notification_animal foreign key(animal_id) references animal(id)
);