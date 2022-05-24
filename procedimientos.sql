-- 1. Histórico de pilotos que han corrido para una escudería dada

DELIMITER $$
CREATE PROCEDURE historico_corredores(nomEscuderia VARCHAR(20))
BEGIN
	SELECT CONCAT(t.nombre, " ", t.apellidos) AS piloto 
	FROM trabajador t
	WHERE t.escuderia = nomEscuderia;
END $$
DELIMITER ;

CALL historico_corredores ('Hass F1 Team');

-- 2. Mostrar el número de poles de un piloto (dado su número) en una temporada dada (utilizando la función num_poles) con el siguiente formato:
-- “piloto” ha conseguido XXXX poles en la temporada XXXX

DELIMITER $$
CREATE PROCEDURE poles_piloto(piloto INT)
BEGIN
	DECLARE resultado VARCHAR(100) DEFAULT "";

	SELECT CONCAT("EL PILOTO CON NÚMERO ", piloto, " HA HECHO ", num_poles (piloto), " POLES");

END $$ 
DELIMITER ;
