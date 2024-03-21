CREATE DATABASE punishers_lair_cinima;

CREATE TABLE cinima ( 
cid SERIAL PRIMARY KEY,
address VARCHAR(75));
-- need TO ADD FOREIGN KEY columns NOT sure IF the way I am creating FIRST AND adding AFTER IS best practice 
CREATE TABLE theatre (  
theatre_id SERIAL PRIMARY KEY, 
capacity INT,
cid INT,
FOREIGN KEY (cid) REFERENCES cinima(cid)
);
CREATE TABLE movies ( 
movie_id SERIAL PRIMARY KEY,
movie_name VARCHAR(30),
cid INT,
theatre_id INT,
FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id),
FOREIGN KEY (cid) REFERENCES cinima(cid)
);

CREATE TABLE customers (  
customer_id SERIAL PRIMARY KEY,
fist_name VARCHAR(20),
last_name VARCHAR(25),
loyalty_member BOOL,
ticket_id INT
);



CREATE TABLE tickets ( 
ticket_id SERIAL PRIMARY KEY,
ticket_price NUMERIC(4,2),
movie_id INT,
theatre_id INT,
customer_id INT,
cid int,
FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 

);


-- ======================================================================================
--COMPLETED 
ALTER TABLE customers 
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
;
-- COMPLETED 
ALTER TABLE theatre 
ADD COLUMN movie_id int,
ADD FOREIGN KEY (movie_id) REFERENCES movies(movie_id);
-- COMPLETED
ALTER TABLE cinima 
ADD COLUMN movie_id int,
ADD COLUMN theatre_id int,
ADD FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
ADD FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id);

-- ====================================================================================
