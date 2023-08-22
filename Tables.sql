drop database if exists petsus;
create database if not exists petsus;
use petsus;

create table if not exists users(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    email_verified datetime,
    phone_verified datetime,
    name varchar(255) not null,
    enable boolean not null default true,
    email text,
    user_password text,
    phone varchar(11),
    role varchar(10) not null
);

create table if not exists authorization_user(
	id integer not null auto_increment primary key,
    expiration_date datetime not null,
	user_id integer not null,
	
    constraint fk_authorization_user_user foreign key(user_id) references users(id) on delete cascade
);

create table if not exists verification_user (
	id integer not null auto_increment primary key,
	expiration_date datetime not null,
	token text not null,
	user_id integer not null,
    type varchar(50) not null,
	
    constraint fk_password_reset_user_user foreign key(user_id) references users(id) on delete cascade
);

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
    
    constraint fk_address_user foreign key(user_id) references users(id),
    constraint fk_address_city foreign key(city_id) references city(id)
);

create table if not exists clinic(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null,
    cnpj varchar(14),
    cpf varchar(11),
    phone varchar(11),
    site text,
    address_id integer null,
    
    constraint fk_clinic_address foreign key(address_id) references address(id)
); 

create table if not exists clinic_user(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    clinic_id integer not null,
    user_id integer not null,
    
    constraint fk_clinic_user_clinic foreign key(clinic_id) references clinic(id) on delete cascade,
    constraint fk_clinic_user_user foreign key(user_id) references users(id) on delete cascade
);

create table if not exists specie(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null
);

create table if not exists race(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null,
    specie_id integer not null,

    constraint fk_race_specie foreign key(specie_id) references specie(id) on delete cascade
);

create table if not exists animal(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null,
    weight double not null,
    height double not null,
    birthday date,
    image text,
    user_id integer not null,
    race_id integer not null,

    constraint fk_animal_user foreign key(user_id) references users(id) on delete cascade,
    constraint fk_animal_race foreign key(race_id) references race(id) on delete cascade
);

create table if not exists clinic_animal(
	id integer not null auto_increment primary key,
    animal_id integer not null,
    clinic_id integer not null,
    
    constraint fk_clinic_animal_clinic foreign key(clinic_id) references clinic(id) on delete cascade,
    constraint fk_clinic_animal_animal foreign key(animal_id) references animal(id) on delete cascade
);

create table if not exists veterinary(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    user_id integer not null,
    crm varchar(50) not null unique,
    
    constraint fk_veterinary_user foreign key(user_id) references users(id) on delete cascade
);

create table if not exists veterinary_clinic(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    veterinary_id integer not null,
    crm varchar(50) not null unique,
    
    constraint fk_veterinary_clinic_veterinary_id foreign key(veterinary_id) references veterinary(id) on delete cascade
);

create table if not exists vaccine(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null
);

create table if not exists exam(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null
);

create table if not exists medic_record(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    clinic_id integer,
    animal_id integer not null,
    veterinary_id integer,
    vaccine_id integer,
    exam_id integer,
    
    constraint fk_medic_record_exam foreign key(exam_id) references exam(id),
    constraint fk_medic_record_vaccine foreign key(vaccine_id) references vaccine(id),
    constraint fk_medic_record_clinic foreign key(clinic_id) references clinic(id),
    constraint fk_medic_record_animal foreign key(animal_id) references animal(id),
    constraint fk_medic_record_veterinary foreign key(veterinary_id) references veterinary(id)
);

create table if not exists user_phone(
	id integer not null auto_increment primary key,
    user_id integer not null,
    token text not null,
    
    constraint fk_user_phone_user foreign key(user_id) references users(id)
);

create table if not exists news(
	id integer not null auto_increment primary key,
	created_at datetime not null,
    updated_at datetime not null,
    content text not null, 
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
    
    constraint fk_notification_user foreign key(user_id) references users(id),
    constraint fk_notification_animal foreign key(animal_id) references animal(id)
);

create table if not exists clinic_exam(
	id integer not null auto_increment primary key,
    clinic_id integer not null,
    exam_id integer not null,
    
    constraint fk_clinic_exam_clinic foreign key(clinic_id) references clinic(id),
    constraint fk_clinic_exam_exam foreign key(exam_id) references exam(id)
);

create table if not exists clinic_specie(
	id integer not null auto_increment primary key,
    clinic_id integer not null,
    specie_id integer not null,
    
    constraint fk_clinic_specie_clinic foreign key(clinic_id) references clinic(id),
    constraint fk_clinic_specie_specie foreign key(specie_id) references specie(id)
);