/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  14/11/2024 09:34:07                      */
/*==============================================================*/


drop table if exists EST_INSCRIT;

drop table if exists ETR;

drop table if exists ETUDIANT;

drop table if exists FAIRE;

drop table if exists FORMATION;

drop table if exists NIVEAU;

drop table if exists SESSION;

drop table if exists SPECIALITE;

drop table if exists VILLE;

/*==============================================================*/
/* Table : EST_INSCRIT                                          */
/*==============================================================*/
create table EST_INSCRIT
(
   NUMCINETU            char(10) not null,
   CODESESS             int not null,
   TYPE_COURS           longtext,
   primary key (NUMCINETU, CODESESS)
);

/*==============================================================*/
/* Table : ETR                                                  */
/*==============================================================*/
create table ETR
(
   CODEFORM             smallint not null,
   CODESPEC             int not null,
   primary key (CODEFORM, CODESPEC)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT
(
   NUMCINETU            char(10) not null,
   CODEVIL              int not null,
   NOMETU               longtext,
   PRENOMETU            longtext,
   DATEE_NAISSANCE      date,
   ADRESSEETU           text,
   NIVEAU               text,
   primary key (NUMCINETU)
);

/*==============================================================*/
/* Table : FAIRE                                                */
/*==============================================================*/
create table FAIRE
(
   ID_NI                int not null,
   NUMCINETU            char(10) not null,
   DATE                 date,
   primary key (ID_NI, NUMCINETU)
);

/*==============================================================*/
/* Table : FORMATION                                            */
/*==============================================================*/
create table FORMATION
(
   CODEFORM             smallint not null,
   TITREFORM            text,
   DURERFORM            time,
   PRIXFORM             bigint,
   primary key (CODEFORM)
);

/*==============================================================*/
/* Table : NIVEAU                                               */
/*==============================================================*/
create table NIVEAU
(
   ID_NI                int not null,
   LIBELLE              varchar(15),
   primary key (ID_NI)
);

/*==============================================================*/
/* Table : SESSION                                              */
/*==============================================================*/
create table SESSION
(
   CODESESS             int not null,
   CODEFORM             smallint not null,
   NOMSESS              longtext,
   DATE_DEBUT           date,
   DATE_FIN             date,
   primary key (CODESESS)
);

/*==============================================================*/
/* Table : SPECIALITE                                           */
/*==============================================================*/
create table SPECIALITE
(
   CODESPEC             int not null,
   NOMSPEC              longtext,
   DESCSPEC             text,
   primary key (CODESPEC)
);

/*==============================================================*/
/* Table : VILLE                                                */
/*==============================================================*/
create table VILLE
(
   CODEVIL              int not null,
   NOMVIL               text,
   primary key (CODEVIL)
);

alter table EST_INSCRIT add constraint FK_EST_INSCRIT foreign key (CODESESS)
      references SESSION (CODESESS) on delete restrict on update restrict;

alter table EST_INSCRIT add constraint FK_EST_INSCRIT2 foreign key (NUMCINETU)
      references ETUDIANT (NUMCINETU) on delete restrict on update restrict;

alter table ETR add constraint FK_ETR foreign key (CODESPEC)
      references SPECIALITE (CODESPEC) on delete restrict on update restrict;

alter table ETR add constraint FK_ETR2 foreign key (CODEFORM)
      references FORMATION (CODEFORM) on delete restrict on update restrict;

alter table ETUDIANT add constraint FK_ETRE foreign key (CODEVIL)
      references VILLE (CODEVIL) on delete restrict on update restrict;

alter table FAIRE add constraint FK_FAIRE foreign key (NUMCINETU)
      references ETUDIANT (NUMCINETU) on delete restrict on update restrict;

alter table FAIRE add constraint FK_FAIRE2 foreign key (ID_NI)
      references NIVEAU (ID_NI) on delete restrict on update restrict;

alter table SESSION add constraint FK_CONCERNE foreign key (CODEFORM)
      references FORMATION (CODEFORM) on delete restrict on update restrict;

