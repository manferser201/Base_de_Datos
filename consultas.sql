-- 1. Piloto con más poles (posición 1 en la clasificación)
SELECT CONCAT(t.nombre," ", t.apellidos) AS piloto, count(*) AS numeroPoles
FROM trabajador t INNER JOIN resultado r ON t.DNI = r.DNI_piloto 
WHERE r.posicion_clasificacion = 1
GROUP BY piloto
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 2. Dueños de las escuderías.

SELECT CONCAT(t.nombre," ", t.apellidos) AS dueño, e.nombre AS escuderia
FROM trabajador t INNER JOIN escuderia e ON e.nombre = t.escuderia 
WHERE t.puesto = "dueño";

-- 3. Circuito con más aforo en 2021

SELECT c2.nombre AS circuito, c2.aforo 
FROM carrera c INNER JOIN circuito c2 ON c.nombre_circuito = c2.nombre 
			INNER JOIN temporada t ON c.temporada = t.anio
WHERE c.temporada = 2021 AND c2.aforo = (
	SELECT MAX(c2.aforo) 
	FROM carrera c INNER JOIN circuito c2 
ON c.nombre_circuito = c2.nombre 
			INNER JOIN temporada t ON c.temporada = t.anio
	WHERE c.temporada = 2021
);

-- 4. Escudería con más victorias en 2021

SELECT e.nombre AS escuderia, 
p.num_carreras_ganadas  AS numeroVictorias 
FROM trabajador t INNER JOIN escuderia e ON t.escuderia = e.nombre
			INNER JOIN pilotos p ON p.DNI_piloto = t.DNI 
WHERE p.num_carreras_ganadas = (
	SELECT MAX(p.num_carreras_ganadas) 
	FROM pilotos p
);

-- 5. Número de temporadas ganadas por Ferrari

SELECT COUNT(*) AS numeroVictorias
FROM escuderia e INNER JOIN temporada t2 ON e.nombre = t2.escuderia_ganadora 
WHERE t2.escuderia_ganadora LIKE "Ferrari";

