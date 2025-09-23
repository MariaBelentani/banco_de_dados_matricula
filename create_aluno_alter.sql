create table Aluno (
  nr_rgm number(8),
  nm_nome varchar2(40),
  nm_pai varchar2(40),
  nm_mae varchar2(40),
  dt_nascimento date,
  id_sexo char(1)
);

alter table Aluno
add CONSTRAINT aluno_nr_rgm_pk primary key (nr_rgm)

alter table Aluno
add CONSTRAINT aluno_nm_nome check (nm_nome is not null)

alter table Aluno 
add constraint aluno_dt_nascimento check (dt_nascimento is not null)

alter table Aluno
add constraint aluno_id_sexo_ck check (id_sexo in ('M', 'F'))

alter table Aluno
add constraint aluno_nm_pai_ck check (nm_pai is not null)

alter table Aluno 
add constraint aluno_nm_mae_ck check (nm_mae is not null)


create table Matricula (
    nr_rgm number(8),
    cd_classe number(8),
    dt_matricula DATE
);


create table Classe (
    cd_classe number(8),
    nr_anoletivo number(4),
    cd_escola number(6),
    cd_grau number(2),
    nr_serie varchar2(2) not null,
    sg_turma varchar2(2) not null,
    cd_periodo number(2)
);

alter table Classe 
add constraint classe_cd_classe_pk primary KEY (cd_classe)

alter table Matricula 
add constraint matricula_nr_rgm_fk foreign key (nr_rgm) references Aluno(nr_rgm)

alter table Matricula
add constraint matricula_dt_matricula check (dt_matricula is not null)


create table Grau (
    cd_grau number(2) primary key,
    nm_grau varchar2(50) not null

);

alter table Classe  
add constraint classe_cd_grau_fk FOREIGN key (cd_grau) references Grau(cd_grau)

alter table Grau 
add constraint grau_nm_grau check (nm_grau is not null)


create table Periodo (
    cd_periodo number(2),
    nm_periodo varchar2(50)
);

alter table Classe
add constraint classe_cd_periodo_uk unique (cd_periodo)

alter table Periodo
add constraint periodo_cd_periodo_fk foreign key (cd_periodo) REFERENCES Classe(cd_periodo)


create table Escola (
    cd_escola number(6) primary key,
    nm_escola varchar2(50) not null,
    ds_endereco varchar2(50) not null,
    ds_bairro date not null
);


DESC Aluno
DESC Matricula
DESC Classe
DESC Grau 
DESC Periodo

ALTER TABLE Periodo
MODIFY (nm_periodo VARCHAR2(40) NOT NULL);

alter table Aluno 
MODIFY(nm_mae not null)

alter table Aluno 
modify (nm_pai not null)

alter TABLE Aluno 
modify (dt_nascimento not null)

alter table Aluno 
modify (id_sexo not null)

alter table Aluno 
modify (nm_nome not null)

DESC Classe 

alter table Classe
modify (nr_anoletivo not null)

alter table Classe 
add CONSTRAINT classe_nr_anoletivo_ck check (nr_anoletivo > 2000)

alter table Matricula 
MODIFY(dt_matricula not null)
DESC Matricula 

DESC Escola 
DESC Grau 
DESC Periodo 

alter table Periodo 
add constraint cd_periodo_pk primary key (cd_periodo)

alter table Escola 
add constraint escola_cd_escola_fk FOREIGN key (cd_escola) references Classe(cd_escola)

alter table Escola 
add constraint escola_cd_escola_uk unique (cd_escola)


ALTER TABLE Escola
ADD CONSTRAINT escola_cd_escola_fk
FOREIGN KEY (cd_escola) REFERENCES Classe(cd_escola);


alter table Classe 
add constraint classe_cd_escola_fk FOREIGN key (cd_escola) references Escola(cd_escola)

alter table Matricula 
add constraint matricula_cd_classe_fk foreign key (cd_classe) references Classe(cd_classe)