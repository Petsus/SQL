use petsus;

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
    address_id integer not null,

    constraint fk_animal_user foreign key(user_id) references authorization_user(id) on delete cascade,
    constraint fk_animal_race foreign key(race_id) references race(id) on delete cascade,
    constraint fk_animal_address foreign key(address_id) references address(id)
);
