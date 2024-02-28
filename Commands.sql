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
