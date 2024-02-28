sqlite3 resturants_and_reviews.db
    
CREATE TABLE restaurants (
    restaurant_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price_tier TEXT NOT NULL,
    neighborhood TEXT NOT NULL,
    opening_hours TEXT NOT NULL,
    closing_hours TEXT NOT NULL,
    average_rating REAL NOT NULL,
    good_for_kids BOOLEAN NOT NULL
);

.mode csv

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/data/MOCK_DATA-3.csv restaurants

CREATE TABLE reviews (
    review_id INTEGER PRIMARY KEY,
    restaurant_id INTEGER NOT NULL,
    review_text TEXT NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);

INSERT INTO reviews (restaurant_id, review_text, rating)
VALUES 
(1, 'Despite the promising menu, my experience at The Seafood Nonet was underwhelming. The dishes lacked the authentic Greek flavor I was anticipating, and the service was slower than expected. It pains me to say this, as I usually enjoy supporting local eateries, but it''s unlikely I''ll return.', 2),
(6, 'Visited The Shrimp Shack with family over the weekend. The kids'' menu was a pleasant surprise, offering a good range of options for the little ones. The Thai flavors were authentic, but some dishes were a tad too spicy for our taste. Service was commendable, but given the price point, I was expecting a bit more on the presentation and ambiance side. A solid choice for families, but there''s room for improvement to truly justify the ''expensive'' tag.', 3);