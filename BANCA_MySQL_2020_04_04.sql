/*==============================================================*/
/* DBMS name:      MySQL                                        */
/* Created on:     04/04/2020 08:08:08                           */
/*==============================================================*/


/*drop index CLIENTES_PK;

drop table CLIENTES;

drop index GENERA_FK;

drop index CUENTAS_PK;

drop table CUENTAS;

drop index DEBE_FK;

drop index DEBE2_FK;

drop index DEBE_PK;

drop table DEBE;

drop index CONCEDE_FK;

drop index PRESTAMOS_PK;

drop table PRESTAMOS;

drop index SUCURSALES_PK;

drop table SUCURSALES;

drop index TIENE_FK;

drop index TIENE2_FK;

drop index TIENE_PK;

drop table TIENE;
*/
/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CLINOMBRE            CHAR(30)             not null,
   CLICALLE             CHAR(30)             not null,
   CLICIUDAD            CHAR(30)             not null,
   CLISEXO              CHAR(1)              not null,
   CLIFECHANACIMIENTO   DATE                 null,
   CLITIPO              CHAR(3)              not null,
   constraint PK_CLIENTES primary key (CLINOMBRE)
);

/*==============================================================*/
/* Index: CLIENTES_PK                                           */
/*==============================================================*/
create unique index CLIENTES_PK on CLIENTES (
CLINOMBRE
);

/*==============================================================*/
/* Table: CUENTAS                                               */
/*==============================================================*/
create table CUENTAS (
   CUENUMERO            CHAR(7)              not null,
   SUCNOMBRE            CHAR(30)             not null,
   CUESALDO             NUMERIC(11,2)        not null,
   CUETIPO              CHAR(5)              not null,
   CUEFECHA             DATE                 not null,
   constraint PK_CUENTAS primary key (CUENUMERO)
);

/*==============================================================*/
/* Index: CUENTAS_PK                                            */
/*==============================================================*/
create unique index CUENTAS_PK on CUENTAS (
CUENUMERO
);

/*==============================================================*/
/* Index: GENERA_FK                                             */
/*==============================================================*/
create  index GENERA_FK on CUENTAS (
SUCNOMBRE
);

/*==============================================================*/
/* Table: DEBE                                                  */
/*==============================================================*/
create table DEBE (
   PRENUMERO            CHAR(5)              not null,
   CLINOMBRE            CHAR(30)             not null,
   constraint PK_DEBE primary key (PRENUMERO, CLINOMBRE)
);

/*==============================================================*/
/* Index: DEBE_PK                                               */
/*==============================================================*/
create unique index DEBE_PK on DEBE (
PRENUMERO,
CLINOMBRE
);

/*==============================================================*/
/* Index: DEBE2_FK                                              */
/*==============================================================*/
create  index DEBE2_FK on DEBE (
CLINOMBRE
);

/*==============================================================*/
/* Index: DEBE_FK                                               */
/*==============================================================*/
create  index DEBE_FK on DEBE (
PRENUMERO
);

/*==============================================================*/
/* Table: PRESTAMOS                                             */
/*==============================================================*/
create table PRESTAMOS (
   PRENUMERO            CHAR(5)              not null,
   SUCNOMBRE            CHAR(30)             not null,
   PREIMPORTE           NUMERIC(11,2)        not null,
   PREFECHA             DATE                 not null,
   constraint PK_PRESTAMOS primary key (PRENUMERO)
);

/*==============================================================*/
/* Index: PRESTAMOS_PK                                          */
/*==============================================================*/
create unique index PRESTAMOS_PK on PRESTAMOS (
PRENUMERO
);

/*==============================================================*/
/* Index: CONCEDE_FK                                            */
/*==============================================================*/
create  index CONCEDE_FK on PRESTAMOS (
SUCNOMBRE
);

/*==============================================================*/
/* Table: SUCURSALES                                            */
/*==============================================================*/
create table SUCURSALES (
   SUCNOMBRE            CHAR(30)             not null,
   SUCCIUDAD            CHAR(30)             not null,
   SUCCALLE             CHAR(30)             not null,
   SUCACTIVO            NUMERIC(11,2)        not null,
   SUCGERENTE           CHAR(50)             not null,
   SUCTELEFONO          CHAR(10)             not null,
   SUCFECHACREACION     DATE                 not null,
   constraint PK_SUCURSALES primary key (SUCNOMBRE)
);

/*==============================================================*/
/* Index: SUCURSALES_PK                                         */
/*==============================================================*/
create unique index SUCURSALES_PK on SUCURSALES (
SUCNOMBRE
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE (
   CUENUMERO            CHAR(7)              not null,
   CLINOMBRE            CHAR(30)             not null,
   constraint PK_TIENE primary key (CUENUMERO, CLINOMBRE)
);

/*==============================================================*/
/* Index: TIENE_PK                                              */
/*==============================================================*/
create unique index TIENE_PK on TIENE (
CUENUMERO,
CLINOMBRE
);

/*==============================================================*/
/* Index: TIENE2_FK                                             */
/*==============================================================*/
create  index TIENE2_FK on TIENE (
CLINOMBRE
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on TIENE (
CUENUMERO
);

alter table CUENTAS
   add constraint FK_CUExSUC foreign key (SUCNOMBRE)
      references SUCURSALES (SUCNOMBRE)
      on delete restrict on update restrict;

alter table DEBE
   add constraint FK_DEBxCUE foreign key (PRENUMERO)
      references PRESTAMOS (PRENUMERO)
      on delete restrict on update restrict;

alter table DEBE
   add constraint FK_DEBxCLI foreign key (CLINOMBRE)
      references CLIENTES (CLINOMBRE)
      on delete restrict on update restrict;

alter table PRESTAMOS
   add constraint FK_PRExSUC foreign key (SUCNOMBRE)
      references SUCURSALES (SUCNOMBRE)
      on delete restrict on update restrict;

alter table TIENE
   add constraint FK_TIExCUE foreign key (CUENUMERO)
      references CUENTAS (CUENUMERO)
      on delete restrict on update restrict;

alter table TIENE
   add constraint FK_TIExCLI foreign key (CLINOMBRE)
      references CLIENTES (CLINOMBRE)
      on delete restrict on update restrict;

