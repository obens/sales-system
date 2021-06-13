
create database vendas;
\c vendas

/*Empresa  ( cnpj, nome , tele, email,  núm, rua, bairro, cidade, estado)*/

create table empresa(
cnpj  int not null,
nome varchar (30) not null,
tele varchar (20) not null,
email varchar(30) not null,
num varchar (5) not null,
rua varchar (50) not null,
bairro varchar(50) not null,
cidade varchar (50) not null,
estado varchar (30) not null,
Constraint pk_empresa primary key (cnpj));


/*Fornecenecedor ( Sigla, cnpj or cpf, email, telefone, rua, cidade, estado)*/

create table fornecedor(
sigla varchar(30) not null,
cnpj int not null,
cpf int not null,
email varchar(30) not null,
telefone varchar (20) not null,
rua varchar (50) not null,
cidade varchar (50) not null,
estado varchar (30) not null,
constraint pk_fornecedor primary key (sigla)
);

/*Produto ( Codp, nome, descr, tipo, preço, tam, sigla(fornecedor)*/

create table produto(
codp int not null,
sigla varchar(30) not null,
nome varchar (30) not null,
descr varchar (100) not null,
tipo varchar(30) not null,
preco varchar(20) not null, 
tam varchar(20) not null,
constraint pk_produto primary key (codp),
constraint fk_produto_fornecedor foreign key (sigla) references fornecedor(sigla)
); 


/*Cliente( Codcli , cpf ou cnpj, nome, e-mail, telefone, numero da casa, rua, bairro, cidade , estado)*/

create table cliente(
codcli  int not null,
cpf int not null,
cnpj int not null,
nome varchar (50) not null, 
email varchar (30) not null,
telefone varchar (20) not null, 
nuncasa varchar (10) not null,
rua varchar (50) not null,
bairro varchar(50) not null,
cidade varchar (50) not null,
estado varchar (30) not null,
constraint pk_cliente primary key (codcli)
);
 

/*Carrinho( Codc, data, hora)*/

create table carrinho(
codc varchar (20) not null,
data date not null,
hora time not null,
constraint pk_carrinho primary key (codc));

/*Venda ( Codc (carrinho), codv, numero , loguaduro)*/

create table venda(
codc varchar (20) not null,
codv varchar (20) not null,
numentreg varchar (10) not null,
loguaduro varchar (100) not null,
constraint pk_venda primary key (codc,codv)
);


/* Pagamento (CodV (venda) ,Codpag, nota fiscal, valor)*/
create table pagamento(
codv varchar (20) not null,
codpag varchar (20) not null,
nfisc int  not null, 
valor varchar (10) not null,
constraint pk_pagamento primary key (codv,codpag)
);


/*Fornecer (sigla(fornecedor), codpro(produto), data)*/

create table fornecer(

sigla varchar(20) not null,
codp int not null,
data date not null,
constraint pk_fornecer primary key (sigla,codp)
constraint fk_fornecer_fornecedor foreign key (sigla) references fornecedor(sigla),
constraint fk_fornecer_produto foreign key (codp) references produto (codp)
); 


/*Colocado( codpro(produto), codc(carinho), quantidade)*/

create table colocado(
codpro int not null,
codc varchar (20) not null,
quantidade varchar (20) not null,
constraint pk_colocado primary key (codpro, codc)
);



/*Adiciona((Codc(carinho), codcli(cliente))*/ 

create table adiciona(
codc varchar (20) not null,
codcli varchar (20) not null,
dthora timestamp ,
constraint pk_adiciona primary key (codc,codcli)
);





insert into empresa( cnpj, nome , tele, email,  num, rua, bairro, cidade, estado)
values
(1010, 'alcaplas',3433,'alca@gmail.com', 22, 'independencia', 'nossa senhora de lourdes', 'xanxere', 'santa catarina'),
(1011, 'unibom', 3435, 'unibom@gmail.com',23, 'papolo', 'altagrace', 'xanxere', 'santa catarina'),
(1012, 'OBENSONTRADINg&TURISMO', 4999, 'obetrade@.com.br', 122,'tervino','novoli', 'xanxere', 'santa catarina'),
(1013, 'Maurice Store', 9920, 'mauricestore@gmail.com', 123,'louverture', 'mariani', 'port-au-prince', 'ouest'),
(1314, 'padilha&Maurice', 9898,'pm@gmail.com', 124, ' nicolau farddo', 'alegre', 'xanxere', 'santa catarina'),
(1315, 'haitianfresh', 9999, 'h@gmail.com', 125, 'sei', 'centro', 'sao paulo', 'sao paulo');

 	
insert into fornecedor( sigla, cnpj, cpf, email, telefone, rua, cidade, estado)
values
('xap', 2122, 4445 , 'x@.com.br', 4949, 'jean paul', 'chapeco', 'santa catalina'),
('xim', 2380, 4446 ,'xim@gmail.com',9925, 'jean jacques', 'xaxim', 'santa catarina'),
('stan', 0012, 4447,'stanboul@gmail.com', 0033, 'recquo', 'stanb', 'parana'),
('jag', 2341, 4448 ,'j@gmail.com', 5119,'contant', 'colonos do sul', 'rio grande do sul'),
('bel', 2222, 4449 ,'bel@gmail.com', 5549, 'malagua', 'mascore', 'parana'),
('cop', 2323, 4450 ,'c@gmail.com', 4610, 'colas', 'bazilo', 'rio grande do sul');



insert into Produto ( codp, nome, descr, tipo, preco, tam, sigla)
values
(5510, 'jeans', 'muito xic', 'roupa', '40 reais', 'gg', 'xap'),
(5543, 'tole', 'linha top', 'material', '10 reais', '2mm','xim'),
(5544, 'linda pele', 'ajudar a pele', 'cosmetico', '8 reais', '1 litro', 'stan'),
(5545, 'coixa sobre coixa', 'carne top', 'alimentacao', '10reais', '2 cm quadrado', 'jag'),
(5546, ' creme belina', 'te laisse bellle', 'cosmetico', '100 reais', '5 litros', 'bel'),
(5547, 'notebook ', 'top da linha', 'electronic ', '5000 reais', '18 polegadas', 'cop');

insert into fornecer (sigla, codp, data)
values
('xap001', 5510, '25/04/2020'),
('xim002', 5543, '2/04/2020'),
('stan021', 5544, '25/10/2020'),
('jag022', 5545, '06/02/2020'),
('bel031', 554, '25/05/2020'),
('cop015', 5547, '25/11/2020');




insert into cliente( codcli , cpf, cnpj, nome, email, telefone, nuncasa, rua, bairro, cidade , estado)
values
(01, 250, 7771, 'Obenson Maurice', 'mob@gmail.com', 4992, 522, 'nicolau fardo', 'pascal','xanxere', 'santa catarina'),
(02, 237, 7772 ,'kerbens maurice fils','kb@gmail.com', 4893, 521, 'toronto', 'ricadago','cambrigde', 'santa catarina'),
(03, 239, 7773 ,'Juzz Norvensky', 'nor@gmail.com', 5166, 523, 'brooklyn', 'boscoso', 'chengen', 'Rio grande do sul'),
(04, 739, 7774 ,'Redeny Maurice', 'r@gmail.com', 4995 , 77, 'basco', 'pap', 'capitapap', 'santa catariana'),
(05, 436, 7775 ,'wilinstown Gael', 'wg@gmail.com' , 4675,6757, 'polongos', 'fatiama', ' will life', 'parana'),
(06, 546, 7776,'Rubens Dabens', 'rubens@gmail.com', 5110,76576, 'palerm', 'forfruit', 'streetlife', 'Rio grande do sul');
		  
 


insert into carrinho( codc, data, hora)
values
(1505, '20/10/2020', '05:30'),
(1506, '02/10/2020', '05:30'),
(1507, '30/11/2020', '05:30'),
(1508, '08/02/2020', '05:30'),
(1509, '09/06/2020', '05:30'),
(1510, '22/05/2020', '05:30');


insert into adiciona(codc, codcli, dthora)
values
(1505, 01, '17/02/2020 8:00'),
(1506, 02, '17/02/2020 8:00'),
(1507, 03, '17/02/2020 8:00'),
(1508, 04, '17/02/2020 8:00'),
(1509, 05, '17/02/2020 8:00'),
(1510, 06, '17/02/2020 8:00');





insert into Venda ( Codc, codv, numentreg , loguaduro)
values
(1505, 0300, 140, 'bagatini'),
(1506, 0301, 141, 'vilacezano'),
(1507, 0302, 142, 'veneza'),
(1508, 0303, 143, 'bortolon'),
(1509, 0304, 144, 'fatiti'),
(1510, 0305, 145, 'bagatinizitic');


insert into Pagamento (Codv ,Codpag, nfisc, valor)
values
(0300, 99001, 00039912, '50 reais'),
(0301, 99002, 00039913, '500 reais'),
(0302, 99003, 00039918, '150 reais'),
(0303, 99004, 00039920, '450 reais'),
(0304, 99005, 00039922, '5550 reais'),
(0305, 99006, 00039923, '350 reais');


insert into Colocado( codpro, codc, quantidade)
values
(5510, 1505, 10),
(5543, 1506, 10),
(5544, 1507, 10),
(5545, 1508, 10),
(5546, 1509, 10),
(5547, 1510, 10);














