# SQL CRUD

An assignment to design relational database tables with particular applications in mind.

The contents of this file will be deleted and replaced with the content described in the [instructions](./instructions.md)


## The SQL code to create each of the required tables

### Restaurants and review table
```SQL
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
```

### Social Media App table creation
```SQL
sqlite3 users_and_posts.db

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    handle TEXT UNIQUE NOT NULL
);



CREATE TABLE posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    post_type TEXT CHECK(post_type IN ('Message', 'Story')) NOT NULL,
    content TEXT NOT NULL,
    recipient_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_visible BOOLEAN DEFAULT 1 NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(recipient_id) REFERENCES users(user_id)
);

```
## A link to each of the practice CSV data files in the data directory.
Here is a link to the CSV of the [posts](https://github.com/dbdesign-students-spring2024/4-sql-crud-VideoStorms/blob/main/data/posts.csv), [resturants](https://github.com/dbdesign-students-spring2024/4-sql-crud-VideoStorms/blob/main/data/restaurants.csv) and [users](https://github.com/dbdesign-students-spring2024/4-sql-crud-VideoStorms/blob/main/data/users.csv). 

## The SQLite code to import the practice CSV data files into the tables.

### Resturants
```SQL
.mode csv

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/data/MOCK_DATA-FOR-RESTURANTS.csv restaurants
```

### Users and posts
```SQL
.mode csv

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/data/users.csv users

.mode csv

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/data/posts.csv posts
```

## The SQL queries that solve each of the tasks you were asked to do. Make it clear which task each query is intended to solve - include the task number and text on the line above the SQL code solution.


### Task 1 Find all cheap restaurants in a particular neighborhood (pick any neighborhood as an example).
```SQL
SELECT * FROM restaurants
WHERE price_tier = 'cheap' AND neighborhood = 'Long Island City';
```
### Task 2 Find all restaurants in a particular genre (pick any genre as an example) with 3 stars or more, ordered by the number of stars in descending order.
```SQL
SELECT * FROM restaurants
WHERE category = 'French' AND average_rating >= 3
ORDER BY average_rating DESC;
```


