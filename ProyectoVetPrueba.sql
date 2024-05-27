create database ProyectoVet;
use ProyectoVet;


create table Codigo_inter (
`Num_inter` INT ,
`Pais` VARCHAR(14) not null,
Primary key (Num_inter) 
 
);

create table Numero_telefono (
`Cod_Num_inter` INT ,
`N_telefono`int NOT NULL,
foreign key (Cod_Num_inter) references Codigo_inter(Num_inter) ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_Num_Tel(Cod_Num_inter,N_telefono) 
 
);
create table Sexo (
`ID_Sexo` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Sexo) 
 
);
create table Tipo_Colaborador (
`Tipo_Colab` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (Tipo_Colab)
 
);

create table Colaborador (
`ID_Colab` INT ,
`Tipo_Colabo` int not null,
`Nombre` VARCHAR(25) not null,
`Apellido_1` VARCHAR(25) not null,
`Apellido_2` VARCHAR(25) not null,
`Cod_Num_inter` int not null,
`N_telefono` int not null,
foreign key (Cod_Num_inter, N_telefono) references Numero_telefono(Cod_Num_inter,N_telefono)ON UPDATE no action  ON DELETE CASCADE ,
foreign key (Tipo_Colabo) references Tipo_Colaborador(Tipo_Colab)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Colaborador(ID_Colab,Tipo_Colabo)
 
 );

create table Tipo_ID (
`Tipo_Identi` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (Tipo_Identi), 
 
);

create table Cliente (
`Tipo_Identi` int not null,   
`Identificacion` INT ,
`Nombre` VARCHAR(25) not null,
`Apellido_1` VARCHAR(25) not null,
`Apellido_2` VARCHAR(25) not null,
`Cod_Num_inter` int not null,
`N_telefono` int not null,
foreign key (Tipo_Identi) references Tipo_ID(Tipo_Identi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (Cod_Num_inter,N_telefono) references Numero_telefono(Cod_Num_inter,N_telefono)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Cliente(Tipo_Identi, Identificacion) 
 
);

create table Paciente (
`ID_Paci` INT AUTO_INCREMENT ,
`Nombre_Paci` VARCHAR(25) not null,
`Raza` VARCHAR(25) not null,
`Edad` int not null,
`Sexo` int not null,
`Peso` decimal(4,2) not null,
`Tipo_Identi` int not null,
`Identificacion` INT not null,
foreign key (Tipo_Identi,Identificacion) references Cliente(Tipo_Identi, Identificacion)ON UPDATE no action  ON DELETE CASCADE,
foreign key (Sexo) references Sexo(ID_Sexo)ON UPDATE no action  ON DELETE CASCADE,
Primary key (ID_Paci) 
 
);


create table Atencion (
`Num_Aten` INT AUTO_INCREMENT ,
`Fech_Aten` DATE not null,
`ID_Paci` int not null,
foreign key (ID_Paci) references Paciente(ID_Paci)ON UPDATE no action  ON DELETE CASCADE,
Primary key (Num_Aten) 
 
);

create table Servicio ( 
`ID_Servi` INT AUTO_INCREMENT,
`Nom_Serv` Varchar(25)not null ,
`Precio` int not null,
`Num_Atem` int  not null,
`ID_Colab` int not null,
`Tipo_Colabo` int not null,
foreign key (Num_Atem) references Atencion(Num_Aten)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Colab,Tipo_Colabo) references Colaborador(ID_Colab,Tipo_Colabo)ON UPDATE no action  ON DELETE RESTRICT  /* Restriccion*/,
Primary key (ID_Servi) 
 
);



create table Tipo_Estet_Can (
`ID_Estet_Can` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Estet_Can)
);

create table Tipo_Hospe (
`ID_Tipo_Hosp` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Hosp)

);

create table Tipo_Imagen (
`ID_Tipo_Ima` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Ima)

);


create table Tipo_Examen (
`ID_Tipo_Exa` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Exa)

);

create table Tipo_Inter (
`ID_Tipo_Inter` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Inter) 
);

create table Tipo_Cirugia (
`ID_Tipo_Cir` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Cir) 
 
);

create table Tipo_MI (
`ID_Tipo_MI` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_MI) 
);

create table ID_Vac (
`ID_Tipo_Serv_Vac` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Serv_Vac) 
);

create table ID_Despar (
`ID_Tipo_Serv_Despar` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Serv_Despar) 
);


create table Estetica_Canina (
`ID_Servi_Estet` INT ,
`ID_Estet_Can` int not null,
foreign key (ID_Estet_Can) references Tipo_Estet_Can(ID_Estet_Can)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Servi_Estet) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Serv(ID_Servi_Estet,ID_Estet_Can) 
 
);


create table Hospedaje (
`ID_Servi_Hosp` INT ,
`ID_Tipo_Hosp` int not null,
`Fech_Ingres` date not null,
`Fech_Salida` date not null,
`Observaciones` VARCHAR(45) not null,
foreign key (ID_Servi_Hosp) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_Hosp) references Tipo_Hospe(ID_Tipo_Hosp)ON UPDATE no action  ON DELETE CASCADE,
Primary key (ID_Servi_Hosp,ID_Tipo_Hosp) 
 
);

create table Imagenes (
`ID_Servi_Ima` INT ,
`ID_Tipo_Ima` int not null,
`Resul_Ima` VARCHAR(45) not null,
`Diagnostico` VARCHAR(45) not null,
`Zona_Apli` VARCHAR(45) not null,
foreign key (ID_Servi_Ima) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_Ima) references Tipo_Imagen(ID_Tipo_Ima)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Serv(ID_Servi_Ima,ID_Tipo_Ima) 
 
);

create table Laboratorio (
`ID_Servi_Lab` INT ,
`ID_Tipo_Exa` int not null,
`Fech_Exam` date not null,
`Resul_Exam` VARCHAR(45) not null,
foreign key (ID_Servi_Lab) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_Exa) references Tipo_Examen(ID_Tipo_Exa)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Serv(ID_Servi_Lab,ID_Tipo_Exa) 
 
);



create table Internamiento (
`ID_Servi_Int` INT ,
`ID_Tipo_Inter` INT,
`Fech_Egres` date not null,
`Motiv_Consul`  VARCHAR(45) not null,
`Diagnostico` VARCHAR(45) not null,
`Recet_Trata` VARCHAR(45) not null,
foreign key (ID_Servi_Int) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE ,
foreign key (ID_Tipo_Inter) references Tipo_Inter(ID_Tipo_Inter)ON UPDATE no action  ON DELETE CASCADE ,
Primary key (ID_Servi_Int,ID_Tipo_Inter) 
 
);

create table Cirugia (
`ID_Servi_Cir` INT ,
`ID_Tipo_Cir` int not null,
`Fech_Cir` date not null,
`Resul_Cir` VARCHAR(45) not null,
`Observ_Cir` VARCHAR(45) not null,
foreign key (ID_Servi_Cir) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_Cir) references Tipo_Cirugia(ID_Tipo_Cir)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Serv(ID_Servi_Cir,ID_Tipo_Cir) 

);

create table Medicina_Interna (
`ID_Servi_MI` INT ,
`ID_Tipo_MI` int not null,
`Motiv_Consul`  VARCHAR(45) not null,
`Diagnostico` VARCHAR(45) not null,
`Recet_Trata` VARCHAR(45) not null,
foreign key (ID_Servi_MI) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_MI) references Tipo_MI(ID_Tipo_MI)ON UPDATE no action  ON DELETE CASCADE,
Primary key (ID_Servi_MI,ID_Tipo_MI) 
 
);

create table Vacuna (
`ID_Servi_Vac` INT ,
`ID_Tipo_Serv_Vac` int not null,
`Nomb_Vac`  VARCHAR(45) not null,
`Dosis_Apli_MI` decimal not null,
foreign key (ID_Servi_Vac) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_Serv_Vac) references ID_Vac(ID_Tipo_Serv_Vac)ON UPDATE no action  ON DELETE CASCADE,
Primary key (ID_Servi_Vac,ID_Tipo_Serv_Vac) 

);

create table Desparacitacion (
`ID_Servi_Despar` INT ,
`ID_Tipo_Serv_Despar` INT ,
`Nombre_Despar`  VARCHAR(45) not null,
`Dosis_apli_Mg` decimal not null,
foreign key (ID_Servi_Despar) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Tipo_Serv_Despar) references ID_Despar(ID_Tipo_Serv_Despar)ON UPDATE no action  ON DELETE CASCADE,
Primary key (ID_Servi_Despar,ID_Tipo_Serv_Despar) 
 
);

create table Proveedor (
`ID_Prov` INT ,
`Nom_Empresa`  VARCHAR(45) not null,
`Descri_Prov`  VARCHAR(45) not null,
`Telefono_Prov` int not null,
`Correo_Prov`  VARCHAR(45) not null unique,
Primary key (ID_Prov) 
 
);


create table Producto ( 
`ID_Prod` INT AUTO_INCREMENT,
`Nom_Prod`  VARCHAR(45) not null,
`Descri_Prod`  VARCHAR(45) not null,
`Existencia` int not null,
`Precio`  int not null,
`ID_Prov`  int not null,
foreign key (ID_Prov) references Proveedor(ID_Prov)ON UPDATE no action  ON DELETE RESTRICT /* Restriccion*/,
Primary key (ID_Prod) 
 
);

create table Tipo_Alimento (
`Tipo_Alim` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (Tipo_Alim) 
 
);

create table Tipo_Mascota (
`Tipo_Masco` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (Tipo_Masco) 
 
);

create table Tipo_Quimico (
`Tipo_Quim` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (Tipo_Quim) 
 
);

create table Tipo_Medicamento (
`Tipo_Med` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (Tipo_Med) 
 
);

create table ID_Acc (
`ID_Tipo_Prod_Acc` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Prod_Acc) 
 
);

create table Tipo_Pet (
`ID_Tipo_Pet` INT ,
`Descripcion` VARCHAR(45) not null,
Primary key (ID_Tipo_Pet) 
 
);

create table Alimentos  (
`ID_Prod_Alim` INT ,
`Tipo_Alim`  int not null,
`Tipo_Masco`  int not null,
foreign key (Tipo_Alim) references Tipo_Alimento(Tipo_Alim)ON UPDATE no action  ON DELETE CASCADE,
foreign key (Tipo_Masco) references Tipo_Mascota(Tipo_Masco)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Prod_Alim) references Producto(ID_Prod)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Prod(ID_Prod_Alim,Tipo_Alim) 
 
);


create table Quimicos  (
`ID_Prod_Quim` INT ,
`Tipo_Quim` int not null,
`Dosis` VARCHAR(45) not null,
foreign key (Tipo_Quim) references Tipo_Quimico(Tipo_Quim)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Prod_Quim) references Producto(ID_Prod)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Prod(ID_Prod_Quim,Tipo_Quim) 
 
);

create table Medicamentos  (
`ID_Prod_Med` INT ,
`Tipo_Med` int not null,
`Dosis` VARCHAR(45) not null,
foreign key (Tipo_Med) references Tipo_Medicamento(Tipo_Med)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Prod_Med) references Producto(ID_Prod)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Prod(ID_Prod_Med,Tipo_Med) 
 
);

create table Accesorios (   
`ID_Prod_Acc` INT ,
`ID_Tipo_Prod_Acc` INT not null,
`Material` VARCHAR(45) not null,
`Marca` VARCHAR(45) not null,
foreign key (ID_Tipo_Prod_Acc) references ID_Acc(ID_Tipo_Prod_Acc)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Prod_Acc) references Producto(ID_Prod)ON UPDATE no action  ON DELETE CASCADE,
 Primary key (ID_Prod_Acc,ID_Tipo_Prod_Acc) 
);

create table Pets (
`ID_Prod_Pets` INT ,
`ID_Tipo_Pet` int not null,
`Especie` VARCHAR(45) not null,
`Color` VARCHAR(45) not null,
`Sexo` VARCHAR(45) not null,
foreign key (ID_Tipo_Pet) references Tipo_Pet(ID_Tipo_Pet)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Prod_Pets) references Producto(ID_Prod)ON UPDATE no action  ON DELETE CASCADE,
Primary key PK_ID_Prod(ID_Prod_Pets,ID_Tipo_Pet) 
 
);

create table Factura  (
`ID_Fact` INT ,
`Fech_Emi` date not null,
`ID_Colab` int not null,
`Tipo_Colabo` int not null,
`Tipo_Identi` int not null,
`Identificacion` int not null,
foreign key (ID_Colab,Tipo_Colabo) references Colaborador(ID_Colab,Tipo_Colabo)ON UPDATE no action  ON DELETE CASCADE,
foreign key (Tipo_Identi, Identificacion) references Cliente(Tipo_Identi, Identificacion)ON UPDATE no action  ON DELETE RESTRICT  /* Restriccion*/,
Primary key (ID_Fact) 
  
);


create table Det_Fact  (   /*  Restriccion */
`ID_Fact` int not null,
`ID_Detalle` INT ,
`Cantidad` int not null,
`Precio_Unitario` int not null,
`Total_a_Pagar` int not null,
`ID_Servi` int,
`ID_Prod` int ,
foreign key (ID_Servi) references Servicio(ID_Servi)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Prod) references Producto(ID_Prod)ON UPDATE no action  ON DELETE CASCADE,
foreign key (ID_Fact) references Factura(ID_Fact)ON UPDATE no action  ON DELETE RESTRICT,
Primary key PK_ID_Fact(ID_Fact,ID_Detalle)  
  
);

DELIMITER //
CREATE TRIGGER Precio_Servicio
BEFORE INSERT ON Servicio
FOR EACH ROW
BEGIN
    IF NEW.Precio < 0 THEN
          SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se permiten cantidades negativas.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Precio_Producto
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.Precio < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se permiten cantidades negativas.';
    END IF;
END;
//
DELIMITER ;



DELIMITER //
CREATE TRIGGER CalcularTotal
BEFORE INSERT ON Det_Fact
FOR EACH ROW
BEGIN
    SET NEW.Total_a_Pagar = NEW.Cantidad * NEW.Precio_Unitario;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER NotificarCantidadMinima
BEFORE UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF NEW.Det_Fact.Cantidad > 3 THEN
       SET NEW.Existencia = old.Existencia- Det_Fact.Cantidad;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock bajo en producto ';
    END IF;
END;
//
DELIMITER ;


INSERT INTO Codigo_inter VALUES
(506,"Costa Rica"),
(507,"Panamá"),
(1,"Estados Unidos");

INSERT INTO Numero_telefono VALUES
(506,55532184),
(506,55542624),
(507,55546878),
(1,55521463),
(507,55542328),
(506,55512345),
(507,55578901),
(1,55534567),
(1,55523456),
(506,55589012),
(507,55545678),
(506,55578901),
(506,55546878),
(506,55521463),
(506,55542328);

INSERT INTO Tipo_Colaborador VALUES
(1,"Dr.Mascotas"),
(2, "Dr.Silvestres"),
(3,"Grooming"),
(4,"Dependiente");

INSERT INTO Colaborador VALUES
(606940145, 2,"Juan","Pérez","González",506,55532184),
(622561456, 1,"María","López","Rodríguez",506,55542624),
(637891235, 3,"Carlos","García","Fernández",506,55546878),
(644921453, 4,"Roberto","Torres","Mendoza",506,55521463);


INSERT INTO  Sexo VALUES
(14,"Macho"),
(15,"Hembra");

INSERT INTO Tipo_ID VALUES
(01,"Pasaporte"),
(02, "Cedula");

INSERT INTO Cliente VALUES
(01, 823456789,	"Juan",	"Pérez","González",506,55532184),
(02,125440245,	"María","López","Rodríguez",506,55542624),
(01, 508930123,	"Carlos",	"García",	"Fernández",507,55546878),
(02, 708900345,	"Laura",	"Martínez",	"Sánchez",1,55521463),
(01, 801230567,	"Roberto",	"Torres",	"Mendoza",507,55542328),
(02, 604560890,	"Andrea",	"Soto",	"Castillo",	506,55512345),
(01, 156789012,	"Gabriel",	"Vargas",	"Cruz",	507,55578901),
(02, 608900234,	"Natalia",	"Rodríguez",	"López",1,55534567),
(01, 190123456,	"Luis",	"Fernández",	"Pérez",1,55523456),
(02, 602340678,	"Gabriela",	"González",	"Martínez",506,55589012);


INSERT INTO Paciente (ID_Paci,Nombre_Paci,Raza,Edad,Sexo,Peso,Tipo_Identi,Identificacion) VALUES
(1,"Max","Labrador",       4,14,20.50, 01	,823456789),
(2,"Bella","Persa",        2,15,40.20, 02,125440245),
(3,"Rocky","Bulldog",      3,14,21.8,  01,508930123),
(4,"Luna","Siamese",       5,15,18.3,  02,708900345),
(5,"Mia",	"Ragdoll",       2,14,4.1,   01,801230567),
(6,"Charlie",	"Persian",   4,14,4.0,   02,604560890),
(7,"Simba","Maine Coon",   3,15,6.7,   01,156789012);


INSERT INTO Atencion (Num_Aten,Fech_Aten,ID_Paci) VALUES
(1,"2023-01-15",1),
(2,"2023-02-10",2),
(3,"2023-03-05",3),
(4,"2023-04-20",4),
(5,"2023-05-15",5),
(6,"2023-06-10",6),
(7,"2023-07-05",7);

INSERT INTO Servicio VALUES 
(1,"Estetica Canina",	10000,	   1, 637891235, 3),
(2,"Hospedaje",	12500,	           2,644921453, 4),
(3,"Imagenes", 17000,              3, 606940145, 2),
(4,"Laboratorio", 14000,           4, 622561456, 1),
(5,"Internamiento",25000,          5, 622561456, 1),
(6,"Cirugia", 35000,               6, 606940145, 2),
(7,"Medicina interna",25000,       7, 606940145, 2);




INSERT INTO Tipo_Estet_Can Values
(29,"Baño"), 
(30,"Corte de pelo"),
(31,"Corte de Uñas"),
(32,"Limpieza de Oídos"),
(13, "Limpieza dental");


INSERT INTO Estetica_Canina VALUES /*En el ID_Servi_Estet se va actualizar automatico, cuando se levante*/
(1,29), 
(1,30 ),
(1,31),
(1,32),
(1,13);

INSERT INTO Tipo_Hospe Values 
(7, "Hospedaje"); 

INSERT INTO Hospedaje VALUES 
(2, 7,	"2021-03-15", "2022-05-15",	"Todo fue un exito");

/*
(2, 7,	"2023-02-10", "2023-02-12",	"Sin ningun problema"),
(2,	7,	"2023-03-05",	"2023-03-10",	"Cachorro en crecimiento"),
(2,	7,	"2023-04-20",	"2023-04-25",	"Gato con tratamiento"),
(2,	7,	"2023-05-15",	"2023-05-20",	"Perro con herida"),
(2,	7,	"2023-06-10",	"2023-06-15",	"Cachorro en crecimiento"),
(2,	7,	"2023-07-05",	"2023-07-10",	"Gato con herida"),
(2,	7,	"2023-08-20",	"2023-08-25",	"Perro con alergia"),
(2,	7,	"2023-09-15",	"2023-09-20",	"Cachorro ansioso");
*/


INSERT INTO Tipo_Imagen VALUES
(1,"Radiografía"),
(2,"Ecografía");

INSERT INTO Imagenes VALUES 
(3, 1 , "Normal",	"Control de salud",	"Torax"	);


/*
(300,	2,"Ecografía",	"Anomalía",	"Problemas gastrointestinales",	"Abdomen"),
(300,	1,"Radiografía",	"Anomalía",	"Lesión en hueso",	"Extremidad"),
(300,	2,"Radiografia", "Normal",	"Chequeo dental",	"Cavidad Oral"),
(300,	2,"Ecografía",	"Anomalía",	"Embarazo", "Abdomen"),
(300,	1,"Radiografia",	"Normal",	"Control de salud",	"Torax"),
(300,	1,"Radiografía",	"Anomalía",	"Problemas respiratorios",	"Torax"),
(300,	2,"Ecografía",	"Anomalía",	"Problemas renales",	"Abdomen"),
(300,	1,"Radiografía",	"Normal",	"Control de salud",	"Torax"),
(300, 1,"Radiografia",	"Anomalía",	"Lesión en hueso", "Extremidad");
*/
    INSERT INTO Tipo_Examen VALUES
(4,	"Hematología "),
(5, "Análisis de Orina"),
(6, "Examenes de Heces");

INSERT INTO Laboratorio VALUES
(4, 4,"2023-01-15", "Normal");

/*
(400,	5,"2023-02-10", "2023-02-11","Anomalía"),
(400,	6,"2023-03-05", "2023-03-05",	"Anomalía"),
(400,	4,"2023-04-20", "2023-04-20",	"Normal"),
(400,	5,"2023-05-15", "2023-05-16",	"Anomalía"),
(400,	6,"2023-06-10", "2023-06-11",	"Normal"),
(400,	4,"2023-07-05", "2023-07-05",	"Anomalía"),
(400,	5,"2023-08-20", "2023-08-21",	"Normal"),
(400,	6,"2023-09-15", "2023-09-15",	"Normal"),
(400, 5,"2023-10-10", "2023-10-11", "Anomalía");

*/

INSERT INTO Tipo_Inter VALUES 
(8, "Internamiento");

INSERT INTO Internamiento VALUES 
(5, 8, 2023-01-20,	"Observación",	"Control de salud",	"Antibiótico, reposo");

/*
(200,	8,2023-02-15,	"Herida",	"Tratamiento",	"Limpieza, vendaje"),
(200,	8,2023-03-10,	"Infección",	"Control de salud",	"Antibiótico, análisis de sangre"),
(200,	8,2023-04-25,	"Cirugía",	"Problemas dentales",	"Extracción de diente, analgésico"),
(200,	8,2023-05-20,	"Observación",	"Control de salud",	"Reposo, seguimiento médico"),
(200,	8,2023-06-15,	"Enfermedad",	"Diagnóstico médico",	"Tratamiento, análisis de orina"),
(200,	8,2023-07-10,	"Cirugía",	"Fractura",	"Reducción de fractura, yeso"),
(200,	8,2023-08-25,	"Infección",	"Control de salud",	"Antibiótico, seguimiento médico"),
(200,	8,2023-09-20,	"Enfermedad",	"Diagnóstico médico",	"Tratamiento, análisis de sangre"),
(200, 8,2023-10-15,	"Herida",	"Tratamiento",	"Limpieza, vendaje");

*/

INSERT INTO Tipo_Cirugia VALUES
(9,	"General "),
(10, "Especifica");

INSERT INTO Cirugia VALUES  
(600, 10,	"2023-01-20",	"Exitosa",	"Esterilización de gato"),
(600,	9,"2023-02-15",	"Exitosa",	"Cirugía de tejido blando"),
(600,	10,"2023-03-10",	"Exitosa",	"Cirugía dental de perro"),
(600,	9,"2023-04-25",	"Exitosa",	"Cirugía ortopédica"),
(600,	10,"2023-05-20",	"Exitosa",	"Cirugía de tejido blando"),
(600,	10,2023-06-15,	"Exitosa",	"Cirugía ortopédica"),
(600,	10,2023-07-10,	"Exitosa",	"Cirugía dental de gato"),
(600,	9,2023-08-25,	"Exitosa",	"Cirugía de tejido blando"),
(600,	9,2023-09-20,	"Exitosa",	"Cirugía dental de perro"),
(600,	10,2023-10-15,	"Exitosa",	"Cirugía ortopédica");

INSERT INTO ID_Vac VALUES
(12, "Vacuna");

INSERT INTO Vacuna VALUES
(800,12	,"Moquillo canino",	1.0),
(800, 12,"Hepatitis infecciosa", 0.5),
(800, 12	,"Parvovirosis",	1.0),
(800, 12	,"Leptospirosis",	1.0),
(800,	12,"Rabia"	, 0.5),
(800,	12,"Moquillo",	1.0),
(800,	12,"Gripe Felina",	1.0),
(800,	12,"Leucemia Felina",	0.5),
(800,	12,"Peritonitis infecciosa felina",	1.0);

INSERT INTO ID_Despar VALUES
(28, "Desparacitante");

INSERT INTO Desparacitacion VALUES
(900,28,"Seresto Collar Gato",	50),
(900, 28,"Profender Gatos",	25),
(900,28,"Feline Endo Spot",	30),
(900,28,"Front Line Plus",	50),
(900,28,"Advantage Multi Gato",	25),
(900,28,"Drontal",	30),
(900,28,"Cardomec",	50),
(900,28,"Advantix",	25);


INSERT INTO Proveedor VALUES
(1,	"Pet Family",	"Mascotas",	55123456,	"abc@example.com"),
(2,	"Pet Pharma",	"Medicamentos veterinarios",	55578902,	"petpharma@example.com"),
(3,	"Animal Supplies",	"Suministros para mascotas",	55345678,	"animalsupplies@example.com"),
(4,	"Vet Equipment",	"Equipos veterinarios",	55590124,	"vetequipment@example.com"),
(5,	"Healthy Pet Foods",	"Alimentos para mascotas", 55556890,	"healthypet@example.com"),
(6,	"Pet Grooming",	"Productos de aseo,	55524567",	"petgrooming@example.com"),
(7,	"PharmaVet",	"Medicamentos para animales",	55890123,	"pharmavet@example.com"),
(8,	"VetTech",	"Tecnología veterinaria",	55556789,	"vettech@example.com"),
(9,	"Animal Nutrition",	"Nutrición animal",	55501234,	"animalnutrition@example.com"),
(10,	"Pet Care Supplies",	"Suministros de cuidado",	55567901,	"petcaresupplies@example.com");

/*Aqui comienza lo de producto*/

INSERT INTO Producto VALUES
(150, "Pets",	"Animal de raza pura",	3,	50000,	1),
(250,	"Accesorios",	"Entretenimiento",	50,	12500,	8),
(350,	"Medicamentos",	"Tratamiento médico",	30,	9000,	2),
(450,	"Quimicos",	"Control de pulgas",	80,	15750,	4),
(550,	"Alimentos",	"Entretenimiento",	150,	7000,	3);


INSERT INTO Tipo_Pet VALUES 
(33,	"Peces"),
(34,	"Jerbos"),
(35,	"Hámster"),
(36, "Tortugas");

INSERT INTO Pets VALUES 
(150,	33,	"Peces de acuario",	"Amarillo",	14),
(150,	34,	"Roedor", "Blanco",	15),
(150,	35,	"Roedor",	"Negro",	14),
(150,	36,	"Reptil",	"Marrón",	15),
(150,	33,	"Peces de acuario",	"Gris",	15),
(150,	34,	"Roedor",	"Naranja",	14),
(150,	35,	"Roedor",	"Blanco",	15),
(150,	36,	"Reptil",	"Negro y Marrón",	14),
(150,	33,	"Peces de acuario",	"Marrón y Negro",	15),
(150,	36,	"Reptil",	"Marrón y Blanco",	15);

INSERT INTO ID_Acc VALUES 
(46,	"Plástico PetMart"),
(47,	"Metal PetAccess"),	
(48,	"Plástico PetWorld"),	
(49,	"Cuero PetStyle"),	
(50,	"Metal PetZone"),	
(51,	"Cuero PetFashion"),	
(52,	"Plástico PetMart"),	
(53,	"Metal PetAccess"),	
(54,	"Cuero PetStyle"),	
(55,	"Plástico PetWorld");	

INSERT INTO Accesorios VALUES 
(250,	46,"Plástico",	"PetMart"),
(250,	47,"Metal",	"PetAccess"),
(250,	48,"Plástico",	"PetWorld"),
(250,	49,"Cuero",	"PetStyle"),
(250,	50,"Metal",	"PetZone"),
(250,	51,"Cuero",	"PetFashion"),
(250,	52,"Plástico",	"PetMart"),
(250,	53,"Metal",	"PetAccess"),
(250,	54,"Cuero",	"PetStyle"),
(250,	55,"Plástico",	"PetWorld");

INSERT INTO Tipo_Medicamento VALUES
(56,	"Antibiótico"),
(57,	"Antiinflamatorio"),
(58,	"Vitaminas");

INSERT INTO Medicamentos VALUES
(350,	56,	"50 mg"),
(350,	57,	"75 mg"),
(350,	58,	"10 mg"),
(350,	56,	"20 mg"),
(350,	57,	"60 mg"),
(350,	57,	"80 mg"),
(350,	56,	"15 mg"),
(350,	58,	"30 mg"),
(350,	58,	"45 mg"),
(350, 58, "70 mg");

INSERT INTO Tipo_Quimico VALUES 
(69,	"Granulado"),
(70,	"Polvo"),
(71,	"Liquido"),
(72,	"Aerosol");

INSERT INTO Quimicos VALUES 
(450,	69,	"30 ml"),
(450,	70, "15 ml"),
(450,	71,	"20 ml"),
(450,	72,	"25 ml"),
(450,	69,	"40 ml"),
(450,	71,	"10 ml"),
(450,	70,	"18 ml"),
(450,	69,	"35 ml"),
(450,	72,	"12 ml");

INSERT INTO Tipo_Mascota VALUE
(37, "Gato adulto"),
(38, "Gato cahorro"),
(39, "Perro adulto"),
(40, "Perro cachorro"),
(41, "pericos"),
(42, "peces"),
(43, "tortuga"),
(44, "hamster"),
(45, "Jerbos");

INSERT INTO Tipo_Alimento VALUE
(73, "seco"),
(74, "humedo");

INSERT INTO Alimentos VALUE 
(550,	73,	37),
(550,	74,	38),
(550,	73,	42),
(550,	74, 40),
(550,	73,	44),
(550,	73,	42),
(550,	73,	45),
(550,	74, 38), 
(550,	74,	37),
(550,	73,	41);

/*Aqui comienza Facturación*/

INSERT INTO Factura VALUES 
(16534,	"2023-01-15",	6069401452, 002,  01, 823456789),
(24512,	"2023-02-10", 644921453, 004,  02,125440245),
(37562,	"2023-03-05",	644921453, 004, 	01, 801230567),
(45612,	"2023-04-20",	644921453, 004, 	02, 604560890),
(59871,	"2023-05-15",	644921453, 004, 	02, 608900234,
(63647,	"2023-06-10",	644921453, 004, 	02, 602340678),
(74523,	"2023-07-05",	644921453, 004, 	01, 156789012),
(84571,	"2023-08-20",	644921453, 004, 	02, 708900345),
(94521,	"2023-09-15",	622561456, 001,	02, 604560890),
(10453,	"2023-10-10",	622561456, 001,	02, 602340678);

INSERT INTO Det_Fact VALUES
(16534,	1621,	2,	60000,	60000,	100,	150),
(24512,	2421,	1,	25.50,	25.50,	200,	250),
(37562,	1425,	3,	35.00,	105.00,	400,	350),
(45612,	2685,	2,	15.75,	31.50,	500,	450),
(59871,	1023,	1,	45.20,	45.20,	600,	550),
(63647,	4531,	1,	48.90,	97.80,	700,	450),
(74523,	2247,	1,	15.00,	15.00,	800,	350),
(84571,	6942,	1,	20.50,	61.50,	900,	250),
(94521,	7321,	1,	60.25,	60.25,	300,	150),
(710453, 2147,	1,	35.30,	70.60,	900,	550);











/*
DELIMITER //
CREATE TRIGGER LimitarRelaciones
BEFORE INSERT ON Det_Fact
FOR EACH ROW
BEGIN
    DECLARE PadreID INT;

    -- Obtener el valor de TablaPadre que se va a relacionar
    SELECT TablaPadreID INTO PadreID FROM TablaPadre WHERE TablaPadreID = NEW.TablaPadreID;

    -- Verificar si la relación es válida
    IF PadreID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede establecer la relacion anterior ';
    END IF;
END;
//
DELIMITER ;


*/
 
/*

DELIMITER //
CREATE TRIGGER RegistroCambios_AfterUpdate
AFTER UPDATE ON MiTabla
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCambios (Tabla, ColumnaModificada, ValorAntiguo, ValorNuevo, Fecha)
    VALUES ('MiTabla', 'Columna1', OLD.Columna1, NEW.Columna1, NOW());
END;
//
DELIMITER ;


*/
