create database db_doctorrv;
use db_doctorrv;

create table patients(
id int auto_increment primary key,
nom varchar(40),
email varchar(40),
telephone varchar(40)
);
create table medecin(
id int auto_increment primary key,
nom varchar(40),
email varchar(40),
telephone varchar(40)

);
create table rendezvous(
id int auto_increment primary key,
datet Date,
status Text,
id_medecin int,
id_patient int,
foreign key(id_medecin) references medecin(id),
foreign key(id_patient) references patients(id)


);
