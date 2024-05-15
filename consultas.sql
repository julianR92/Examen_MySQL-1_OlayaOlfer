use complejos;

-- 1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.
select count(id_evento_complejo_deportivo) as cantidad from evento_complejo_deportivo
where id_complejo=1; -- se le agrega el id que se quiere consultar, en este caso agregue el 1

-- 2. Consulta de Comisarios Asignados a un Evento en Particular.
select count(id_comisario) from evento_comisario
where id_evento=3; -- el 3 representa el id de evento que se quiere consultar

-- 3.Consulta de Todos los Eventos en un Rango de Fechas.
select * from eventos
where fecha between date('2023-05-12') and date('2024-05-12') ;

-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.
select count(id_comisario) as totalComisariosxEvento from evento_comisario;


-- 5. Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.
select i.id_complejo, i.area_complejo from complejo_polideportivo cp
inner join info_complejo i on i.id_complejo=cp.id_info_complejo
where i.area_complejo >13;

-- 6. Consulta de Eventos con Número de Participantes Mayor que la Media
select nombre from eventos
where num_participantes>(select avg(num_participantes) from eventos);

-- 7. Consulta de Equipamiento Necesario para un Evento Específico.
select e.nombre_equipos from evento_equipo eq
left join equipamiento e on e.id_equipamiento=eq.id_equipamiento
where eq.id_evento=3; -- el 3 indica el id de evento que se le ingrese 

-- 8. Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.
select e.id_evento from info_complejo i
inner join complejo_deportivo cd on cd.id_info_complejo=i.id_complejo
inner join evento_complejo_deportivo e on cd.id_complejo_deportivo=e.id_complejo
where i.id_jefe=1; -- el 1 representa el valor del id del jefe a buscar

-- 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.
select * from complejo_polideportivo cp
left join evento_complejo_poli ep on cp.id_complejo_polideportivo=ep.id_complejo
where ep.id_complejo is null;

-- 10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
select * from evento_comisario e
left join comisario c on e.id_comisario=c.id_comisario
where  c.tipo='juez';
