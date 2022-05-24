-- Vista 1
CREATE VIEW EscuderiaMasVictorias AS ( 
	SELECT e.nombre AS escuderia, p.num_carreras_ganadas  AS numeroVictorias 
	FROM trabajador t INNER JOIN escuderia e ON t.escuderia = e.nombre
						INNER JOIN pilotos p ON p.DNI_piloto = t.DNI 
	WHERE p.num_carreras_ganadas = (
		SELECT MAX(p.num_carreras_ganadas) 
		FROM pilotos p)
);

-- Vista 2
CREATE VIEW PilotoMasPoles AS (
	SELECT CONCAT(t.nombre," ", t.apellidos) AS piloto, 
count(*) AS numeroPoles
	FROM trabajador t INNER JOIN resultado r ON t.DNI = r.DNI_piloto 
	WHERE r.posicion_clasificacion = 1
	GROUP BY piloto
	ORDER BY COUNT(*) DESC
	LIMIT 1
);


