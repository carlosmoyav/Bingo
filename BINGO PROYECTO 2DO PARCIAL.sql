--Universidad Laica Eloy Alfaro de Manabí
--Carlos Alberto Moya Vera
--Materia: Gestión de base de datos
--Docente: Ing. Robert Moreira Centeno, Mg

/*==============================================================*/
/* Table: ASOCIADO                                              */
/*==============================================================*/
create table ASOCIADO (
   ASOCIADO_ID          SERIAL               not null,
   CARGO_ID             INT4                 not null,
   ASOCIADO_NOMBRE      CHAR(256)            not null,
   ASOCIADO_APELLIDO    CHAR(256)            not null,
   ASOCIADO_TELEFONO    INT4                 not null,
   ASOCIADO_DIRECCION   CHAR(256)            not null,
   constraint PK_ASOCIADO primary key (ASOCIADO_ID)
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   CARGO_ID             SERIAL               not null,
   CARGO_NOMBRE         CHAR(256)            not null,
   constraint PK_CARGO primary key (CARGO_ID)
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR (
   JUGADOR_ID           SERIAL               not null,
   JUGADOR_NOMBRE       CHAR(20)             not null,
   JUGADOR_APELLIDO     CHAR(30)             not null,
   JUGADOR_TELEFONO     INT4                 not null,
   JUGADOR_DIRECCION    CHAR(150)            not null,
   constraint PK_JUGADOR primary key (JUGADOR_ID)
);

/*==============================================================*/
/* Table: JUGADOR_PARTIDA                                       */
/*==============================================================*/
create table JUGADOR_PARTIDA (
   JUGADOR_PARTIDA_ID   SERIAL               not null,
   JUGADOR_ID           INT4                 null,
   PARTIDA_ID           INT4                 null,
   constraint PK_JUGADOR_PARTIDA primary key (JUGADOR_PARTIDA_ID)
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   LUGAR_ID             SERIAL               not null,
   LUGAR_NOMBRE         CHAR(256)            not null,
   constraint PK_LUGAR primary key (LUGAR_ID)
);

/*==============================================================*/
/* Table: PARTIDA                                               */
/*==============================================================*/
create table PARTIDA (
   PARTIDA_ID           SERIAL               not null,
   ASOCIADO_ID          INT4                 not null,
   LUGAR_ID             INT4                 not null,
   PARTIDA_FECHA        DATE                 not null,
   PARTIDA_HORA         TIME                 not null,
   constraint PK_PARTIDA primary key (PARTIDA_ID)
);

/*==============================================================*/
/* Table: PREMIACION_LINE                                       */
/*==============================================================*/
create table PREMIACION_LINE (
   PREMIACION_ID        SERIAL               not null,
   PREMIO_ID            INT4                 not null,
   PARTIDA_ID           INT4                 not null,
   TABLA_ID             INT4                 not null,
   JUGADOR_ID           INT4                 not null,
   constraint PK_PREMIACION_LINE primary key (PREMIACION_ID)
);

/*==============================================================*/
/* Table: PREMIO                                                */
/*==============================================================*/
create table PREMIO (
   PREMIO_ID            SERIAL               not null,
   PREMIO_NOMBRE        CHAR(60)             not null,
   PREMIO_DESCRIPCION   CHAR(150)            not null,
   constraint PK_PREMIO primary key (PREMIO_ID)
);

/*==============================================================*/
/* Table: TABLA                                                 */
/*==============================================================*/
create table TABLA (
   TABLA_ID             SERIAL               not null,
   constraint PK_TABLA primary key (TABLA_ID)
);

/*==============================================================*/
/* Table: TABLA_JUGADOR_PARTIDA                                 */
/*==============================================================*/
create table TABLA_JUGADOR_PARTIDA (
   TABLA_ID             INT4                 not null,
   JUGADOR_PARTIDA_ID   INT4                 not null,
   constraint PK_TABLA_JUGADOR_PARTIDA primary key (TABLA_ID, JUGADOR_PARTIDA_ID)
);

alter table ASOCIADO
   add constraint FK_ASOCIADO_RELATIONS_CARGO foreign key (CARGO_ID)
      references CARGO (CARGO_ID)
      on delete restrict on update restrict;

alter table JUGADOR_PARTIDA
   add constraint FK_JUGADOR__RELATIONS_JUGADOR foreign key (JUGADOR_ID)
      references JUGADOR (JUGADOR_ID)
      on delete restrict on update restrict;

alter table JUGADOR_PARTIDA
   add constraint FK_JUGADOR__RELATIONS_PARTIDA foreign key (PARTIDA_ID)
      references PARTIDA (PARTIDA_ID)
      on delete restrict on update restrict;

alter table PARTIDA
   add constraint FK_PARTIDA_RELATIONS_ASOCIADO foreign key (ASOCIADO_ID)
      references ASOCIADO (ASOCIADO_ID)
      on delete restrict on update restrict;

alter table PARTIDA
   add constraint FK_PARTIDA_RELATIONS_LUGAR foreign key (LUGAR_ID)
      references LUGAR (LUGAR_ID)
      on delete restrict on update restrict;

alter table PREMIACION_LINE
   add constraint FK_PREMIACI_RELATIONS_JUGADOR foreign key (JUGADOR_ID)
      references JUGADOR (JUGADOR_ID)
      on delete restrict on update restrict;

alter table PREMIACION_LINE
   add constraint FK_PREMIACI_RELATIONS_PREMIO foreign key (PREMIO_ID)
      references PREMIO (PREMIO_ID)
      on delete restrict on update restrict;

alter table PREMIACION_LINE
   add constraint FK_PREMIACI_RELATIONS_PARTIDA foreign key (PARTIDA_ID)
      references PARTIDA (PARTIDA_ID)
      on delete restrict on update restrict;

alter table PREMIACION_LINE
   add constraint FK_PREMIACI_RELATIONS_TABLA foreign key (TABLA_ID)
      references TABLA (TABLA_ID)
      on delete restrict on update restrict;

alter table TABLA_JUGADOR_PARTIDA
   add constraint FK_TABLA_JU_RELATIONS_TABLA foreign key (TABLA_ID)
      references TABLA (TABLA_ID)
      on delete restrict on update restrict;

alter table TABLA_JUGADOR_PARTIDA
   add constraint FK_TABLA_JU_RELATIONS_JUGADOR_ foreign key (JUGADOR_PARTIDA_ID)
      references JUGADOR_PARTIDA (JUGADOR_PARTIDA_ID)
      on delete restrict on update restrict;


insert into JUGADOR values (default, 'Leonardo', 'Toala', 0992981325, 'Ave 4 de Noviembre');
insert into JUGADOR values (default, 'Antonio', 'Giler', 0987654211, 'Ave 9 de Octubre');
insert into JUGADOR values (default, 'Pablo', 'Saltos', 0935482651, 'Calle 13');
insert into JUGADOR values (default, 'Luis', 'Delgado', 0909818823, 'Barrio Porvenir');
insert into JUGADOR values (default, 'Andres', 'Mendoza', 0912093267, 'Calle Interbarrial');
insert into JUGADOR values (default, 'Luis', 'Rodas', 0993398332, 'Calle 14');
insert into JUGADOR values (default, 'Carlos', 'Moya', 0911200093, 'Ave 24 y calle 13');
insert into JUGADOR values (default, 'Ariel', 'Almeida', 0992963920, 'Barrio La Aurora');
insert into JUGADOR values (default, 'Andres', 'Mero', 0989898333, 'Montecristi');



insert into cargo values (default, 'Administrador');
insert into cargo values (default, 'Organizador');
insert into cargo values (default, 'Locutor');
insert into cargo values (default, 'Tesorero');
insert into cargo values (default, 'Secretario');
insert into cargo values (default, 'Premiador');
insert into cargo values (default, 'Auspiciante');


insert into asociado values (default, 1, 'Nerio', 'Nunez', '0912332123', 'Barrio La Paz');
insert into asociado values (default, 2, 'Erika', 'Zuniga', '0987371731', 'Barrio Cuba');
insert into asociado values (default, 3, 'Esteban', 'Andrade', '0986162245', 'Manta Beach');
insert into asociado values (default, 4, 'Jaime', 'Hidalgo', '0994656434', 'Cdla Barbasquillo');
insert into asociado values (default, 5, 'Ivanna', 'Delgado', '0931279998', 'Manta Beach');
insert into asociado values (default, 6, 'Nicolle', 'Teran', '0973113433', 'Montecristi');
insert into asociado values (default, 7, 'Angelo', 'Cimera', '0987372456', 'Via San Mateo');


insert into lugar values (default, 'Barrio Cordova');

insert into premio values (default, 'Television 60 pulgadas', 'Marca Sony, modelo 2020 con Tecnologia Qled');
insert into premio values (default, 'iPhone 12', 'Marca Apple, modelo 2020, incluye solo cable lighting');
insert into premio values (default, 'Camara Sony A7iii', 'Marca Sony, modelo 2018, con grabación 4k y 24 pixeles por foto');
insert into premio values (default, 'Arroz Integral', '150lb de arroz, Elaborado por Toalas Farm');
insert into premio values (default, 'Tequila El Charro', 'Tequila blanco y cristalino, de sabor amezcalado, elaborado cuidadosamente con doble destilación ');
insert into premio values (default, 'Juguete Hot Wheels', 'Carrito color blanco, replica de Lamborguini Huracan');


insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);
insert into tabla values (default);


insert into partida values (default, 1, 1, '19/02/2019', '15:00:00' );
insert into partida values (default, 2, 1, '02/03/2019', '15:00:00' );
insert into partida values (default, 3, 1, '17/05/2020', '15:00:00' );
insert into partida values (default, 4, 1, '19/07/2020', '15:00:00' );


insert into jugador_partida values (default, 1, 1 );
insert into jugador_partida values (default, 3, 1 );
insert into jugador_partida values (default, 4, 1 );
insert into jugador_partida values (default, 5, 1 );
insert into jugador_partida values (default, 7, 1 );
insert into jugador_partida values (default, 8, 1 );
insert into jugador_partida values (default, 9, 1 );

insert into jugador_partida values (default, 2, 2 );
insert into jugador_partida values (default, 3, 2 );
insert into jugador_partida values (default, 4, 2 );
insert into jugador_partida values (default, 5, 2 );
insert into jugador_partida values (default, 6, 2 );
insert into jugador_partida values (default, 7, 2 );
insert into jugador_partida values (default, 8, 2 );

insert into jugador_partida values (default, 2, 3 );
insert into jugador_partida values (default, 3, 3 );
insert into jugador_partida values (default, 4, 3 );
insert into jugador_partida values (default, 5, 3 );
insert into jugador_partida values (default, 6, 3 );
insert into jugador_partida values (default, 8, 3 );
insert into jugador_partida values (default, 9, 3 );

insert into jugador_partida values (default, 1, 4 );
insert into jugador_partida values (default, 2, 4 );
insert into jugador_partida values (default, 4, 4 );
insert into jugador_partida values (default, 5, 4 );
insert into jugador_partida values (default, 7, 4 );
insert into jugador_partida values (default, 8, 4 );
insert into jugador_partida values (default, 9, 4 );

insert into tabla_jugador_partida values (1, 1);
insert into tabla_jugador_partida values (2, 1);
insert into tabla_jugador_partida values (3, 1);
insert into tabla_jugador_partida values (4, 2);
insert into tabla_jugador_partida values (5, 2);
insert into tabla_jugador_partida values (6, 2);
insert into tabla_jugador_partida values (7, 3);
insert into tabla_jugador_partida values (8, 3);
insert into tabla_jugador_partida values (9, 3);
insert into tabla_jugador_partida values (10, 4);
insert into tabla_jugador_partida values (11, 4);
insert into tabla_jugador_partida values (12, 4);
insert into tabla_jugador_partida values (13, 5);
insert into tabla_jugador_partida values (14, 5);
insert into tabla_jugador_partida values (15, 5);
insert into tabla_jugador_partida values (16, 6);
insert into tabla_jugador_partida values (17, 6);
insert into tabla_jugador_partida values (18, 6);
insert into tabla_jugador_partida values (19, 7);
insert into tabla_jugador_partida values (20, 7);
insert into tabla_jugador_partida values (21, 7);
insert into tabla_jugador_partida values (22, 8);
insert into tabla_jugador_partida values (23, 8);
insert into tabla_jugador_partida values (24, 8);
insert into tabla_jugador_partida values (25, 9);
insert into tabla_jugador_partida values (26, 9);
insert into tabla_jugador_partida values (27, 10);
insert into tabla_jugador_partida values (28, 10);
insert into tabla_jugador_partida values (29, 11);
insert into tabla_jugador_partida values (30, 11);
insert into tabla_jugador_partida values (31, 11);
insert into tabla_jugador_partida values (32, 12);
insert into tabla_jugador_partida values (33, 12);
insert into tabla_jugador_partida values (34, 13);
insert into tabla_jugador_partida values (35, 13);
insert into tabla_jugador_partida values (36, 14);
insert into tabla_jugador_partida values (37, 14);
insert into tabla_jugador_partida values (38, 14);
insert into tabla_jugador_partida values (39, 15);
insert into tabla_jugador_partida values (40, 15);
insert into tabla_jugador_partida values (41, 16);
insert into tabla_jugador_partida values (42, 16);
insert into tabla_jugador_partida values (43, 17);
insert into tabla_jugador_partida values (44, 17);
insert into tabla_jugador_partida values (45, 18);
insert into tabla_jugador_partida values (46, 18);
insert into tabla_jugador_partida values (47, 18);
insert into tabla_jugador_partida values (48, 19);
insert into tabla_jugador_partida values (49, 19);
insert into tabla_jugador_partida values (50, 20);
insert into tabla_jugador_partida values (51, 20);
insert into tabla_jugador_partida values (52, 21);
insert into tabla_jugador_partida values (53, 22);
insert into tabla_jugador_partida values (54, 23);
insert into tabla_jugador_partida values (55, 24);
insert into tabla_jugador_partida values (56, 25);
insert into tabla_jugador_partida values (57, 26);
insert into tabla_jugador_partida values (58, 27);
insert into tabla_jugador_partida values (59, 28);



insert into premiacion_line values (default, 1, 1, 2, 1 );
insert into premiacion_line values (default, 2, 2, 3, 1 );
insert into premiacion_line values (default, 3, 3, 5, 3 );
insert into premiacion_line values (default, 4, 3, 8, 5 );
insert into premiacion_line values (default, 5, 4, 6, 4 );
insert into premiacion_line values (default, 6, 4, 7, 5 );

--Trigger

create or replace function tg_asignartabla() returns trigger
as
$tg_asignartabla$
    declare
        jugadorid integer;
		partidaid integer;
		cantidad integer;
begin
        SELECT jp.jugador_id, jp.partida_id INTO jugadorid, partidaid FROM jugador_partida jp
		WHERE jp.jugador_partida_id = new.jugador_partida_id;
		
		SELECT COUNT (*) INTO cantidad FROM tabla 
		INNER JOIN tabla_jugador_partida tjp ON tjp.tabla_id = tabla.tabla_id
		INNER JOIN jugador_partida jp ON jp.jugador_partida_id = tjp.jugador_partida_id
		INNER JOIN partida ON jp.partida_id = partida.partida_id
		INNER JOIN jugador ON jugador.jugador_id = jp.jugador_id
		WHERE jugador.jugador_id = jugadorid AND partida.partida_id = partidaid;
        
		if(cantidad=3) then
            raise exception 'Se ha alcanzado el numero maximo de tablas por jugador en esta partida';
        end if;
        return new;
end;
$tg_asignartabla$
language plpgsql;

create trigger tg_asignartabla before insert
on tabla_jugador_partida for each row
execute procedure tg_asignartabla();


--Cursor

do $$
declare

        tabla record;
        ganadores cursor for SELECT jugador.jugador_nombre AS nombre, premiacion_line.partida_id AS id_de_partida FROM premiacion_line
		INNER JOIN jugador ON jugador.jugador_id = premiacion_line.jugador_id;

begin
open ganadores;
fetch ganadores into tabla;
while(found) loop
Raise notice 'Nombre del ganador: %, Id de la partida:  %', tabla.nombre, tabla.id_de_partida;
fetch ganadores into tabla;
end loop;
end $$
language 'plpgsql';


--Procedimiento Almacenado


create or replace function ObtenerCargo(
    IN  apellido varchar,
    OUT cargo varchar
)
as $BODY$
begin
select cargo.cargo_nombre INTO cargo
FROM asociado
INNER JOIN PUBLIC.cargo ON asociado.asociado_id = cargo.cargo_id
WHERE asociado_apellido = apellido;
end
$BODY$ 
language plpgsql;