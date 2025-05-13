USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/marque.csv'
INTO TABLE marque
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_marque, nom);

USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/boisson.csv'
INTO TABLE boisson
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_boisson, nom, id_marque);

USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/foccacia.csv'
INTO TABLE foccacia
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_foccacia, nom, prix, id_menu);

USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/ingredient.csv'
INTO TABLE ingredient
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_ingredient, nom);

USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/menu.csv'
INTO TABLE menu
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_menu, nom, prix);



USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/foccacia_ingredient.csv'
INTO TABLE foccacia_ingredient
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_foccacia, id_ingredient, quantités);



USE tifosi;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/menu_boisson.csv'
INTO TABLE menu_boisson
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_menu, id_boisson);

