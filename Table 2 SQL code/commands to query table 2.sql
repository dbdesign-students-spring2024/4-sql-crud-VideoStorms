INSERT INTO users (email, password, handle) 
VALUES ('newuser@example.com', 'password123', 'newuserhandle');

INSERT INTO posts (user_id, post_type, content, recipient_id) 
VALUES (1, 'Message', 'This is a message content.', 2);

INSERT INTO posts (user_id, post_type, content) 
VALUES (1, 'Story', 'This is a story content.');

SELECT * FROM posts 
WHERE post_type IN ('Message', 'Story') 
ORDER BY created_at DESC LIMIT 10;

SELECT * FROM posts 
WHERE post_type = 'Message' AND user_id = 1 AND recipient_id = 2 
ORDER BY created_at DESC LIMIT 10;

UPDATE posts SET is_visible = '0' 
WHERE post_type = 'Story' AND ROUND((JULIANDAY('now') - JULIANDAY(created_at)) * 24) > 24;

SELECT * FROM posts 
WHERE is_visible = '0' 
ORDER BY created_at DESC;

SELECT users.user_id, users.email, COUNT(posts.post_id) AS num_posts
FROM users
LEFT JOIN posts ON users.user_id = posts.user_id
GROUP BY users.user_id;

SELECT posts.content, users.email
FROM posts
JOIN users ON posts.user_id = users.user_id
WHERE ROUND((JULIANDAY('now') - JULIANDAY(posts.created_at)) * 24) <= 24;

SELECT users.email
FROM users
LEFT JOIN posts ON users.user_id = posts.user_id
WHERE posts.post_id IS NULL;


