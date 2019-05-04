 use sakila;
 
 SELECT first_name, last_name FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS 'Actor_Name'
FROM actor;

SELECT * FROM actor WHERE first_name LIKE 'JOE';

SELECT * FROM actor WHERE last_name LIKE '%GEN%';

SELECT last_name, first_name
FROM actor WHERE last_name LIKE '%LI%';

SELECT country_id, country FROM country;
SELECT
    *
FROM
    country
WHERE
 (country =  'China') or (country =  'Bangladesh') or (country =  'Afghanistan')
ORDER BY
    country_id;
    
ALTER TABLE actor
ADD description_ BLOB;

ALTER TABLE actor
DROP COLUMN description_;

SELECT last_name, count(*) AS "Last Name" FROM actor
group by last_name; 

SELECT last_name, COUNT(*) AS "last name" FROM actor 
GROUP BY last_name HAVING COUNT(*) >1;

SELECT * FROM actor WHERE first_name = "HARPO";

UPDATE actor SET first_name = "HARPO" WHERE actor_id = 172;

UPDATE actor SET first_name = "GROUCHO" WHERE actor_id = 172;

SHOW CREATE TABLE address;

SELECT p.first_name, p.last_name, s.address FROM staff AS p
INNER JOIN adress AS s ON p.address_id = s.address_id; -----

SELECT p.first_name, SUM(s.amount) FROM staff AS p
INNER JOIN payment AS s ON p.staff_id = s.staff_id
WHERE payment_date LIKE "2005-08";

SELECT p.actor_id, s.title FROM film_actor AS p
INNER JOIN film AS s ON p.film_id = s.film_id;

SELECT title, film_id AS "Film Number" FROM film
WHERE title = "Hunckback Impossible"; ---------

SELECT COUNT(inventory_id) FROM inventory WHERE film_id = 439;

SELECT DISTINCT p.first_name, p.last_name, SUM(s.amount) FROM customer AS p
INNER JOIN payment AS s ON p.customer_id = s.customer_id
GROUP BY first_name, last_name ORDER BY last_name ASC;

SELECT NAME. language_id FROM LANGUAGE;

SELECT title FROM film WHERE (title LIKE "k%") OR (title LIKE "Q%") AND (language_id = 1);

SELECT title, film_id FROM film WHERE (title = "Alone Trip");

SELECT p.first_name, p.last_name FROM actor AS p
INNER JOIN film_actor AS s ON p.actor_id = s.actor_id
WHERE (film_id = 17) ORDER BY last_name ASC;

SELECT p.country_id, p.country, s.city_id AS "City" FROM country AS p
INNER JOIN  city AS s ON p.country_id = s.country_id;

SELECT p.address, s.first_name, s.email FROM address AS p-- SALEN 5 NO 7
INNER JOIN customer AS s ON p.address_id = s.address_id
WHERE (city_id = 179) OR
(city_id = 196) OR
(city_id = 300) OR 
(city_id = 313) OR
(city_id = 383) OR
(city_id = 430) OR
(city_id = 565);

SELECT s.title, s.rating FROM film_category AS p
INNER JOIN film AS s ON p.film_id = s.film_id
WHERE (RATING = "PG") OR (RATING = "G"); 

SELECT title, rental_rate FROM film ORDER BY rental_rate DESC;

SELECT p.amount; -- 7f, me falta toda esta.

SELECT p.store_id, s.city_id FROM store AS p
INNER JOIN address AS s ON p.address_id;

SELECT c.store_id, p.city, s.country FROM city AS p 
INNER JOIN country AS s ON p.country_id = s.country_id
WHERE (city_id = 300) OR (city_id = 576); ----------- 7g

SELECT a.NAME AS "Genre", SUM(e.amount) AS "Sum" FROM category AS a 
INNER JOIN film_category AS b ON a.category_id = b.category_id
INNER JOIN inventory AS C on b.film_id = c.film_id
INNER JOIN rental AS d ON c.inventory_id = d.inventory_id 
INNER JOIN payment AS e ON d.rental_id = e.rental_id
GROUP BY NAME 
ORDER BY SUM DESC;

select amount, rental_id
from payment;

CREATE VIEW _top_five_genres AS SELECT a.name AS "Genre", SUM(e.amount) AS "Sum"
FROM category AS a INNER JOIN film_category AS b
ON a.category_id = b.category_id INNER JOIN inventory AS c
ON B.film_id = c.film_id INNER JOIN rental AS d
ON c.inventory_id = d.inventory_id INNER JOIN payment AS e
ON d.rental_id = e.rental_id 
GROUP BY name
ORDER BY SUM DESC;

SELECT *  FROM _top_five_genres;

DROP VIEW sakila._top_five_genres;



  



