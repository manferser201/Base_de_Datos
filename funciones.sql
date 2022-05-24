-- 1. Circuito con más aforo en un año dado

DELIMITER $$
CREATE FUNCTION mas_aforo(temporada INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(100);

	SELECT MAX(c.aforo) INTO resultado
	FROM circuito c INNER JOIN carrera c1 ON c.nombre = c1.nombre_circuito 
	WHERE c1.temporada = temporada;

	RETURN resultado ;
END $$ 
DELIMITER ;

SELECT mas_aforo(2021);

-- 2. Muestra el número de poles de un piloto recibiendo su número

DELIMITER $$
CREATE FUNCTION num_poles(piloto INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE resultado INT;

	SELECT COUNT(*) INTO resultado 
	FROM pilotos p INNER JOIN resultado r ON p.numero = r.numero_piloto
	WHERE r.posicion_clasificacion = 1 AND r.numero_piloto = piloto
	GROUP BY r.numero_piloto ;

	RETURN resultado ;
END $$ 
DELIMITER ;

SELECT num_poles(44);


