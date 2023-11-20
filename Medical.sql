use petsus;

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
    constraint fk_medic_record_veterinary foreign key(veterinary_id) references veterinary_user(id)
);
