# SQL CRUD

An assignment to design relational database tables with particular applications in mind.

The contents of this file will be deleted and replaced with the content described in the [instructions](./instructions.md)


Code used so far

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

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/MOCK_DATA-3.csv restaurants

SELECT * FROM restaurants
WHERE price_tier = 'cheap' AND neighborhood = 'Long Island City';

