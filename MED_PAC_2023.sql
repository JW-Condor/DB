/*==============================================================*/
/* CONTEXTO  :      MEDICOS atiende PACIENTES                   */
/* DBMS name :      PostgreSQL 9.x                              */
/* Fecha Hora:      2023/11/08 14:14:14                         */
/*==============================================================*/
/*
---- Destruye objetos tipo INDEX 
drop index ATENCIONES_FK;
drop index ATENCIONES2_FK;
drop index ATENCIONES_PK;
drop index MEDICOS_PK;
drop index PACIENTES_PK;

---- Destruye objetos tipo TABLE
drop table ATENCIONES;
drop table MEDICOS;
drop table PACIENTES;
*/

---- Crea objetos tipo TABLE
/* Table: ATENCIONES                                            */
/*==============================================================*/
create table ATENCIONES (
   MEDCODIGO            CHAR(5)              not null,
   PACCODIGO            CHAR(5)              not null,
   FECHA_ATENCION       DATE                 not null,
   HORA_ATENCION        TIME                 not null,
   constraint PK_ATENCIONES primary key (MEDCODIGO, PACCODIGO)
);

/* Table: MEDICOS                                               */
/*==============================================================*/
create table MEDICOS (
   MEDCODIGO            CHAR(5)              not null,
   MEDNOMBRE            CHAR(50)             not null,
   MEDESPECIALIDAD      CHAR(30)             not null,
   MEDCARNET            CHAR(15)             not null,
   MEDTELEFONO          CHAR(12)             not null,
   constraint PK_MEDICOS primary key (MEDCODIGO)
);

/* Table: PACIENTES                                             */
/*==============================================================*/
create table PACIENTES (
   PACCODIGO            CHAR(5)              not null,
   PACNOMBRE            CHAR(50)             not null,
   PACDIRECCION         CHAR(50)             not null,
   PACTIPOSANGRE        CHAR(4)              not null,
   PACFECHANACIMIENTO   DATE                 not null,
   PACTELEFONO          CHAR(12)             not null,
   constraint PK_PACIENTES primary key (PACCODIGO)
);


---- Crea objetos tipo INDEX
/* Index: ATENCIONES_PK                                         */
/*==============================================================*/
create unique index ATENCIONES_PK on ATENCIONES (MEDCODIGO, PACCODIGO);

/* Index: ATENCIONES2_FK                                        */
/*==============================================================*/
create  index ATENCIONES2_FK on ATENCIONES (MEDCODIGO);

/* Index: ATENCIONES_FK                                         */
/*==============================================================*/
create  index ATENCIONES_FK on ATENCIONES (PACCODIGO);

/* Index: MEDICOS_PK                                            */
/*==============================================================*/
create unique index MEDICOS_PK on MEDICOS (MEDCODIGO);

/* Index: PACIENTES_PK                                          */
/*==============================================================*/
create unique index PACIENTES_PK on PACIENTES (PACCODIGO);

---- Altera objetos tipo TABLE
alter table ATENCIONES
   add constraint FK_ATENCION_ATENCIONE_PACIENTE foreign key (PACCODIGO)
      references PACIENTES (PACCODIGO)
      on delete restrict on update restrict;

alter table ATENCIONES
   add constraint FK_ATENCION_ATENCIONE_MEDICOS foreign key (MEDCODIGO)
      references MEDICOS (MEDCODIGO)
      on delete restrict on update restrict;
