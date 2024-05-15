use complejos;
create table deportes (
id_deporte int primary key,
nombre varchar(100),
num_jugadores int
);

create table jefes (
id_jefe int primary key,
nombre varchar(100),
email varchar(100),
titulo varchar(100)
);
create table comisario (
	id_comisario int primary key,
    nombre varchar(100),
	email varchar(100),
	telefono varchar(100),
    tipo enum ('juez','observador')
);
create table eventos (
id_evento int primary key,
nombre varchar(100),
fecha date,
duracion time,
num_participantes int
);
create table equipamiento (
id_equipamiento int primary key,
nombre_equipos varchar(100),
stock int
);

create table info_complejo (
id_complejo int primary key,
nombre varchar(100),
area_complejo float,
id_jefe int,
foreign key (id_jefe) references jefes(id_jefe)
);
create table sede (
id_sede int primary key,
nombre varchar(100),
id_complejo int,
presupuesto float,
foreign key (id_complejo) references info_complejo(id_complejo)
);
create table sede_polideportivo (
id_sede int primary key,
nombre varchar(100),
id_complejo_polideportivo int,
presupuesto float,
foreign key (id_complejo_polideportivo) references complejo_polideportivo(id_complejo_polideportivo)
);
create table sede_deportivo (
id_sede int primary key,
nombre varchar(100),
id_complejo_deportivo int,
presupuesto float,
foreign key (id_complejo_deportivo) references complejo_deportivo(id_complejo_deportivo)
);


create table complejo_deportivo (
id_complejo_deportivo int primary key,
nombre varchar(100),
id_deporte int,
id_info_complejo int,
foreign key (id_deporte) references deportes(id_deporte),
foreign key (id_info_complejo) references info_complejo(id_complejo)
);

create table complejo_polideportivo(
id_complejo_polideportivo int primary key,
nombre varchar (100),
id_deporte int,
id_info_complejo int,
foreign key (id_deporte) references deportes(id_deporte),
foreign key (id_info_complejo) references info_complejo(id_complejo)
);
create table evento_comisario (
id_evento_comisario int primary key,
id_evento int,
id_comisario int,
foreign key (id_evento) references eventos(id_evento),
foreign key (id_comisario) references comisario(id_comisario)
);
create table evento_complejo_poli(
id_evento_complejo int primary key,
id_evento int,
id_complejo int,
foreign key (id_evento) references eventos(id_evento),
foreign key (id_complejo) references complejo_polideportivo(id_complejo_polideportivo)
);
create table evento_complejo_deportivo(
id_evento_complejo_deportivo int primary key,
id_evento int,
id_complejo int,
foreign key (id_evento) references eventos(id_evento),
foreign key (id_complejo) references complejo_deportivo(id_complejo_deportivo)
);
create table evento_equipo(
id_evento_equipo int primary key,
id_evento int,
id_equipamiento int,
foreign key (id_evento) references eventos(id_evento),
foreign key (id_equipamiento) references equipamiento(id_equipamiento)

);
create






















