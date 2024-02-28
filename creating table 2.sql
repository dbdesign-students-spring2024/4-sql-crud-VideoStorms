sqlite3 users_and_posts.db

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    handle TEXT UNIQUE NOT NULL
);

.mode csv

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/data/users.csv users

CREATE TABLE posts (
    post_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    post_type TEXT CHECK(post_type IN ('Message', 'Story')) NOT NULL,
    content TEXT NOT NULL,
    recipient_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(recipient_id) REFERENCES users(user_id)
);

.mode csv

.import /Users/raresgrecu/Documents/School/Database_Design/4-sql-crud-VideoStorms/data/posts.csv posts
