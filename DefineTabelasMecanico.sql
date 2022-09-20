create database mecanic;

use mecanic;

create table person(
idPerson int auto_increment primary key,
Name varchar(150) not null,
CPF char(11) not null,
Adress varchar(150) not null,
Telefone varchar(11) not null,
constraint unique_cpf_client unique (CPF)
);

create table functionary(
idfunctionary int auto_increment primary key,
idFPerson int,
Speciality enum('Borracheiro','Motor','Combustivel','Interno') not null,
constraint fk_functionary_person foreign key (idFPerson) references person(idPerson) 
);


create table clients(
idClients int auto_increment primary key,
idCPerson int,
constraint fk_clients_person foreign key (idCPerson) references person(idPerson) 
);

create table equip(
idEquip int auto_increment primary key,
idEFunctionary int,
Speciality enum('Borracheiro','Motor','Combustivel','Interno') not null,
constraint fk_equip_Speciality foreign key (idEFunctionary) references functionary(idFunctionary) 
);

create table vehicle(
idVehicle int auto_increment primary key,
idVClients int,
idVEquip int,
Motive enum('Conserto','Revisao') not null,
Board varchar(7) not null,
KMs int not null,
Defect varchar (150),
constraint unique_board_vehicle unique (board),
constraint fk_vehicle_clients foreign key (idVClients) references clients(idClients),
constraint fk_vehicle_equip foreign key (idVEquip) references equip(idEquip)
);

create table os(
idOs int auto_increment primary key,
idOSvehicle int,
DeliveryDate date not null,
TotalPrice float not null,
Status enum('Aguardando', 'Em processo','Finalizado') not null,
CompleticionDate date not null,
constraint fk_os_vehicle foreign key (idOSvehicle) references vehicle(idVehicle)
);

create table labor(
idLabor int auto_increment primary key,
Service varchar(100) not null
);


create table service(
	idSlabor int,
	idSOs int,
    Price float not null,
    primary key(idSlabor,idSOs),
    constraint fk_service_labor foreign key (idSlabor) references labor (idLabor),
    constraint fk_service_os foreign key (idSOs) references os(idOs)
);


create table part(
	idPart int,
	Name varchar(50) not null,
    Price float not null,
    Category varchar(50) not null,
    Brand varchar(50) not null,
    Observation varchar(50)
     
);


create table partOS(
	idPOs int,
	idPPart int,
    Quantity int,
    primary key(idPOs,idPPart),
    constraint fk_partOS_os foreign key (idPOs) references os(idOs),
    constraint fk_partOS_part foreign key (idPPart) references part(idPart)
);
