/*==============================================================*/
/* Para DBMS :     PostgreSQL 9.x                               */
/* Created on:     2024/04/01                                   */
/* Modificado:     CCJW                                         */
/*==============================================================*/

/*==============================================================*/
/* Domain: D_SEXO                                               */
/*==============================================================*/
create domain D_SEXO as CHAR(1);

/*==============================================================*/
/* Table: AJUSTES                                               */
/*==============================================================*/
create table AJUSTES (
   AJUCODIGO            SERIAL               not null,
   EMPCODIGO            CHAR(7)              not null,
   AJUDESCRIPCION       CHAR(60)             not null,
   AJUFECHA             DATE                 not null,
   AJUCANTIDADTOTAL     NUMERIC(9,2)         null,
   constraint PK_AJUSTES primary key (AJUCODIGO)
);

/*==============================================================*/
/* Table: BONIFICACIONES                                        */
/*==============================================================*/
create table BONIFICACIONES (
   BONCODIGO            CHAR(5)              not null,
   BONDESCRIPCION       CHAR(30)             not null,
   BONVALOR             DECIMAL(7,2)         not null,
   constraint PK_BONIFICACIONES primary key (BONCODIGO)
);

/*==============================================================*/
/* Table: BXN                                                   */
/*==============================================================*/
create table BXN (
   BONCODIGO            CHAR(5)              not null,
   NOMCODIGO            CHAR(7)              not null,
   BXNVALOR             DECIMAL(7,2)         not null,
   BXNSTATUS            CHAR(3)              not null,
   constraint PK_BXN primary key (BONCODIGO, NOMCODIGO)
);

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CLICODIGO            CHAR(7)              not null,
   CLINOMBRE            CHAR(60)             not null,
   CLIIDENTIFICACION    CHAR(13)             not null,
   CLIDIRECCION         CHAR(60)             not null,
   CLITELEFONO          CHAR(10)             not null,
   CLICELULAR           CHAR(10)             not null,
   CLIEMAIL             CHAR(60)             null,
   CLITIPO              CHAR(3)              not null,
   CLISTATUS            CHAR(3)              not null,
   constraint PK_CLIENTES primary key (CLICODIGO)
);

/*==============================================================*/
/* Table: COMPRAS                                               */
/*==============================================================*/
create table COMPRAS (
   OCNUMERO             CHAR(9)              not null,
   PRVCODIGO            CHAR(7)              not null,
   OCFECHA              DATE                 not null,
   OCSUBTOTAL           NUMERIC(9,2)         not null,
   OCDESCUENTO          NUMERIC(9,2)         null,
   OCVALOR_IVA          NUMERIC(9,2)         null,
   OCVALOR_ICE          NUMERIC(9,2)         null,
   OCFORMAPAGO          CHAR(5)              not null,
   OCFACTURA_ASOCIADA   CHAR(30)             not null,
   OCSTATUS             CHAR(3)              null,
   constraint PK_COMPRAS primary key (OCNUMERO)
);


/*==============================================================*/
/* Table: DESCUENTOS                                            */
/*==============================================================*/
create table DESCUENTOS (
   DESCODIGO            CHAR(5)              not null,
   DESDESCRIPCION       CHAR(30)             not null,
   DESVALOR             DECIMAL(7,2)         not null,
   constraint PK_DESCUENTOS primary key (DESCODIGO)
);

/*==============================================================*/
/* Table: DXN                                                   */
/*==============================================================*/
create table DXN (
   NOMCODIGO            CHAR(7)              not null,
   DESCODIGO            CHAR(5)              not null,
   DXNVALOR             DECIMAL(7,2)         not null,
   DXNSTATUS            CHAR(3)              not null,
   constraint PK_DXN primary key (NOMCODIGO, DESCODIGO)
);

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   EMPCODIGO            CHAR(7)              not null,
   EMPAPELLIDO1         CHAR(30)             not null,
   EMPAPELLIDO2         CHAR(30)             null,
   EMPNOMBRE1           CHAR(30)             not null,
   EMPNOMBRE2           CHAR(30)             null,
   EMPFECHANACIMIENTO   DATE                 not null,
   EMPSEXO              D_SEXO               not null,
   EMPEMAIL             CHAR(60)             not null,
   EMPDIRECCION         CHAR(60)             not null,
   EMPTIPOSANGRE        CHAR(3)              not null,
   EMPSUELDO            NUMERIC(7,2)         not null,
   EMPBANCO             CHAR(30)             not null,
   EMPCUENTA            CHAR(20)             not null,
   EMPSTATUS            CHAR(3)              not null,
   constraint PK_EMPLEADOS primary key (EMPCODIGO)
);


/*==============================================================*/
/* Table: FACTURAS                                              */
/*==============================================================*/
create table FACTURAS (
   FACNUMERO            CHAR(9)              not null,
   CLICODIGO            CHAR(7)              not null,
   FACFECHA             DATE                 not null,
   FACSUBTOTAL          NUMERIC(9,2)         not null,
   FACDESCUENTO         NUMERIC(9,2)         null,
   FACIVA               NUMERIC(9,2)         null,
   FACICE               NUMERIC(9,2)         null,
   FACFORMAPAGO         CHAR(5)              not null,
   FACSTATUS            CHAR(3)              not null,
   constraint PK_FACTURAS primary key (FACNUMERO)
);

/*==============================================================*/
/* Table: INGRESOS                                              */
/*==============================================================*/
create table INGRESOS (
   INGCODIGO            SERIAL               not null,
   EMPCODIGO            CHAR(7)              not null,
   INGDESCRIPCION       CHAR(30)             not null,
   INGFECHA             DATE                 not null,
   INGCANTIDADTOTAL     NUMERIC(9,2)         null,
   INGREFERENCIA        CHAR(60)             null,
   constraint PK_INGRESOS primary key (INGCODIGO)
);

/*==============================================================*/
/* Table: NOMINAS                                               */
/*==============================================================*/
create table NOMINAS (
   NOMCODIGO            CHAR(7)              not null,
   EMPCODIGO            CHAR(7)              not null,
   NOMANIO              CHAR(4)              not null,
   NOMMES               CHAR(2)              not null,
   NOMFECHAINICIAL      DATE                 not null,
   NOMFECHAFINAL        DATE                 not null,
   NOMSTATUS            CHAR(3)              not null,
   constraint PK_NOMINAS primary key (NOMCODIGO)
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   PROCODIGO            CHAR(9)              not null,
   PRODESCRIPCION       CHAR(50)             not null,
   PROUNIDADMEDIDA      CHAR(3)              not null,
   PROSALDOINICIAL      DECIMAL(9,2)         not null,
   PROINGRESOS          DECIMAL(9,2)         not null,
   PROEGRESOS           NUMERIC(9,2)         not null,
   PROAJUSTES           NUMERIC(9,2)         not null,
   PROSALDOFINAL        NUMERIC(9,2)         not null,
   PROCOSTOUM           NUMERIC(7,2)         not null,
   PROPRECIOUM          NUMERIC(7,2)         not null,
   PROSTATUS            CHAR(3)              not null,
   constraint PK_PRODUCTOS primary key (PROCODIGO)
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   PRVCODIGO            CHAR(7)              not null,
   PRVNOMBRE            CHAR(30)             not null,
   PRVIDENTIFICACION    CHAR(10)             not null,
   PRVDIRECCION         CHAR(60)             not null,
   PRVTELEFONO          CHAR(10)             null,
   PRVCELULAR           CHAR(10)             null,
   PRVEMAIL             CHAR(60)             null,
   PRVTIPO              CHAR(3)              not null,
   PRVSTATUS            CHAR(3)              not null,
   constraint PK_PROVEEDORES primary key (PRVCODIGO)
);


/*==============================================================*/
/* Table: PXA                                                   */
/*==============================================================*/
create table PXA (
   AJUCODIGO            INT4                 not null,
   PROCODIGO            CHAR(9)              not null,
   PXACANTIDAD          NUMERIC(9,2)         not null,
   constraint PK_PXA primary key (AJUCODIGO, PROCODIGO)
);


/*==============================================================*/
/* Table: PXF                                                   */
/*==============================================================*/
create table PXF (
   FACNUMERO            CHAR(9)              not null,
   PROCODIGO            CHAR(9)              not null,
   PXFCANTIDAD          NUMERIC(9,2)         not null,
   PXFVALOR             NUMERIC(7,2)         not null,
   PXFSUBTOTAL          NUMERIC(9,2)         not null,
   PXFSTATUS            CHAR(3)              not null,
   constraint PK_PXF primary key (FACNUMERO, PROCODIGO)
);


/*==============================================================*/
/* Table: PXI                                                   */
/*==============================================================*/
create table PXI (
   INGCODIGO            INT4                 not null,
   PROCODIGO            CHAR(9)              not null,
   PXICANTIDAD          NUMERIC(9,2)         not null,
   constraint PK_PXI primary key (INGCODIGO, PROCODIGO)
);


/*==============================================================*/
/* Table: PXO                                                   */
/*==============================================================*/
create table PXO (
   OCNUMERO             CHAR(9)              not null,
   PROCODIGO            CHAR(9)              not null,
   PXCCANTIDAD          NUMERIC(9,2)         not null,
   PXCVALOR             NUMERIC(7,2)         not null,
   PXCSUBTOTAL          NUMERIC(9,2)         not null,
   PXCSTATUS            CHAR(3)              not null,
   constraint PK_PXO primary key (OCNUMERO, PROCODIGO)
);

/*==============================================================*/
/* Table: PXS                                                   */
/*==============================================================*/
create table PXS (
   SALCODIGO            INT4                 not null,
   PROCODIGO            CHAR(9)              not null,
   PXSCANTIDAD          NUMERIC(9,2)         not null,
   constraint PK_PXS primary key (SALCODIGO, PROCODIGO)
);

/*==============================================================*/
/* Table: SALIDAS                                               */
/*==============================================================*/
create table SALIDAS (
   SALCODIGO            SERIAL               not null,
   EMPCODIGO            CHAR(7)              not null,
   SALDESCRIPCION       CHAR(30)             not null,
   SALFECHA             DATE                 not null,
   SALCANTIDADTOTAL     NUMERIC(9,2)         null,
   SALREFERENCIA        CHAR(60)             null,
   constraint PK_SALIDAS primary key (SALCODIGO)
);

/*==============================================================*/
/* CONSTRAINTS foreing KEYS                                     */
/*==============================================================*/

alter table AJUSTES
   add constraint FK_AJUSTES_AUTORIZA_EMPLEADO foreign key (EMPCODIGO)
      references EMPLEADOS (EMPCODIGO)
      on delete restrict on update restrict;

alter table BXN
   add constraint FK_BXN_BXN_NOMINAS foreign key (NOMCODIGO)
      references NOMINAS (NOMCODIGO)
      on delete restrict on update restrict;

alter table BXN
   add constraint FK_BXN_BXN2_BONIFICA foreign key (BONCODIGO)
      references BONIFICACIONES (BONCODIGO)
      on delete restrict on update restrict;

alter table COMPRAS
   add constraint FK_COMPRAS_PROVEE_PROVEEDO foreign key (PRVCODIGO)
      references PROVEEDORES (PRVCODIGO)
      on delete restrict on update restrict;

alter table DXN
   add constraint FK_DXN_DXN_DESCUENT foreign key (DESCODIGO)
      references DESCUENTOS (DESCODIGO)
      on delete restrict on update restrict;

alter table DXN
   add constraint FK_DXN_DXN2_NOMINAS foreign key (NOMCODIGO)
      references NOMINAS (NOMCODIGO)
      on delete restrict on update restrict;

alter table FACTURAS
   add constraint FK_FACTURAS_ADQUIERE_CLIENTES foreign key (CLICODIGO)
      references CLIENTES (CLICODIGO)
      on delete restrict on update restrict;

alter table INGRESOS
   add constraint FK_INGRESOS_RESPONDEX_EMPLEADO foreign key (EMPCODIGO)
      references EMPLEADOS (EMPCODIGO)
      on delete restrict on update restrict;

alter table NOMINAS
   add constraint FK_NOMINAS_MANTIENE_EMPLEADO foreign key (EMPCODIGO)
      references EMPLEADOS (EMPCODIGO)
      on delete restrict on update restrict;

alter table PXA
   add constraint FK_PXA_PXA_PRODUCTO foreign key (PROCODIGO)
      references PRODUCTOS (PROCODIGO)
      on delete restrict on update restrict;

alter table PXA
   add constraint FK_PXA_PXA2_AJUSTES foreign key (AJUCODIGO)
      references AJUSTES (AJUCODIGO)
      on delete restrict on update restrict;

alter table PXF
   add constraint FK_PXF_PXF_PRODUCTO foreign key (PROCODIGO)
      references PRODUCTOS (PROCODIGO)
      on delete restrict on update restrict;

alter table PXF
   add constraint FK_PXF_PXF2_FACTURAS foreign key (FACNUMERO)
      references FACTURAS (FACNUMERO)
      on delete restrict on update restrict;

alter table PXI
   add constraint FK_PXI_PXI_PRODUCTO foreign key (PROCODIGO)
      references PRODUCTOS (PROCODIGO)
      on delete restrict on update restrict;

alter table PXI
   add constraint FK_PXI_PXI2_INGRESOS foreign key (INGCODIGO)
      references INGRESOS (INGCODIGO)
      on delete restrict on update restrict;

alter table PXO
   add constraint FK_PXO_PXO_PRODUCTO foreign key (PROCODIGO)
      references PRODUCTOS (PROCODIGO)
      on delete restrict on update restrict;

alter table PXO
   add constraint FK_PXO_PXO2_COMPRAS foreign key (OCNUMERO)
      references COMPRAS (OCNUMERO)
      on delete restrict on update restrict;

alter table PXS
   add constraint FK_PXS_PXS_PRODUCTO foreign key (PROCODIGO)
      references PRODUCTOS (PROCODIGO)
      on delete restrict on update restrict;

alter table PXS
   add constraint FK_PXS_PXS2_SALIDAS foreign key (SALCODIGO)
      references SALIDAS (SALCODIGO)
      on delete restrict on update restrict;

alter table SALIDAS
   add constraint FK_SALIDAS_DISPONE_EMPLEADO foreign key (EMPCODIGO)
      references EMPLEADOS (EMPCODIGO)
      on delete restrict on update restrict;

/*==============================================================*/
/* CREATE UNIQUE Index                                          */
/*==============================================================*/
create unique index AJUSTES_PK on AJUSTES (AJUCODIGO);
create unique index SALIDAS_PK on SALIDAS (SALCODIGO);
create unique index PXS_PK on PXS (SALCODIGO, PROCODIGO);
create unique index PXO_PK on PXO (OCNUMERO, PROCODIGO);
create unique index PXI_PK on PXI (INGCODIGO,PROCODIGO);
create unique index PXF_PK on PXF (FACNUMERO,PROCODIGO);
create unique index BONIFICACIONES_PK on BONIFICACIONES (BONCODIGO);
create unique index PXA_PK on PXA (AJUCODIGO,PROCODIGO);
create unique index PROVEEDORES_PK on PROVEEDORES (PRVCODIGO);
create unique index PRODUCTOS_PK on PRODUCTOS (PROCODIGO);
create unique index NOMINAS_PK on NOMINAS (NOMCODIGO);
create unique index INGRESOS_PK on INGRESOS (INGCODIGO);
create unique index FACTURAS_PK on FACTURAS (FACNUMERO);
create unique index EMPLEADOS_PK on EMPLEADOS (EMPCODIGO);
create unique index BXN_PK on BXN (BONCODIGO,NOMCODIGO);
create unique index CLIENTES_PK on CLIENTES (CLICODIGO);
create unique index COMPRAS_PK on COMPRAS (OCNUMERO);
create unique index DESCUENTOS_PK on DESCUENTOS (DESCODIGO);
create unique index DXN_PK on DXN (NOMCODIGO,DESCODIGO);


/*==============================================================*/
/* CREATE Index                                                 */
/*==============================================================*/
create  index AUTORIZA_FK on AJUSTES (EMPCODIGO);
create  index DISPONE_FK on SALIDAS (EMPCODIGO);
create  index PXS2_FK on PXS (SALCODIGO);
create  index PXS_FK on PXS (PROCODIGO);
create  index PXO2_FK on PXO (OCNUMERO);
create  index PXO_FK on PXO (PROCODIGO);
create  index PXI2_FK on PXI (INGCODIGO);
create  index PXI_FK on PXI (PROCODIGO);
create  index PXF2_FK on PXF (FACNUMERO);
create  index PXF_FK on PXF (PROCODIGO);
create  index PXA2_FK on PXA (AJUCODIGO);
create  index PXA_FK on PXA (PROCODIGO);
create  index MANTIENE_FK on NOMINAS (EMPCODIGO);
create  index RESPONDEX_FK on INGRESOS (EMPCODIGO);
create  index ADQUIERE_FK on FACTURAS (CLICODIGO);
create  index BXN2_FK on BXN (BONCODIGO);
create  index BXN_FK on BXN (NOMCODIGO);
create  index PROVEE_FK on COMPRAS (PRVCODIGO);
create  index DXN2_FK on DXN (NOMCODIGO);
create  index DXN_FK on DXN (DESCODIGO);
