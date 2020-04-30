# los-borbotones-back

Link los-borbotones Front "https://github.com/phm-unsam/los-borbotones-front"


Respuestas TP 2

punto1)

USE aerolinea;
DROP procedure IF EXISTS conocerLosPasajesDePrimera;

DELIMITER $$
USE aerolinea$$
CREATE PROCEDURE conocerLosPasajesDePrimera 
(
    p_ciudad varchar(240) 
)
SELECT v.ciudadDeOrigen,v.ciudadDeDestino,v.precioBase  FROM aerolinea.pasaje p
join aerolinea.asiento a on a.ID = p.asiento_ID
join aerolinea.vuelo v on v.ID =  p.vuelo_ID
where a.claseDeAsiento_ID = 1 and v.ciudadDeDestino = p_ciudad$$

DELIMITER ;

punto2)

DELIMITER $$
CREATE TRIGGER upd_vuelo 
    AFTER UPDATE ON Vuelo
    FOR EACH ROW BEGIN
        IF OLD.ciudadDeOrigen<>NEW.ciudadDeOrigen THEN BEGIN
            INSERT INTO Auditoria_Vuelo (id_vuelo,origen_viejo,origen_nuevo,fecha_mod) VALUES(NEW.ID, OLD.ciudadDeOrigen, NEW.ciudadDeOrigen, NOW());
        END; END IF;
        END$$
DELIMITER ;

CREATE TABLE Auditoria_Vuelo (
id bigint UNSIGNED PRIMARY KEY AUTO_INCREMENT,
id_vuelo bigint ,
origen_viejo VARCHAR(150) NOT NULL,
origen_nuevo VARCHAR(150) NOT NULL,
fecha_mod date
)

punto3)

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `aerolinea`.`vuelosconasientosmayora3` AS
    SELECT 
        `v`.`ID` AS `Numero`,
        `v`.`cantidadEscalas` AS `Escalas`,
        `v`.`ciudadDeOrigen` AS `Origen`,
        `v`.`ciudadDeDestino` AS `Destino`,
        `v`.`duracionDeVuelo` AS `Duracion`,
        `v`.`horarioDePartida` AS `Partida`,
        `v`.`precioBase` AS `Precio`,
        COUNT(`a`.`ID`) AS `Asientos`
    FROM
        ((`aerolinea`.`vuelo` `v`
        JOIN `aerolinea`.`avion_asiento` `aa` ON ((`v`.`avion_ID` = `aa`.`Avion_ID`)))
        JOIN `aerolinea`.`asiento` `a` ON ((`aa`.`asientos_ID` = `a`.`ID`)))
    GROUP BY `v`.`ID`
    HAVING (COUNT(`a`.`ID`) > 3);

punto4) 

ALTER TABLE usuario
MODIFY COLUMN dinero double NOT NULL;
