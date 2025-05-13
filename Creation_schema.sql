-- Création de la base de données
CREATE DATABASE IF NOT EXISTS tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE tifosi;

--Création des tables

CREATE TABLE  IF NOT EXISTS `tifosi`.`ingredient` (`id_ingredient` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR (50) NOT NULL , PRIMARY KEY (`id_ingredient`)) ENGINE = InnoDB; 

CREATE TABLE IF NOT EXISTS `tifosi`.`Client` (`id_client` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(50) NOT NULL , `email` VARCHAR(150) NOT NULL , `code_postal` INT NOT NULL ,PRIMARY KEY (`id_client`)) ENGINE = InnoDB; 

CREATE TABLE  IF NOT EXISTS `tifosi`.`marque` (`id_marque` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(50) NOT NULL ,PRIMARY KEY (`id_marque`)) ENGINE = InnoDB; 

CREATE TABLE  IF NOT EXISTS `tifosi`.`foccacia` (`id_foccacia` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(50) NOT NULL , `prix` DECIMAL(5,2) NOT NULL,PRIMARY KEY (`id_foccacia`)) ENGINE = InnoDB; 

CREATE TABLE  IF NOT EXISTS `tifosi`.`menu` (`id_menu` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(50) NOT NULL , `prix` DECIMAL(5,2) NOT NULL,PRIMARY KEY (`id_menu`)) ENGINE = InnoDB; 

CREATE TABLE  IF NOT EXISTS `tifosi`.`boisson` (`id_boisson` INT NOT NULL AUTO_INCREMENT , `nom` VARCHAR(50) NOT NULL ,PRIMARY KEY (`id_boisson`)) ENGINE = InnoDB; 

/*Création des relations : 
Entre ingredient et foccacia*/

CREATE TABLE `tifosi`.`foccacia_ingredient` (
    `id_foccacia` INT NOT NULL,
    `id_ingredient` INT NOT NULL,
    `quantités` VARCHAR(50)  NOT NULL,
    PRIMARY KEY (`id_foccacia`, `id_ingredient`),
    CONSTRAINT `fk_foccacia`
      FOREIGN KEY (`id_foccacia`) REFERENCES `tifosi`.`foccacia`(`id_foccacia`)  -- clé étrangère vers la table foccacia
      ON DELETE CASCADE, -- pour gérer l’intégrité des données
    CONSTRAINT `fk_ingredient`
      FOREIGN KEY (`id_ingredient`) REFERENCES `tifosi`.`ingredient`(`id_ingredient`)  -- clé étrangère vers la table ingredient
      ON DELETE CASCADE
) ENGINE = InnoDB;


/*Création des relations entre foccacia et menu :
Rajout de l’id_menu dans la table foccacia*/

ALTER TABLE `tifosi`.`foccacia`
ADD COLUMN `id_menu`  INT NOT NULL,
ADD CONSTRAINT `fk_foccacia_menu`
  FOREIGN KEY (`id_menu`) REFERENCES `tifosi`.`menu`(`id_menu`)
  ON DELETE CASCADE;  /*pour gérer l’intégrité des données (si on supprime)*/

/*Relation entre client et menu
Rajout d’une table intérmediaire (client_menu)*/

CREATE TABLE `tifosi`.`client_menu` (
    `id_client` INT NOT NULL,
    `id_menu` INT NOT NULL,
    PRIMARY KEY (`id_client`, `id_menu`),  /* Clés primaire*/
    CONSTRAINT `fk_client`
      FOREIGN KEY (`id_client`) REFERENCES `tifosi`.`client`(`id_client`)
      ON DELETE CASCADE,
    CONSTRAINT `fk_menu`
      FOREIGN KEY (`id_menu`) REFERENCES `tifosi`.`menu`(`id_menu`)
      ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE `tifosi`.`menu_boisson` (
    `id_menu` INT NOT NULL,
    `id_boisson` INT NOT NULL,
    PRIMARY KEY (`id_menu`, `id_boisson`),
    CONSTRAINT `fk_menu_menu_boisson`
      FOREIGN KEY (`id_menu`) REFERENCES `tifosi`.`menu`(`id_menu`)
      ON DELETE CASCADE,
    CONSTRAINT `fk_boisson_menu_boisson`
      FOREIGN KEY (`id_boisson`) REFERENCES `tifosi`.`boisson`(`id_boisson`)
      ON DELETE CASCADE
) ENGINE = InnoDB;

/*Relation entre marque et boisson
Rajout de l’id_marque dans la table boisson*/

ALTER TABLE `tifosi`.`boisson`
ADD COLUMN `id_marque` INT NOT NULL,
ADD CONSTRAINT `fk_boisson_marque`
  FOREIGN KEY (`id_marque`) REFERENCES `tifosi`.`marque`(`id_marque`)
  ON DELETE CASCADE;  /*pour gérer l’intégrité des données (si on supprime)*/
