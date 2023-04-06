-- Simon Dutton
-- Due April 5th, 2023
-- dml for Movie Theatre
-- creates/alters information to store in the tables for the movie theatre db

-- Customers
INSERT INTO customers(
    first_name,
    last_name,
    billing_info,
    is_theatre_member,
    birthdate
) VALUES (
    'Simon',
    'Dutton',
    '123 Fake Ave',
    true,
    'February 27, 1998'
);

INSERT INTO customers(
    first_name,
    last_name,
    billing_info,
    is_child,
    is_theatre_member,
    birthdate
) VALUES (
    'Shoha', 
    'Tsuchida', 
    '456 Fake Ave',
    false,
    true,
    'January 1, 1000'
), (
    'Snoop', 
    'Dogg', 
    '789 Fake Ave',
    true,
    true,
    'April 20, 1970'
), (
    'Kelly', 
    'Clarkson', 
    '1011 Fake Ave',
    false,
    false,
    'March 2, 1985'
), (
    'Johnny', 
    'Doe', 
    '1213 Fake Ave',
    true,
    false,
    'January 1, 2023'
);

INSERT INTO customers(
    customer_id,
    first_name,
    last_name,
    billing_info,
    is_child,
    is_theatre_member,
    birthdate
) VALUES (
    999,
    'Sarah', 
    'Stodder', 
    '1415 Fake Ave',
    false,
    true,
    'October 14, 3000'
);

SELECT * FROM customers;

-- Movies
INSERT INTO movies(
    title,
    runtime,
    movie_description,
    rating,
    genre
) VALUES (
    'Parasite',
    132,
    'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',
    'R',
    'Thriller/Drama'
), (
    'Black Panther: Wakanda Forever',
    161,
    'The people of Wakanda fight to protect their home from intervening world powers as they mourn the death of King T''Challa.',
    'PG-13',
    'Action/Adventure'
), (
    'Three Identical Strangers',
    96,
    'In 1980 New York, three young men who were all adopted meet each other and find out they''re triplets who were separated at birth.',
    'PG-13',
    'Documentary'
), (
    'Eighth Grade',
    93,
    'An introverted teenage girl tries to survive the last week of her disastrous eighth grade year before leaving to start high school.',
    'R',
    'Drama/Comedy'
), (
    'Brigsby Bear',
    97,
    'Brigsby Bear Adventures is a children''s TV show produced for an audience of one: James. When the show abruptly ends, James''s life changes forever, and he sets out to finish the story himself.',
    'PG-13',
    'Comedy/Drama'
), (
    'Mamma Mia! Here We Go Again',
    114,
    'Five years after the events of Mamma Mia! (2008), Sophie prepares for the grand reopening of the Hotel Bella Donna as she learns more about her mother''s past.',
    'PG-13',
    'Musical/Comedy'
), (
    'Yesterday',
    116,
    'A struggling musician realizes he''s the only person on Earth who can remember The Beatles after waking up in an alternate reality where they never existed.',
    'PG-13',
    'Musical/Romance'
), (
    'Spy',
    115,
    'A desk-bound CIA analyst volunteers to go undercover to infiltrate the world of a deadly arms dealer, and prevent diabolical global disaster.',
    'R',
    'Comedy/Action'
);

SELECT * FROM movies;

-- Showings
INSERT INTO showings(
    movie_id,
    showtime
) VALUES (
    1,
    '2023-04-05 18:00:00'
);

INSERT INTO showings(
    movie_id,
    showtime
) VALUES (
    2,
    '2023-04-05 18:30:00'
), (
    3,
    '2023-04-06 11:00:00'
), (
    4,
    '2023-04-06 13:00:00'
), (
    4,
    '2023-04-06 15:40:00'
), (
    5,
    '2023-04-06 20:00:00'
), (
    6,
    '2023-04-07 13:00:00'
), (
    5,
    '2023-04-07 13:20:00'
), (
    2,
    '2023-04-07 18:15:00'
), (
    5,
    '2023-04-07 21:45:00'
);

SELECT * FROM showings;

INSERT INTO concessions_items(
    concessions_item,
    concessions_price,
    concessions_type
) VALUES (
    'Peanut M&Ms',
    '$3.99',
    'Candy'
);

INSERT INTO concessions_items(
    concessions_item,
    concessions_price,
    concessions_type
) VALUES (
    'Popcorn (small)',
    '$4.99',
    'Popcorn'
), (
    'M&Ms',
    '$3.99',
    'Candy'
), (
    'Junior Mints',
    '$3.99',
    'Candy'
), (
    'Popcorn (medium)',
    '$5.99',
    'Popcorn'
), (
    'Coca-Cola',
    '$2.99',
    'Beverage'
), (
    'Popcorn (large)',
    '$6.99',
    'Popcorn'
), (
    'Popcorn (x-large)',
    '$7.99',
    'Popcorn'
), (
    'Bottled Water',
    '$2.99',
    'Beverage'
), (
    'Pink Lemonade',
    '$2.99',
    'Beverage'
);

SELECT * FROM concessions_items;

INSERT INTO concessions_inventory(
    concessions_inventory_id,
    concessions_item,
    amount_available
) VALUES (
    'Theatres 1-20 Concessions',
    'Peanut M&Ms',
    25
);

INSERT INTO concessions_inventory(
    storage_location,
    concessions_item,
    amount_available
) VALUES (
    'Theatres 1-20 Concessions',
    'M&Ms',
    20
), (
    'Theatres 1-20 Concessions',
    'Bottled Water',
    2
), (
    'Theatres 1-20 Concessions',
    'Junior Mints',
    13
), (
    'Theatres 1-20 Concessions',
    'Coca-Cola',
    40
), (
    'Theatres 21-30 Concessions',
    'Peanut M&Ms',
    2
), (
    'Theatres 21-30 Concessions',
    'M&Ms',
    50
), (
    'Theatres 21-30 Concessions',
    'Junior Mints',
    12
), (
    'Theatres 21-30 Concessions',
    'Coca-Cola',
    14
), (
    'Stockroom',
    'Peanut M&Ms',
    350
), (
    'Stockroom',
    'M&Ms',
    250
), (
    'Stockroom',
    'Bottled Water',
    190
);

SELECT * FROM concessions_inventory;

-- removes items from before we added in a storage location
DELETE FROM concessions_inventory WHERE storage_location IS NULL;

-- Tickets
INSERT INTO tickets(
    customer_id,
    showing_id,
    ticket_price
) VALUES (
    1,
    2, 
    '$12.00'
);

INSERT INTO tickets(
    customer_id,
    showing_id,
    ticket_price
) VALUES (
    2,
    2, 
    '$12.00'
), (
    3,
    2, 
    '$7.00'
), (
    4,
    2, 
    '$12.00'
), (
    5,
    2, 
    '$7.00'
), (
    2,
    5, 
    '$12.00'
), (
    3,
    6, 
    '$7.00'
), (
    1,
    4, 
    '$12.00'
), (
    999,
    7, 
    '$12.00'
), (
    3,
    4, 
    '$7.00'
), (
    1,
    1, 
    '$12.00'
);

SELECT * FROM tickets;

-- Concessions Sale
INSERT INTO concessions_sale(
    customer_id,
    concessions_item,
    concessions_total_cost
) VALUES (
    1,
    'Peanut M&Ms',
    '$3.99'
);

-- without concessions_total_cost since that has been deleted
INSERT INTO concessions_sale(
    customer_id,
    concessions_item
) VALUES (
    1,
    'Popcorn (small)'
), (
    2,
    'M&Ms'
), (
    999,
    'Popcorn (large)'
), (
    3,
    'Peanut M&Ms'
), (
    3,
    'Popcorn (medium)'
), (
    3,
    'Popcorn (small)'
), (
    5,
    'Junior Mints'
), (
    5,
    'Pink Lemonade'
), (
    1,
    'Bottled Water'
), (
    2,
    'Coca-Cola'
);

SELECT * FROM concessions_sale;

--Purchase
-- Purchase of concession
INSERT INTO purchase(
    customer_id,
    concessions_sale_id
) VALUES (
    999,
    4
);

--Purchase of ticket
INSERT INTO purchase(
    customer_id,
    ticket_id
) VALUES (
    1,
    1
), (
    1,
    8
), (
    1,
    11
), (
    2,
    2
), (
    2,
    6
), (
    3,
    3
), (
    3,
    7
), (
    4,
    4
), (
    5,
    5
), (
    999,
    9
);

-- More purchases of concessions
INSERT INTO purchase(
    customer_id,
    concessions_sale_id
) VALUES (
    1,
    1
), (
    1,
    2
), (
    2,
    3
), (
    3,
    5
), (
    3,
    6
), (
    3,
    7
), (
    5,
    8
), (
    5,
    9
), (
    1,
    10
), (
    2,
    11
);

-- selects all purchases, ordered by customer, ticket purchases first, then concessions purchases
SELECT * FROM purchase ORDER BY customer_id, ticket_id;

--UPDATE genre to LIST for all movies
UPDATE movies
SET genre = '{Thriller, Drama}'
WHERE movie_id = 1;

UPDATE movies
SET genre = '{Action, Adventure}'
WHERE movie_id = 2;

UPDATE movies
SET genre = '{Documentary}'
WHERE movie_id = 3;

UPDATE movies
SET genre = '{Drama, Comedy}'
WHERE movie_id = 4;

UPDATE movies
SET genre = '{Comedy, Drama}'
WHERE movie_id = 5;

UPDATE movies
SET genre = '{Musical, Comedy}'
WHERE movie_id = 6;

UPDATE movies
SET genre = '{Musical, Romance}'
WHERE movie_id = 7;

UPDATE movies
SET genre = '{Comedy, Action}'
WHERE movie_id = 8;

-- Verify that the list is working by searching for just the movies that are comedies
SELECT *
FROM movies 
WHERE 'Comedy' = ANY(genre);

