/*DROP TABLES*/
/*
DROP TABLE t_baze_bike CASCADE CONSTRAINTS;
DROP TABLE t_baze_bike_eletrica CASCADE CONSTRAINTS;
DROP TABLE t_baze_corrida CASCADE CONSTRAINTS;
DROP TABLE t_baze_desafio CASCADE CONSTRAINTS;
DROP TABLE t_baze_ender_usuario CASCADE CONSTRAINTS;
DROP TABLE t_baze_registro CASCADE CONSTRAINTS;
DROP TABLE t_baze_telefone_usuario CASCADE CONSTRAINTS;
DROP TABLE t_baze_usuario CASCADE CONSTRAINTS;
*/

CREATE TABLE t_baze_usuario (
    id_usuario CHAR(10) NOT NULL,
    nr_rg      VARCHAR2(12) NOT NULL,
    nr_cpf     VARCHAR2(14) NOT NULL,
    nm_email   VARCHAR2(60) NOT NULL,
    nm_usuario VARCHAR2(50) NOT NULL,
    nr_idade   NUMBER(10) NOT NULL,
    nr_peso    NUMBER(10) NOT NULL,
    nr_altura  NUMBER(10) NOT NULL,
    st_cliente CHAR(1) NOT NULL,
    tp_genero  CHAR(1) NOT NULL,
    nm_login   VARCHAR2(60) NOT NULL,
    nm_senha   VARCHAR2(60) NOT NULL
);

ALTER TABLE t_baze_usuario
    ADD CONSTRAINT ck_st_cliente CHECK ( st_cliente IN ( 'A', 'I' ) );

ALTER TABLE t_baze_usuario
    ADD CONSTRAINT ck_tp_genero CHECK ( tp_genero IN ( 'F', 'M', 'O' ) );

COMMENT ON COLUMN t_baze_usuario.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_usuario.nr_rg IS
    'Esse atributo recebe o numero do RG do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_usuario.nr_cpf IS
    'Esse atributo recebe o numero do cpf do cliente. É preenchido por ele e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_usuario.nm_email IS
    'Esse atributo recebe o email do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_usuario.nm_usuario IS
    'Esse atributo recebe o nome do cliente. É preenchido pelo cliente na plataforma e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_usuario.nr_idade IS
    'Esse atributo recebe a idade do cliente. É preeenchido pelo próprio e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_usuario.nr_peso IS
    'Esse atributo recebe o peso do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_usuario.nr_altura IS
    'Esse atributo recebe a altura do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_usuario.st_cliente IS
    'Esse atributo recebe o status do cliente. É preenchido automaticamente pelo sistema e indica se o cliente esta Inativo (I) ou Ativo(A).Recebe o padrão CHAR.'
    ;

ALTER TABLE t_baze_usuario ADD CONSTRAINT t_baze_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE t_baze_usuario
    ADD CONSTRAINT t_baze_usuario__un UNIQUE ( nr_rg,
                                               nr_cpf,
                                               nm_email );

CREATE TABLE t_baze_telefone_usuario (
    id_usuario          CHAR(10) NOT NULL,
    id_telefone_usuario CHAR(10) NOT NULL,
    nr_telefone         VARCHAR2(10) NOT NULL,
    nr_ddd              NUMBER(3) NOT NULL,
    nr_ddi              NUMBER(9) NOT NULL
);

COMMENT ON COLUMN t_baze_telefone_usuario.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_telefone_usuario.id_telefone_usuario IS
    'Esse atributo recebe o ID do telefone do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_telefone_usuario.nr_telefone IS
    'Esse atributo recebe o numero do telefone do cliente. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_telefone_usuario.nr_ddd IS
    'Esse atributo recebe o numero do DDD do cliente. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_telefone_usuario.nr_ddi IS
    'Esse atributo recebe o numero do DDI do cliente. É preenchido pelo cliente e recebe o padrão NUMERIC.';

ALTER TABLE t_baze_telefone_usuario ADD CONSTRAINT t_baze_telefone_usuario_pk PRIMARY KEY ( id_usuario,
                                                                                            id_telefone_usuario );

CREATE TABLE t_baze_ender_usuario (
    id_usuario       CHAR(10) NOT NULL,
    id_ender_usuario CHAR(10) NOT NULL,
    nm_logradouro    VARCHAR2(200) NOT NULL,
    nr_logradouro    NUMBER(5) NOT NULL,
    nm_cidade        VARCHAR2(80) NOT NULL,
    nm_bairro        VARCHAR2(80) NOT NULL,
    nm_pais          VARCHAR2(50) NOT NULL,
    nr_cep           VARCHAR2(9) NOT NULL,
    ds_complemento   VARCHAR2(100)
);

COMMENT ON COLUMN t_baze_ender_usuario.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_ender_usuario.id_ender_usuario IS
    'Esse atributo recebe o ID do endereço do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_ender_usuario.nm_logradouro IS
    'Esse atributo recebe o endereço do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_ender_usuario.nr_logradouro IS
    'Esse atributo recebe o numero do logradouro do cliente. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_ender_usuario.nm_cidade IS
    'Esse atributo recebe o nome da cidade do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2. ';

COMMENT ON COLUMN t_baze_ender_usuario.nm_bairro IS
    'Esse atributo recebe o nome do bairro do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_ender_usuario.nm_pais IS
    'Esse atributo recebe o nome do pais do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_ender_usuario.nr_cep IS
    'Esse atributo recebe o numero do cep do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_ender_usuario.ds_complemento IS
    'Esse atributo recebe o complemento do endereço do cliente. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

ALTER TABLE t_baze_ender_usuario ADD CONSTRAINT t_baze_ender_usuario_pk PRIMARY KEY ( id_ender_usuario,
                                                                                      id_usuario );

CREATE TABLE t_baze_bike (
    id_usuario CHAR(10) NOT NULL,
    id_bike    CHAR(10) NOT NULL,
    nr_aro     VARCHAR2(10) NOT NULL,
    nr_quadro  NUMBER(10) NOT NULL,
    nr_peso    CHAR(2) NOT NULL,
    nm_cor     VARCHAR2(50) NOT NULL,
    nm_tipo    VARCHAR2(50) NOT NULL,
    nr_marcha  NUMBER(10) NOT NULL
);

ALTER TABLE t_baze_bike
    ADD CONSTRAINT ck_nr_peso CHECK ( nr_peso IN ( 'L', 'M', 'ML', 'MP', 'P' ) );

COMMENT ON COLUMN t_baze_bike.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_bike.id_bike IS
    'Esse atributo recebe o ID da bike. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_bike.nr_aro IS
    'Esse atributo recebe o tamanho do aro da bike. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_bike.nr_quadro IS
    'Esse atributo recebe o tamanho do quadro da bike. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_bike.nr_peso IS
    'Esse atributo recebe o peso da bike. É preenchido pelo cliente e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_bike.nm_cor IS
    'Esse atributo recebe a cor da bike. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_bike.nm_tipo IS
    'Esse atributo recebe o tipo da bike. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_bike.nr_marcha IS
    'Esse atributo recebe a quantidade de marchas da bike. É preenchido pelo cliente e recebe o padrão NUMERIC.';

ALTER TABLE t_baze_bike ADD CONSTRAINT t_baze_bike_pk PRIMARY KEY ( id_bike,
                                                                    id_usuario );

CREATE TABLE t_baze_bike_eletrica (
    id_usuario         CHAR(10) NOT NULL,
    id_bike_eletrica   CHAR(10) NOT NULL,
    nr_amperes_bateria NUMBER(4) NOT NULL,
    nm_motor           VARCHAR2(50) NOT NULL,
    nr_aro             VARCHAR2(10) NOT NULL,
    nr_quadro          NUMBER(10) NOT NULL,
    nm_cor             VARCHAR2(50) NOT NULL,
    nr_peso            CHAR(2) NOT NULL
);

ALTER TABLE t_baze_bike_eletrica
    ADD CONSTRAINT ck_nr_peso_elec CHECK ( nr_peso IN ( 'L', 'M', 'ML', 'MP', 'P' ) );

COMMENT ON COLUMN t_baze_bike_eletrica.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_bike_eletrica.id_bike_eletrica IS
    'Esse atributo recebe o ID da bike elétrica. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_bike_eletrica.nr_amperes_bateria IS
    'Esse atributo recebe os ampéres da bateria da bike elétrica. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_bike_eletrica.nm_motor IS
    'Esse atributo recebe o nome do motor da bike elétrica. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_bike_eletrica.nr_aro IS
    'Esse atributo recebe o tamanho do aro da bike elétrica. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_bike_eletrica.nr_quadro IS
    'Esse atributo recebe o tamanho do quadro da bike elétrica. É preenchido pelo cliente e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_bike_eletrica.nm_cor IS
    'Esse atributo recebe a cor da bike elétrica. É preenchido pelo cliente e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_bike_eletrica.nr_peso IS
    'Esse atributo recebe o peso da bike elétrica. É preenchido pelo cliente e recebe o padrão NUMERIC.';

ALTER TABLE t_baze_bike_eletrica ADD CONSTRAINT t_baze_bike_eletrica_pk PRIMARY KEY ( id_bike_eletrica,
                                                                                      id_usuario );

CREATE TABLE t_baze_corrida (
    id_usuario CHAR(10) NOT NULL,
    id_corrida CHAR(10) NOT NULL,
    nr_km      NUMBER(10) NOT NULL,
    nr_tempo   NUMBER(10) NOT NULL
);

COMMENT ON COLUMN t_baze_corrida.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_corrida.id_corrida IS
    'Esse atributo recebe o ID da corrida. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_corrida.nr_km IS
    'Esse atributo recebe os quilometros da corrida. É preenchido pelo sistema e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_corrida.nr_tempo IS
    'Esse atributo recebe o tempo da corrida. É preenchido pelo sistema e recebe o padrão NUMERIC.';

ALTER TABLE t_baze_corrida ADD CONSTRAINT t_baze_corrida_pk PRIMARY KEY ( id_corrida,
                                                                          id_usuario );

CREATE TABLE t_baze_desafio (
    id_desafio    CHAR(10) NOT NULL,
    nm_desafio    VARCHAR2(200) NOT NULL,
    ds_desafio    VARCHAR2(400) NOT NULL,
    tm_tempo      VARCHAR2(10) NOT NULL,
    ds_recompensa VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN t_baze_desafio.id_desafio IS
    'Esse atributo recebe o ID do desafio. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_desafio.nm_desafio IS
    'Esse atributo recebe o nome do desafio. É preenchido automaticamente na plataforma e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_desafio.ds_desafio IS
    'Esse atributo recebe a descrição do desafio. É preenchido automaticamente na plataforma e recebe o padrão VARCHAR2.';

COMMENT ON COLUMN t_baze_desafio.tm_tempo IS
    'Esse atributo recebe o tempo da duração do desafio. É preenchido automaticamente na plataforma e recebe o padrão NUMERIC.';

COMMENT ON COLUMN t_baze_desafio.ds_recompensa IS
    'Esse atributo recebe as recompensas de conclusão do desafio. É preenchido automaticamente na plataforma e recebe o padrão VARCHAR.'
    ;

ALTER TABLE t_baze_desafio ADD CONSTRAINT t_baze_desafio_pk PRIMARY KEY ( id_desafio );

CREATE TABLE t_baze_registro (
    id_usuario  CHAR(10) NOT NULL,
    id_desafio  CHAR(10) NOT NULL,
    hr_registro VARCHAR2(10) NOT NULL
);

COMMENT ON COLUMN t_baze_registro.id_usuario IS
    'Esse atributo recebe o ID do cliente. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_registro.id_desafio IS
    'Esse atributo recebe o ID do desafio. É preenchido automaticamente pelo sistema e recebe o padrão CHAR.';

COMMENT ON COLUMN t_baze_registro.hr_registro IS
    'Esse atributo recebe o horário do registro no desafio. É preenchido automaticamente pelo sistema e recebe o padrão NUMERIC.';

ALTER TABLE t_baze_registro ADD CONSTRAINT t_baze_registro_pk PRIMARY KEY ( id_usuario,
                                                                            id_desafio );

ALTER TABLE t_baze_registro
    ADD CONSTRAINT fk_registro_desafio FOREIGN KEY ( id_desafio )
        REFERENCES t_baze_desafio ( id_desafio );

ALTER TABLE t_baze_registro
    ADD CONSTRAINT fk_registro_usuario FOREIGN KEY ( id_usuario )
        REFERENCES t_baze_usuario ( id_usuario );

ALTER TABLE t_baze_bike
    ADD CONSTRAINT fk_usuario_bike FOREIGN KEY ( id_usuario )
        REFERENCES t_baze_usuario ( id_usuario );

ALTER TABLE t_baze_bike_eletrica
    ADD CONSTRAINT fk_usuario_bike_elec FOREIGN KEY ( id_usuario )
        REFERENCES t_baze_usuario ( id_usuario );

ALTER TABLE t_baze_corrida
    ADD CONSTRAINT fk_usuario_corrida FOREIGN KEY ( id_usuario )
        REFERENCES t_baze_usuario ( id_usuario );

ALTER TABLE t_baze_ender_usuario
    ADD CONSTRAINT fk_usuario_ender FOREIGN KEY ( id_usuario )
        REFERENCES t_baze_usuario ( id_usuario );

ALTER TABLE t_baze_telefone_usuario
    ADD CONSTRAINT fk_usuario_phone FOREIGN KEY ( id_usuario )
        REFERENCES t_baze_usuario ( id_usuario );