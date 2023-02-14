-- USE mavenmovies;

-- SELECT * 
-- FROM actor;

-- SELECT
-- 	customer_id,
-- 	rental_id,
-- 	amount,
-- 	payment_date 
-- FROM payment 
-- WHERE customer_id=5
-- 	  OR customer_id=29
--    OR customer_id=11;

-- SELECT
-- 	customer_id,
-- 	rental_id,
-- 	amount,
-- 	payment_date 
-- FROM payment 
-- WHERE customer_id=5
-- 	 AND customer_id=29
--   AND customer_id=11;


-- SELECT
-- 	customer_id,
-- 	rental_id,
-- 	amount,
-- 	payment_date 
-- FROM payment 
-- WHERE customer_id IN (42,53,60,75);

-- SELECT
-- 	title,
--     description
-- FROM film
-- WHERE title LIKE "ALADDIN CALENDAR";

-- SELECT
-- 	title,
--     description
-- FROM film
-- WHERE title NOT LIKE "_LADDIN CALENDAR";

-- SELECT
-- 	title,
-- 	special_features
-- FROM film
-- WHERE special_features LIKE "%Behind the Scenes%";

-- SELECT
-- 	rating ,
--     COUNT(film_id)
-- FROM film
-- GROUP BY rating; 

-- SELECT
-- 	rating ,
--     COUNT(film_id)
-- FROM film
-- GROUP BY rating; 

-- SINGLE LINE COMMENT
/*MULTILINE
COMMENT*/

-- SELECT
-- 	rating ,
--     COUNT(film_id) AS count_of_film_with_this_rating
-- FROM film
-- GROUP BY rating; 

-- SELECT
-- 	rental_duration,
--     COUNT(film_id) AS films_with_this_rental_duration
-- FROM film
-- GROUP BY rental_duration;

-- SELECT
--     rental_duration,
--     rating,
--     replacement_cost,
--     COUNT(film_id)
-- FROM film
-- GROUP BY 
-- 	rating,
--     replacement_cost,
--     rental_duration;

-- SELECT
-- 	rating,
--     COUNT(film_id) AS count_of_films,
--     MIN(length) AS shortest_films,
-- 	MAX(length) AS longest_films,
-- 	AVG(length) AS average_length_of_films,
--     AVG(rental_duration) AS rental_duration_of_films
-- FROM film
-- GROUP BY
-- 	rating;

-- SELECT
-- 	replacement_cost,
--  COUNT(film_id) AS number_of_films,
--  MIN(rental_rate) AS cheapest_rental,
-- 	MAX(rental_rate) AS most_expensive_rental,
-- 	AVG(rental_rate) AS average_rental
-- FROM film
-- GROUP BY
-- 	replacement_cost;

-- SELECT
-- 	customer_id,
--     COUNT(rental_id) AS total_rentals
-- FROM rental
-- GROUP BY
-- 	customer_id
-- HAVING COUNT(rental_id)=25;

-- SELECT
-- 	customer_id,
--  COUNT(rental_id) AS total_rentals
-- FROM rental
-- GROUP BY
-- 	customer_id
-- HAVING COUNT(rental_id)<15;

-- SELECT 
-- 	customer_id,
--     rental_id,
--     amount,
--     payment_date
-- FROM payment
-- ORDER BY amount, customer_id DESC;

-- SELECT 
-- 	customer_id,
--     SUM(amount) as total_payment_amount
-- FROM payment
-- GROUP BY 
-- 	customer_id
-- ORDER BY 
-- 	SUM(amount) DESC;

-- SELECT 
-- 	title,
--     length,
--     rental_rate
-- FROM film
-- ORDER BY 
-- 	length DESC;

-- SELECT DISTINCT 
-- 	length,
--     CASE 
-- 		WHEN length<60 THEN 'under 1 hrs'
--         WHEN length<90 THEN 'under 1-1.5 hrs'
--         WHEN length>60 THEN 'over 2 hrs'
--         ELSE 'uh oh...check logic!'
-- 	END AS length_bucket
-- FROM film;

-- SELECT DISTINCT 
-- 	title,
--     CASE 
-- 		WHEN rental_duration<4 THEN 'rental_too_short'
--         WHEN rental_rate>=3.99 THEN 'too_expensive'
--         WHEN rating IN('NC-17','R') THEN 'too adult'
--         WHEN length NOT BETWEEN 60 AND 90 THEN 'too_short_or_too_long'
--         WHEN description LIKE '%Shark%' THEN 'nope_has_sharks'
--         ELSE 'great_reco_for_my_niece'
-- 	END AS fit_for_recommendation,
--     CASE 
-- 		WHEN description LIKE '%Shark%' THEN 'nope_has_sharks'
-- 		WHEN length NOT BETWEEN 60 AND 90 THEN 'too_short_or_too_long'
-- 		WHEN rating IN('NC-17','R') THEN 'too adult'
-- 		WHEN rental_duration<4 THEN 'rental_too_short'
--         WHEN rental_rate>=3.99 THEN 'too_expensive'
--         ELSE 'great_reco_for_my_niece'
-- 	END AS reordered_reco
-- FROM film;

-- SELECT 
-- 	first_name,
--     last_name,
--     CASE 
-- 		WHEN store_id=1 AND active=1 THEN 'store 1 active'
--         WHEN store_id=1 AND active=0 THEN 'store 1 inactive'
--         WHEN store_id=2 AND active=1 THEN 'store 2 active'
--         WHEN store_id=2 AND active=0 THEN 'store 2 inactive'
--         ELSE 'uh oh...check logic!'
-- 	END AS store_and_status
-- FROM customer;

-- SELECT 
--     film_id,
--     COUNT(CASE WHEN store_id=1 THEN inventory_id ELSE NULL END) AS count_of_store_1_inventory,
-- 	COUNT(CASE WHEN store_id=2 THEN inventory_id ELSE NULL END) AS count_of_store_2_inventory
-- FROM inventory
-- GROUP BY film_id
-- ORDER BY film_id;

-- SELECT
--     store_id,
--     COUNT(CASE WHEN active=1 THEN customer_id ELSE NULL END) AS active, 
-- 	COUNT(CASE WHEN active=0 THEN customer_id ELSE NULL END) AS inactive
-- FROM customer
-- GROUP BY store_id;

-- SELECT *
-- FROM rental
-- INNER JOIN customer
-- 		ON rental.customer_id=customer.customer_id; 

-- SELECT 
-- 	DISTINCT inventory.inventory_id
-- FROM inventory
-- 	INNER JOIN rental
-- 		ON inventory.inventory_id=rental.inventory_id;

-- SELECT 
-- 	rental_id
-- FROM inventory
-- 	INNER JOIN rental
-- 		ON inventory.inventory_id=rental.inventory_id;

-- SELECT 
-- 	DISTINCT inventory.inventory_id
-- FROM inventory
-- 	INNER JOIN rental
-- 		ON inventory.inventory_id=rental.inventory_id
-- LIMIT 5000;

-- SELECT 
-- 	inventory_id,
--     store_id,
--     film.title,
--     film.description
-- FROM inventory
-- 	INNER JOIN film
-- 		ON inventory.film_id=film.film_id;

-- SELECT 
-- 	actor.first_name,
--     actor.last_name,
--     COUNT(film_actor.film_id) AS number_of_films
-- FROM actor
-- 	LEFT JOIN film_actor
-- 		ON actor.actor_id=actor.actor_id
-- GROUP BY 
-- 	actor.first_name,
--     actor.last_name;

-- SELECT DISTINCT inventory_id FROM inventory LIMIT 5000;

-- SELECT DISTINCT inventory_id FROM rental LIMIT 5000;

-- SELECT DISTINCT
-- 	inventory.inventory_id,
--     rental.inventory_id
-- FROM inventory
-- 	INNER JOIN rental
-- 		ON inventory.inventory_id=rental.inventory_id
-- LIMIT 5000;

-- SELECT DISTINCT
-- 	inventory.inventory_id,
--     rental.inventory_id AS rental_inventory_id 
-- FROM inventory
-- 	LEFT JOIN rental
-- 		ON inventory.inventory_id=rental.inventory_id
-- LIMIT 5000;

-- SELECT 
--     film.title,
--     COUNT(actor_id) AS number_of_actors
-- FROM film
-- 	LEFT JOIN film_actor
-- 		ON film.film_id=film_actor.film_id
-- GROUP BY film.title;

-- SELECT
-- 	'advisor' AS type,
--     first_name,
--     last_name
-- FROM advisor

-- UNION 

-- SELECT
-- 	'investor' AS type,
--     first_name,
--     last_name
-- FROM investor;
-- ;

-- UNION ALL for duplicacy 

-- SELECT
-- 	'advisor' AS type,
--     first_name,
-- 	last_name
-- FROM advisor
-- 	
-- UNION

-- SELECT
-- 	'staff' AS type,
--     first_name,
-- 	last_name
-- FROM staff;

-- SELECT 
-- 	film.film_id,
--     film.title,
--     category.name AS category_name
-- FROM film
-- 	INNER JOIN film_category
-- 		ON film.film_id=film_category.film_id
-- 	INNER JOIN category
-- 		ON film_category.category_id=category.category_id;

-- SELECT 
--     first_name AS actor_first_name,
--     last_name AS actor_last_name,
--     film.title AS film_title
-- FROM actor
-- 	INNER JOIN film_actor
-- 		ON actor.actor_id=film_actor.actor_id
-- 	INNER JOIN film
-- 		ON film_actor.film_id=film.film_id;

-- SELECT DISTINCT 
-- 	film.title,
--     film.description
-- FROM film
-- 	INNER JOIN inventory
-- 		ON inventory.film_id=film.film_id
-- WHERE inventory.store_id=2;

-- SELECT DISTINCT 
-- 	film.title,
--     film.description
-- FROM film
-- 	INNER JOIN inventory
-- 		ON inventory.film_id=film.film_id
--         AND inventory.store_id=2;
