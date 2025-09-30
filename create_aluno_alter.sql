create table Aluno (
  nr_rgm number(8),
  nm_nome varchar2(40),
  nm_pai varchar2(40),
  nm_mae varchar2(40),
  dt_nascimento date,
  id_sexo char(1)
);

alter table Aluno add constraint aluno_nr_rgm_pk primary key (nr_rgm);
alter table Aluno add constraint aluno_nm_nome_ck check (nm_nome is not null);
alter table Aluno add constraint aluno_nm_pai_ck check (nm_pai is not null);
alter table Aluno add constraint aluno_nm_mae_ck check (nm_mae is not null);
alter table Aluno add constraint aluno_dt_nascimento_ck check (dt_nascimento is not null);
alter table Aluno add constraint aluno_id_sexo_ck check (id_sexo in ('M','F'));


create table Grau (
    cd_grau number(2),
    nm_grau varchar2(50)
);

alter table Grau add constraint grau_cd_grau_pk primary key (cd_grau);
alter table Grau add constraint grau_nm_grau_ck check (nm_grau is not null);


create table Periodo (
    cd_periodo number(2),
    nm_periodo varchar2(50)
);

alter table Periodo add constraint periodo_cd_periodo_pk primary key (cd_periodo);
alter table Periodo add constraint periodo_nm_periodo_ck check (nm_periodo is not null);


create table Escola (
    cd_escola number(6),
    nm_escola varchar2(50),
    ds_endereco varchar2(50),
    ds_bairro varchar2(40)
);

alter table Escola add constraint escola_cd_escola_pk primary key (cd_escola);
alter table Escola add constraint escola_nm_escola_ck check (nm_escola is not null);
alter table Escola add constraint escola_ds_endereco_ck check (ds_endereco is not null);
alter table Escola add constraint escola_ds_bairro_ck check (ds_bairro is not null);


create table Classe (
    cd_classe number(8),
    nr_anoletivo number(4),
    cd_escola number(6),
    cd_grau number(2),
    nr_serie varchar2(2),
    sg_turma varchar2(2),
    cd_periodo number(2)
);

alter table Classe add constraint classe_cd_classe_pk primary key (cd_classe);
alter table Classe add constraint classe_nr_anoletivo_ck check (nr_anoletivo is not null and nr_anoletivo > 2000);
alter table Classe add constraint classe_sg_turma_ck check (sg_turma is not null);
alter table Classe add constraint classe_cd_escola_fk foreign key (cd_escola) references Escola(cd_escola);
alter table Classe add constraint classe_cd_grau_fk foreign key (cd_grau) references Grau(cd_grau);
alter table Classe add constraint classe_cd_periodo_fk foreign key (cd_periodo) references Periodo(cd_periodo);


create table Matricula (
    nr_rgm number(8),
    cd_classe number(8),
    dt_matricula date
);

alter table Matricula add constraint matricula_pk primary key (nr_rgm, cd_classe);
alter table Matricula add constraint matricula_dt_matricula_ck check (dt_matricula is not null);
alter table Matricula add constraint matricula_nr_rgm_fk foreign key (nr_rgm) references Aluno(nr_rgm);
alter table Matricula add constraint matricula_cd_classe_fk foreign key (cd_classe) references Classe(cd_classe);
