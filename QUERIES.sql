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


/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

-- SELECT 
-- 	first_name,
--     last_name,
--     email,
--     store_id
-- FROM staff;
    






/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 

-- SELECT
-- 	store_id,
-- 	COUNT(inventory_id)
-- FROM 
-- 	inventory
-- GROUP BY
-- 	store_id;





/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/

-- SELECT 
-- 	store_id,
--     COUNT(customer_id) AS active
-- FROM 
-- 	customer
-- WHERE 
-- 	active=1
-- GROUP BY 
-- 	store_id;






/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/

-- SELECT 
--     COUNT(email) AS count_of_emails
-- FROM 
-- 	customer;




/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/


-- SELECT
-- 	store_id,
--     COUNT(DISTINCT film_id) AS uniques_films
-- FROM 
-- 	inventory
-- GROUP BY 
-- 	store_id;

-- SELECT
--     COUNT(DISTINCT name) AS uniques_categories
-- FROM 
-- 	category;






/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/

-- SELECT 
-- 	MIN(replacement_cost) AS least_expensive, 
--     MAX(replacement_cost) AS most_expensive, 
--     AVG(replacement_cost) AS average_replacement_cost
-- FROM film;





/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/


-- SELECT
-- 	AVG(amount) AS average_payment, 
--     MAX(amount) AS max_payment
-- FROM payment;


/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

-- SELECT 
-- 	customer_id, 
--     COUNT(rental_id) AS number_of_rentals
-- FROM rental
-- GROUP BY 
-- 	customer_id
-- ORDER BY 
-- 	COUNT(rental_id) DESC;


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


/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 


-- SELECT 
-- 	staff.first_name AS manager_first_name, 
--     staff.last_name AS manager_last_name,
--     address.address, 
--     address.district, 
--     city.city, 
--     country.country

-- FROM store
-- 	LEFT JOIN staff ON store.manager_staff_id = staff.staff_id
--     LEFT JOIN address ON store.address_id = address.address_id
--     LEFT JOIN city ON address.city_id = city.city_id
--     LEFT JOIN country ON city.country_id = country.country_id
-- ;


	
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/


-- SELECT 
-- 	inventory.store_id, 
--     inventory.inventory_id, 
--     film.title, 
--     film.rating, 
--     film.rental_rate, 
--     film.replacement_cost
-- FROM inventory
-- 	LEFT JOIN film
-- 		ON inventory.film_id = film.film_id
-- ;


/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/


-- SELECT 
-- 	inventory.store_id, 
--     film.rating, 
--     COUNT(inventory_id) AS inventory_items
-- FROM inventory
-- 	LEFT JOIN film
-- 		ON inventory.film_id = film.film_id
-- GROUP BY 
-- 	inventory.store_id,
--     film.rating
-- ;


/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 


-- SELECT 
-- 	store_id, 
--     category.name AS category, 
-- 	COUNT(inventory.inventory_id) AS films, 
--     AVG(film.replacement_cost) AS avg_replacement_cost, 
--     SUM(film.replacement_cost) AS total_replacement_cost
--     
-- FROM inventory
-- 	LEFT JOIN film
-- 		ON inventory.film_id = film.film_id
-- 	LEFT JOIN film_category
-- 		ON film.film_id = film_category.film_id
-- 	LEFT JOIN category
-- 		ON category.category_id = film_category.category_id

-- GROUP BY 
-- 	store_id, 
--     category.name
--     
-- ORDER BY 
-- 	SUM(film.replacement_cost) DESC
-- ;


/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/


-- SELECT 
-- 	customer.first_name, 
--     customer.last_name, 
--     customer.store_id,
--     customer.active, 
--     address.address, 
--     city.city, 
--     country.country

-- FROM customer
-- 	LEFT JOIN address ON customer.address_id = address.address_id
--     LEFT JOIN city ON address.city_id = city.city_id
--     LEFT JOIN country ON city.country_id = country.country_id
-- ;




/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/

-- SELECT 
-- 	customer.first_name, 
--     customer.last_name, 
--     COUNT(rental.rental_id) AS total_rentals, 
--     SUM(payment.amount) AS total_payment_amount

-- FROM customer
-- 	LEFT JOIN rental ON customer.customer_id = rental.customer_id
--     LEFT JOIN payment ON rental.rental_id = payment.rental_id

-- GROUP BY 
-- 	customer.first_name,
--     customer.last_name

-- ORDER BY 
-- 	SUM(payment.amount) DESC
--     ;


    
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/


-- SELECT
-- 	'investor' AS type, 
--     first_name, 
--     last_name, 
--     company_name
-- FROM investor

-- UNION 

-- SELECT 
-- 	'advisor' AS type, 
--     first_name, 
--     last_name, 
--     NULL
-- FROM advisor;



/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/

-- SELECT
-- 	CASE 
-- 		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
--         WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
-- 		ELSE '1 award'
-- 	END AS number_of_awards, 
--     AVG(CASE WHEN actor_award.actor_id IS NULL THEN 0 ELSE 1 END) AS pct_w_one_film
-- 	
-- FROM actor_award
-- 	

-- GROUP BY 
-- 	CASE 
-- 		WHEN actor_award.awards = 'Emmy, Oscar, Tony ' THEN '3 awards'
--         WHEN actor_award.awards IN ('Emmy, Oscar','Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
-- 		ELSE '1 award'
-- 	END	