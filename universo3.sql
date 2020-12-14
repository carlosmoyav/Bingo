/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     13/12/2020 3:10:13                           */
/*==============================================================*/


drop table ASOCIADO;

drop table CARGO;

drop table JUGADOR;

drop table JUGADOR_PARTIDA;

drop table LUGAR;

drop table PARTIDA;

drop table PREMIACION_LINE;

drop table PREMIO;

drop table TABLA;

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
   JUGADOR_ID           INT4                 not null,
   constraint PK_TABLA primary key (TABLA_ID)
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

alter table TABLA
   add constraint FK_TABLA_RELATIONS_JUGADOR foreign key (JUGADOR_ID)
      references JUGADOR (JUGADOR_ID)
      on delete restrict on update restrict;

