--WEEK 4 day 3 HOMEWORK 

--QUESTIONS number 1  answer: 5 customers in Texas

SELECT customer.first_name, customer.last_name, address.district
FROM customer 
JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--QUESTION NUMBER 2
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY AMOUNT desc;

--QUESTION NUMBER 3
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer_id IN 
    (SELECT customer_id
    FROM payment 
    GROUP BY customer_id
    HAVING SUM(amount)> 175);

--QUESTION NUMBER 4 
SELECT first_name, last_name, country
FROM customer
JOIN address
ON address.address_id = customer.address_id 
JOIN city 
ON address.city_id  = city.city_id
JOIN country
ON city.country_id  = country.country_id
WHERE country = 'Nepal'

--QUESTION NUMBER 5 
SELECT staff.first_name, staff.last_name, COUNT(payment.staff_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment.staff_id) DESC
LIMIT 1; 

--QUESTION NUMBER 6
SELECT rating, COUNT(title)
FROM film
GROUP BY rating;

--QUESTION NUMBER 7
SELECT customer.first_name, customer.last_name
FROM customer 
WHERE customer_id IN
    (SELECT customer_id
    FROM payment
    WHERE amount >6.99
    GROUP BY customer_id);

--QUESTION NUMBER 8
SELECT COUNT(amount)
FROM payment
WHERE amount = 0 OR NULL