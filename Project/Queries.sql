SELECT 
		*
FROM
		game_sales
ORDER BY
		games_sold DESC
LIMIT
		10;
        
SELECT
		COUNT(g.game)
FROM
		game_sales AS g
LEFT JOIN
		reviews AS r
ON
	g.game = r.game
WHERE
	r.critic_score IS NULL AND r.user_score IS NULL;
    
SELECT
		 g.year AS year,
         ROUND(AVG(r.critic_score), 2) AS avg_critic_score
FROM
		game_sales AS g
INNER JOIN
		reviews AS r
ON
		g.game = r.game
GROUP BY
		g.year
ORDER BY
		avg_critic_score DESC
LIMIT
		10;

SELECT
		 g.year AS year,
         COUNT(g.game) AS num_games,
         ROUND(AVG(r.critic_score), 2) AS avg_critic_score
FROM
		game_sales AS g
INNER JOIN
		reviews AS r
ON
		g.game = r.game
GROUP BY
		g.year
HAVING
		num_games > 4
ORDER BY
		avg_critic_score DESC
LIMIT
		10;
        
SELECT
		year, avg_critic_score
FROM
		top_critic_years
WHERE
		year NOT IN
		(SELECT
				year
		FROM
				top_critic_years_more_than_four_games);
                
SELECT
		 g.year AS year,
         COUNT(g.game) AS num_games,
         ROUND(AVG(r.user_score), 2) AS avg_user_score
FROM
		game_sales AS g
INNER JOIN
		reviews AS r
ON
		g.game = r.game
GROUP BY
		g.year
HAVING
		num_games > 4
ORDER BY
		avg_user_score DESC
LIMIT
		10;
        
SELECT
		c.year, c.avg_critic_score, u.avg_user_score
FROM
		top_critic_years_more_than_four_games AS c
INNER JOIN
		top_user_years_more_than_four_games AS u
USING
		(year);

SELECT
		g.year, SUM(g.games_sold) AS total_games_sold
FROM
		game_sales AS g
WHERE
		g.year IN
				(SELECT
						c.year
				FROM
						top_critic_years_more_than_four_games AS c
				INNER JOIN
						top_user_years_more_than_four_games AS u
				USING
						(year))
GROUP BY
		g.year
ORDER BY
		total_games_sold DESC;