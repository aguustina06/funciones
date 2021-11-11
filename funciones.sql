-- DEF!. 1) nombre de series con su genero

--traemos toda la serie con el *
/*SELECT series.title, name, ranking, episode.title
FROM series
IINER JOIN (me traigo otra tabla y despues le digo cómo estan vinculadas) genres ON genres.id = series.genre_id (es el nombre de la columna, qué alberga en esa columna? el id)
INNER JOIN seasons ON seasons.serie_id = series.id
INNER JOIN episodes ON episodes.season_id = seasons.id*/

SELECT title, name
FROM series AS s (cambio el nombre de series por s)
IINER JOIN genres ON genres.id = series.genre_id


--WHERE title like "T%"(los titulos con T)

--el WHERE solo se puede usar una vez x petiicion



-- 2)titulo de episodio con nombre de actores

SELECT  episodes.title (el titulo), first_name, last_name
FROM episodes (del episodio)
INNER JOIN actor_episode ON actor_episode.apisode_id = episodes.id
INNER JOIN actors ON actor.id = actor_episode.actor_id



-- 3) TODOS LOS ACTORES Y ACTRICES(NOM Y AP) QUE TRAB. EN CUALQUIER PELI DE LA GUERRA DE LAS GALAXIAS. SOLO UNA SOLA VEZ CADA ACTOR/ACTIRZ!

SELECT DISTINCT first_name, last_name
FROM actors
INNER JOIN actor_movie ON actors.id = actor_movie.actor_id
INNER JOIN movies ON movie.id = actor_movie.movie_id (relacion entre actores y pelis)
WHERE movies.title LIKE "%galaxias%" (LIKE sierta parte de un texto)

 -- M.D 3) listar los titulos de cada pelii con su genero. si no tiene genero, se muestre "no tiene genero"

SELECT title, COALESCE(name, "no tiene genero")
FROM movies
INNER JOIN genres ON  movies.genre_id = genres.id


-- M.D 4) de cada serie la acantidad de dias desde su estreno hasta su fin. la columna que mostrará la cantidad se renombrara "duracion"

SELECT title, DATEDIFF(end_date, realease_date) AS "Duracion"
FROM series



-- M.D 5) --actores alfabeticamente, con n0ombre mayor a 6 caracteres.
SELECT *
FROM actors
WHERE LENGTH(first_name) > 6 (LENGTH para sabeR TANTOS CARACTERES)
ORDER BY first_name

-- cantidad de series en la base de datos
SELECT COUNT(*) AS "cantidad de episodios"
FROM episodes


-- titulo de todas las series y el total de temporadas de c/u
SELECT series.title, COUNT(seasons.id)
FROM series
INNER JOIN seasons ON seasons.series_id = series.id
GROUP BY series.title


-- por cada genero cantidad de pelis que tiene, mayor o igual a 3
SELECT name, COUNT(movies.title)
FROM genres
INNER JOIN movies ON genres.id = movies.genres_id
--WHERE COUNT(movies.title) >= 3 ( > 2)
GROUP BY name
HAVING COUNT(movies.title) >= 3 ( > 2) 
--HAVING se usa con GROUP BY




/*Un carácter comodín se utiliza para sustituir cualquier otro carácter en una cadena. Los caracteres comodín se utilizan con el operador SQL LIKE. El operador LIKE se utiliza en una cláusula WHERE para buscar un patrón específico en una columna. Hay dos comodines utilizados junto con el operador LIKE:

"%": El signo de porcentaje representa cero, uno o varios caracteres
"_"  El subrayado representa un solo carácter*/
