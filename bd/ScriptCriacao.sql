/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     04/02/2021 15:09:45                          */
/*==============================================================*/


drop index ALUNO_PK;

drop table ALUNO;

drop index BONIFICACAO_PK;

drop table BONIFICACAO;

drop index CONSULTOR_PK;

drop table CONSULTOR;

drop index RELATIONSHIP_20_FK;

drop index RELATIONSHIP_21_FK;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_14_FK;

drop index CONTRATO_PK;

drop table CONTRATO;

drop index PODE_TER_FK;

drop index CUPOM_PK;

drop table CUPOM;

drop index RELATIONSHIP_19_FK;

drop index RELATIONSHIP_16_FK;

drop index RELATIONSHIP_15_FK;

drop index HISTORICOBONUSCONSULTOR_PK;

drop table HISTORICOBONUSCONSULTOR;

drop index RELATIONSHIP_23_FK;

drop index POSSUI_FK;

drop index RELATIONSHIP_5_FK;

drop index MOVIMENTACAOCONTACONSULTOR_PK;

drop table MOVIMENTACAOCONTACONSULTOR;

drop index RELATIONSHIP_18_FK;

drop index MOVIMENTACAOPAGAMENTO_PK;

drop table MOVIMENTACAOPAGAMENTO;

drop index RELATIONSHIP_22_FK;

drop index RELATIONSHIP_17_FK;

drop index PAGAMENTO_PK;

drop table PAGAMENTO;

drop index PESSOA_PK;

drop table PESSOA;

drop index ESTA_PRESENTE_FK;

drop index PLANO_PK;

drop table PLANO;

drop index SITUACAOCONTRATO_PK;

drop table SITUACAOCONTRATO;

drop index SITUACAOPAGAMENTO_PK;

drop table SITUACAOPAGAMENTO;

drop index SITUACAOPLANO_PK;

drop table SITUACAOPLANO;

drop index TIPOACAOHISTORIO_PK;

drop table TIPOACAOHISTORIO;

drop index TIPOMOVIMENTACAO_PK;

drop table TIPOMOVIMENTACAO;

/*==============================================================*/
/* Table: ALUNO                                                 */
/*==============================================================*/
create table ALUNO (
   IDPESSOA             INT4                 not null,
   NOME                 VARCHAR(255)         not null,
   TELEFONEPRINCIPAL    VARCHAR(15)          null,
   EMAIL                VARCHAR(255)         not null,
   constraint PK_ALUNO primary key (IDPESSOA)
);

/*==============================================================*/
/* Index: ALUNO_PK                                              */
/*==============================================================*/
create unique index ALUNO_PK on ALUNO (
IDPESSOA
);

/*==============================================================*/
/* Table: BONIFICACAO                                           */
/*==============================================================*/
create table BONIFICACAO (
   IDBONIFICACAO        INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   PERCENTUALBONIFICACAO DECIMAL              not null,
   QUANTIDADEMINIMAALUNO INT4                 not null,
   constraint PK_BONIFICACAO primary key (IDBONIFICACAO)
);

/*==============================================================*/
/* Index: BONIFICACAO_PK                                        */
/*==============================================================*/
create unique index BONIFICACAO_PK on BONIFICACAO (
IDBONIFICACAO
);

/*==============================================================*/
/* Table: CONSULTOR                                             */
/*==============================================================*/
create table CONSULTOR (
   IDPESSOA             INT4                 not null,
   NOME                 VARCHAR(255)         not null,
   TELEFONEPRINCIPAL    VARCHAR(15)          not null,
   TELEFONEALTERNATIVO  VARCHAR(15)          null,
   EMAIL                VARCHAR(255)         not null,
   constraint PK_CONSULTOR primary key (IDPESSOA)
);

/*==============================================================*/
/* Index: CONSULTOR_PK                                          */
/*==============================================================*/
create unique index CONSULTOR_PK on CONSULTOR (
IDPESSOA
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   IDCONTRATO           INT4                 not null,
   IDPLANO              INT4                 not null,
   IDPESSOA             INT4                 not null,
   DATAINICIOCONTRATO   DATE                 not null,
   DATAFIMCONTRATO      DATE                 not null,
   MELHORDIAVENCIMENTO  INT4                 not null,
   IDCUPOM              INT4                 null,
   IDSITUACAOCONTRATO   INT4                 not null,
   constraint PK_CONTRATO primary key (IDCONTRATO)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
IDCONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on CONTRATO (
IDPESSOA
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on CONTRATO (
IDPLANO
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on CONTRATO (
IDSITUACAOCONTRATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_20_FK on CONTRATO (
IDCUPOM
);

/*==============================================================*/
/* Table: CUPOM                                                 */
/*==============================================================*/
create table CUPOM (
   IDCUPOM              INT4                 not null,
   IDPESSOA             INT4                 null,
   DESCRICAO            VARCHAR(255)         not null,
   QUANTIDADE           INT4                 null,
   DATAEXPIRACAO        DATE                 null,
   constraint PK_CUPOM primary key (IDCUPOM)
);

/*==============================================================*/
/* Index: CUPOM_PK                                              */
/*==============================================================*/
create unique index CUPOM_PK on CUPOM (
IDCUPOM
);

/*==============================================================*/
/* Index: PODE_TER_FK                                           */
/*==============================================================*/
create  index PODE_TER_FK on CUPOM (
IDPESSOA
);

/*==============================================================*/
/* Table: HISTORICOBONUSCONSULTOR                               */
/*==============================================================*/
create table HISTORICOBONUSCONSULTOR (
   IDPESSOA             INT4                 not null,
   IDBONIFICACAO        INT4                 not null,
   DATA                 DATE                 not null,
   IDTIPOACAO           INT4                 not null,
   constraint PK_HISTORICOBONUSCONSULTOR primary key (IDBONIFICACAO, IDPESSOA, DATA)
);

/*==============================================================*/
/* Index: HISTORICOBONUSCONSULTOR_PK                            */
/*==============================================================*/
create unique index HISTORICOBONUSCONSULTOR_PK on HISTORICOBONUSCONSULTOR (
IDBONIFICACAO,
IDPESSOA,
DATA
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on HISTORICOBONUSCONSULTOR (
IDPESSOA
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on HISTORICOBONUSCONSULTOR (
IDBONIFICACAO
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_19_FK on HISTORICOBONUSCONSULTOR (
IDTIPOACAO
);

/*==============================================================*/
/* Table: MOVIMENTACAOCONTACONSULTOR                            */
/*==============================================================*/
create table MOVIMENTACAOCONTACONSULTOR (
   IDMOVIMENTACAOCONTACONSULTOR INT4                 not null,
   IDMOVIMENTACAOPAGAMENTO INT4                 null,
   IDPESSOA             INT4                 not null,
   DESCRICAO            VARCHAR(255)         null,
   DATA                 DATE                 null,
   IDTIPOMOVIMENTACAO   INT4                 not null,
   VALOR                NUMERIC(15,6)        null,
   constraint PK_MOVIMENTACAOCONTACONSULTOR primary key (IDMOVIMENTACAOCONTACONSULTOR)
);

/*==============================================================*/
/* Index: MOVIMENTACAOCONTACONSULTOR_PK                         */
/*==============================================================*/
create unique index MOVIMENTACAOCONTACONSULTOR_PK on MOVIMENTACAOCONTACONSULTOR (
IDMOVIMENTACAOCONTACONSULTOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on MOVIMENTACAOCONTACONSULTOR (
IDPESSOA
);

/*==============================================================*/
/* Index: POSSUI_FK                                             */
/*==============================================================*/
create  index POSSUI_FK on MOVIMENTACAOCONTACONSULTOR (
IDTIPOMOVIMENTACAO
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_23_FK on MOVIMENTACAOCONTACONSULTOR (
IDMOVIMENTACAOPAGAMENTO
);

/*==============================================================*/
/* Table: MOVIMENTACAOPAGAMENTO                                 */
/*==============================================================*/
create table MOVIMENTACAOPAGAMENTO (
   IDMOVIMENTACAOPAGAMENTO INT4                 not null,
   IDPAGAMENTO          INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   DATA                 DATE                 not null,
   VALOR                NUMERIC(15,6)        not null,
   constraint PK_MOVIMENTACAOPAGAMENTO primary key (IDMOVIMENTACAOPAGAMENTO)
);

/*==============================================================*/
/* Index: MOVIMENTACAOPAGAMENTO_PK                              */
/*==============================================================*/
create unique index MOVIMENTACAOPAGAMENTO_PK on MOVIMENTACAOPAGAMENTO (
IDMOVIMENTACAOPAGAMENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on MOVIMENTACAOPAGAMENTO (
IDPAGAMENTO
);

/*==============================================================*/
/* Table: PAGAMENTO                                             */
/*==============================================================*/
create table PAGAMENTO (
   IDPAGAMENTO          INT4                 not null,
   IDCONTRATO           INT4                 not null,
   IDSITUACAOPAGAMENTO  INT4                 not null,
   DATAVENCIMENTO       DATE                 not null,
   DATAPAGAMENTO        DATE                 not null,
   VALOR                NUMERIC(15,6)        not null,
   constraint PK_PAGAMENTO primary key (IDPAGAMENTO)
);

/*==============================================================*/
/* Index: PAGAMENTO_PK                                          */
/*==============================================================*/
create unique index PAGAMENTO_PK on PAGAMENTO (
IDPAGAMENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on PAGAMENTO (
IDSITUACAOPAGAMENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_22_FK on PAGAMENTO (
IDCONTRATO
);

/*==============================================================*/
/* Table: PESSOA                                                */
/*==============================================================*/
create table PESSOA (
   IDPESSOA             INT4                 not null,
   constraint PK_PESSOA primary key (IDPESSOA)
);

/*==============================================================*/
/* Index: PESSOA_PK                                             */
/*==============================================================*/
create unique index PESSOA_PK on PESSOA (
IDPESSOA
);

/*==============================================================*/
/* Table: PLANO                                                 */
/*==============================================================*/
create table PLANO (
   IDPLANO              INT4                 not null,
   IDSITUACAO           INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   DATACRIACAO          DATE                 not null,
   VALOR                NUMERIC              not null,
   constraint PK_PLANO primary key (IDPLANO)
);

/*==============================================================*/
/* Index: PLANO_PK                                              */
/*==============================================================*/
create unique index PLANO_PK on PLANO (
IDPLANO
);

/*==============================================================*/
/* Index: ESTA_PRESENTE_FK                                      */
/*==============================================================*/
create  index ESTA_PRESENTE_FK on PLANO (
IDSITUACAO
);

/*==============================================================*/
/* Table: SITUACAOCONTRATO                                      */
/*==============================================================*/
create table SITUACAOCONTRATO (
   IDSITUACAOCONTRATO   INT4                 not null,
   DESCRICAO            VARCHAR(255)         null,
   constraint PK_SITUACAOCONTRATO primary key (IDSITUACAOCONTRATO)
);

/*==============================================================*/
/* Index: SITUACAOCONTRATO_PK                                   */
/*==============================================================*/
create unique index SITUACAOCONTRATO_PK on SITUACAOCONTRATO (
IDSITUACAOCONTRATO
);

/*==============================================================*/
/* Table: SITUACAOPAGAMENTO                                     */
/*==============================================================*/
create table SITUACAOPAGAMENTO (
   IDSITUACAOPAGAMENTO  INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   constraint PK_SITUACAOPAGAMENTO primary key (IDSITUACAOPAGAMENTO)
);

/*==============================================================*/
/* Index: SITUACAOPAGAMENTO_PK                                  */
/*==============================================================*/
create unique index SITUACAOPAGAMENTO_PK on SITUACAOPAGAMENTO (
IDSITUACAOPAGAMENTO
);

/*==============================================================*/
/* Table: SITUACAOPLANO                                         */
/*==============================================================*/
create table SITUACAOPLANO (
   IDSITUACAO           INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   constraint PK_SITUACAOPLANO primary key (IDSITUACAO)
);

/*==============================================================*/
/* Index: SITUACAOPLANO_PK                                      */
/*==============================================================*/
create unique index SITUACAOPLANO_PK on SITUACAOPLANO (
IDSITUACAO
);

/*==============================================================*/
/* Table: TIPOACAOHISTORIO                                      */
/*==============================================================*/
create table TIPOACAOHISTORIO (
   IDTIPOACAO           INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   constraint PK_TIPOACAOHISTORIO primary key (IDTIPOACAO)
);

/*==============================================================*/
/* Index: TIPOACAOHISTORIO_PK                                   */
/*==============================================================*/
create unique index TIPOACAOHISTORIO_PK on TIPOACAOHISTORIO (
IDTIPOACAO
);

/*==============================================================*/
/* Table: TIPOMOVIMENTACAO                                      */
/*==============================================================*/
create table TIPOMOVIMENTACAO (
   IDTIPOMOVIMENTACAO   INT4                 not null,
   DESCRICAO            VARCHAR(255)         not null,
   constraint PK_TIPOMOVIMENTACAO primary key (IDTIPOMOVIMENTACAO)
);

/*==============================================================*/
/* Index: TIPOMOVIMENTACAO_PK                                   */
/*==============================================================*/
create unique index TIPOMOVIMENTACAO_PK on TIPOMOVIMENTACAO (
IDTIPOMOVIMENTACAO
);

alter table ALUNO
   add constraint FK_ALUNO_TIPO_PESSOA foreign key (IDPESSOA)
      references PESSOA (IDPESSOA)
      on delete restrict on update restrict;

alter table CONSULTOR
   add constraint FK_CONSULTO_TIPO2_PESSOA foreign key (IDPESSOA)
      references PESSOA (IDPESSOA)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_PLANO foreign key (IDPLANO)
      references PLANO (IDPLANO)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_ALUNO foreign key (IDPESSOA)
      references ALUNO (IDPESSOA)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_CUPOM foreign key (IDCUPOM)
      references CUPOM (IDCUPOM)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_RELATIONS_SITUACAO foreign key (IDSITUACAOCONTRATO)
      references SITUACAOCONTRATO (IDSITUACAOCONTRATO)
      on delete restrict on update restrict;

alter table CUPOM
   add constraint FK_CUPOM_PODE_TER_PESSOA foreign key (IDPESSOA)
      references PESSOA (IDPESSOA)
      on delete restrict on update restrict;

alter table HISTORICOBONUSCONSULTOR
   add constraint FK_HISTORIC_RELATIONS_CONSULTO foreign key (IDPESSOA)
      references CONSULTOR (IDPESSOA)
      on delete restrict on update restrict;

alter table HISTORICOBONUSCONSULTOR
   add constraint FK_HISTORIC_RELATIONS_BONIFICA foreign key (IDBONIFICACAO)
      references BONIFICACAO (IDBONIFICACAO)
      on delete restrict on update restrict;

alter table HISTORICOBONUSCONSULTOR
   add constraint FK_HISTORIC_RELATIONS_TIPOACAO foreign key (IDTIPOACAO)
      references TIPOACAOHISTORIO (IDTIPOACAO)
      on delete restrict on update restrict;

alter table MOVIMENTACAOCONTACONSULTOR
   add constraint FK_MOVIMENT_POSSUI_TIPOMOVI foreign key (IDTIPOMOVIMENTACAO)
      references TIPOMOVIMENTACAO (IDTIPOMOVIMENTACAO)
      on delete restrict on update restrict;

alter table MOVIMENTACAOCONTACONSULTOR
   add constraint FK_MOVIMENT_RELATIONS_MOVIMENT foreign key (IDMOVIMENTACAOPAGAMENTO)
      references MOVIMENTACAOPAGAMENTO (IDMOVIMENTACAOPAGAMENTO)
      on delete restrict on update restrict;

alter table MOVIMENTACAOCONTACONSULTOR
   add constraint FK_MOVIMENT_RELATIONS_CONSULTO foreign key (IDPESSOA)
      references CONSULTOR (IDPESSOA)
      on delete restrict on update restrict;

alter table MOVIMENTACAOPAGAMENTO
   add constraint FK_MOVIMENT_RELATIONS_PAGAMENT foreign key (IDPAGAMENTO)
      references PAGAMENTO (IDPAGAMENTO)
      on delete restrict on update restrict;

alter table PAGAMENTO
   add constraint FK_PAGAMENT_RELATIONS_SITUACAO foreign key (IDSITUACAOPAGAMENTO)
      references SITUACAOPAGAMENTO (IDSITUACAOPAGAMENTO)
      on delete restrict on update restrict;

alter table PAGAMENTO
   add constraint FK_PAGAMENT_RELATIONS_CONTRATO foreign key (IDCONTRATO)
      references CONTRATO (IDCONTRATO)
      on delete restrict on update restrict;

alter table PLANO
   add constraint FK_PLANO_ESTA_PRES_SITUACAO foreign key (IDSITUACAO)
      references SITUACAOPLANO (IDSITUACAO)
      on delete restrict on update restrict;

