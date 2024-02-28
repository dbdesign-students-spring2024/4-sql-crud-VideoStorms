SELECT * FROM restaurants
WHERE price_tier = 'cheap' AND neighborhood = 'Long Island City';


SELECT * FROM restaurants
WHERE category = 'French' AND average_rating >= 3
ORDER BY average_rating DESC;

SELECT * 
FROM restaurants 
WHERE '18:00' BETWEEN opening_hours AND closing_hours;

INSERT INTO reviews (restaurant_id, review_text, rating) 
VALUES (5, 'Great experience, will definitely come back!', 5);

DELETE FROM restaurants 
WHERE good_for_kids = 0;

SELECT neighborhood, COUNT(*) AS num_restaurants 
FROM restaurants 
GROUP BY neighborhood;

