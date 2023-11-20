use petsus;

create table if not exists clinic(
	id integer not null auto_increment primary key,
    created_at datetime not null,
    updated_at datetime not null,
    name varchar(255) not null,
    phone varchar(11),
    site text,
    address_id integer null,
    adm_user integer not null,
    
    constraint fk_clinic_user foreign key(adm_user) references authorization_user(id),
    constraint fk_clinic_address foreign key(address_id) references address(id)
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