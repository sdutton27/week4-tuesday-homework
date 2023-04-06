-- Simon Dutton
-- Due April 5th, 2023
-- ddl for Movie Theatre
-- creates and alters the tables for the movie theatre db

-- Movies
CREATE TABLE movies(
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    movie_description VARCHAR(500),
    runtime INTEGER,
    rating VARCHAR(5),
    genre VARCHAR(15)
);
--Showings
CREATE TABLE showings(
    showing_id SERIAL PRIMARY KEY,
    movie_id INTEGER,
    when_playing TIMESTAMP WITHOUT TIME ZONE,
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);
--Customers
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    billing_info VARCHAR(70),
    is_child BOOLEAN DEFAULT false,
    is_theatre_member BOOLEAN DEFAULT false,
    birthdate DATE
);
-- Tickets
CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    ticket_price MONEY,
    showing_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY(showing_id) REFERENCES showings(showing_id),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
--Concessions Item
CREATE TABLE concessions_items(
    concessions_item VARCHAR(50) PRIMARY KEY,
    concessions_price MONEY,
    concessions_type VARCHAR(10),
    in_stock BOOLEAN
);
--Concessions Inventory
CREATE TABLE concessions_inventory(
    concessions_inventory_id VARCHAR(50) PRIMARY KEY,
    concessions_item CHAR,
    amount_available INTEGER,
    FOREIGN KEY(concessions_item) REFERENCES concessions_items(concessions_item)
);
--Concessions Sale
CREATE TABLE concessions_sale(
    concessions_sale_id SERIAL PRIMARY KEY,
    concessions_item CHAR,
    concessions_total_cost MONEY,
    customer_id INTEGER,
    FOREIGN KEY(concessions_item) REFERENCES concessions_items(concessions_item),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
--Purchase
CREATE TABLE purchase(
    purchase_id SERIAL PRIMARY KEY,
    ticket_id INTEGER,
    customer_id INTEGER,
    concessions_sale_id INTEGER,
    total_cost MONEY
);


--ALTERING:

--make movies title NOT NULL
ALTER TABLE movies
ALTER COLUMN title SET NOT NULL;

-- set boolean default true in concessions item
ALTER TABLE concessions_items
ALTER COLUMN in_stock SET DEFAULT true;

--ALTER genre to be VARCHAR(30) in movies
ALTER TABLE movies
ALTER COLUMN genre TYPE VARCHAR(30);

--ALTER rename "when playing" to 'showtime' in showings
ALTER TABLE showings
RENAME COLUMN when_playing TO showtime;

--ALTER concessions_item in concessions_sale
ALTER TABLE concessions_sale
ALTER COLUMN concessions_item TYPE VARCHAR(50);

--ALTER concessions_item in concessions_inventory
ALTER TABLE concessions_inventory
ALTER COLUMN concessions_item TYPE VARCHAR(50);

--ALTER concessions_inventory_id
ALTER TABLE concessions_inventory
DROP COLUMN concessions_inventory_id;

ALTER TABLE concessions_inventory
ADD COLUMN concessions_inventory_id SERIAL PRIMARY KEY;

--add column Concessions Location
ALTER TABLE concessions_inventory
ADD COLUMN storage_location VARCHAR(50);

-- drop column concessions_total_cost
ALTER TABLE concessions_sale
DROP COLUMN concessions_total_cost;

-- add default value to customer_id in purchase NOT NULL
ALTER TABLE purchase
ALTER COLUMN customer_id SET NOT NULL;

-- remove table total_cost since we can find that out ourselves using SUM and JOIN/SUBQUERIES
ALTER TABLE purchase
DROP COLUMN total_cost;

--change genre from movie to list - first delete it then remake it
ALTER TABLE movies
DROP COLUMN genre;

ALTER TABLE movies
ADD COLUMN genre VARCHAR(15)[];