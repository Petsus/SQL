use petsus;

create table if not exists authorization_user(
	id integer not null auto_increment primary key,
    email text not null,
    password text not null,
    name varchar(255) not null,
    enable boolean not null default true
);

create table if not exists adm_user(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    authorization_id integer not null,
    
    constraint fk_authorization_user_adm_user foreign key(authorization_id) references authorization_user(id)
);

create table if not exists user(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
	authorization_id integer not null,
    
    email_verified datetime,
    phone_verified datetime,
    phone varchar(11),

    constraint fk_authorization_user_user foreign key(authorization_id) references authorization_user(id)
);

create table if not exists veterinary_user(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    authorization_id integer not null,
    crm varchar(30) not null,
    
    constraint fk_authorization_user_veterinary_user foreign key(authorization_id) references authorization_user(id)
);

create table if not exists clinic_user(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    authorization_id integer not null,
    cpf varchar(14),
    cnpj varchar(30),
    
    constraint fk_authorization_user_clinic_user foreign key(authorization_id) references authorization_user(id)
);

create table if not exists town_hall_user(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    authorization_id integer not null,
    
    constraint fk_authorization_user_town_hall_user foreign key(authorization_id) references authorization_user(id)
);

create table if not exists roles(
	id integer not null auto_increment primary key,
    name varchar(255) not null
);

create table if not exists user_roles(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    roles_id integer not null,
    authorization_id integer not null,
    
    constraint fk_roles_user_roles foreign key(roles_id) references roles(id),
    constraint fk_authorization_user_user_roles foreign key(authorization_id) references authorization_user(id)
);

create table if not exists verification_user (
	id integer not null auto_increment primary key,
	expiration_date datetime not null,
	token text not null,
	user_id integer not null,
    type varchar(50) not null,
	
    constraint fk_password_reset_user_user foreign key(user_id) references authorization_user(id) on delete cascade
);

create table if not exists user_phone(
	id integer not null auto_increment primary key,
    user_id integer not null,
    token text not null,
    
    constraint fk_user_phone_user foreign key(user_id) references authorization_user(id)
);
