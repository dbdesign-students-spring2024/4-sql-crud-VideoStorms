INSERT INTO users (email, password, handle) VALUES ('newuser@example.com', 'password123', 'newuserhandle');

INSERT INTO posts (user_id, post_type, content, recipient_id) VALUES (1, 'Message', 'This is a message content.', 2);

INSERT INTO posts (user_id, post_type, content) VALUES (1, 'Story', 'This is a story content.');

SELECT * FROM posts WHERE post_type IN ('Message', 'Story') ORDER BY created_at DESC LIMIT 10;

SELECT * FROM posts WHERE post_type = 'Message' AND user_id = 1 AND recipient_id = 2 ORDER BY created_at DESC LIMIT 10;

UPDATE posts SET is_visible = 'No' WHERE post_type = 'Story' AND created_at <= datetime('now', '-1 day');

UPDATE posts SET is_visible = 'No' WHERE post_type = 'Story' AND created_at <= datetime('now', '-1 day');

SELECT * FROM posts WHERE is_visible = 'No' ORDER BY created_at DESC;

SELECT p.content, u.email FROM posts p JOIN users u ON p.user_id = u.user_id WHERE p.created_at >= datetime('now', '-1 day');

SELECT user_id, COUNT(*) AS post_count FROM posts GROUP BY user_id;

SELECT email FROM users WHERE user_id NOT IN (SELECT DISTINCT user_id FROM posts);

