LOAD DATA INFILE
				'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/game_sales.csv'
INTO TABLE
				game_sales
FIELDS TERMINATED BY
					','
ENCLOSED BY
					'"'
LINES TERMINATED BY
					'\n'
IGNORE
					1 ROWS;
				
LOAD DATA INFILE
				'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/game_reviews.csv'
INTO TABLE
				reviews
FIELDS TERMINATED BY
					','
ENCLOSED BY
					'"'
LINES TERMINATED BY
					'\n'
IGNORE
					1 ROWS
(game, @critic_score, @user_score)
SET
	critic_score = NULLIF(@critic_score, ''),
    user_score = NULLIF(@user_score, '');
                    
LOAD DATA INFILE
				'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/top_critic_scores.csv'
INTO TABLE
				top_critic_years
FIELDS TERMINATED BY
					','
ENCLOSED BY
					'"'
LINES TERMINATED BY
					'\n'
IGNORE
					1 ROWS;

LOAD DATA INFILE
				'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/top_critic_scores_more_than_four_games.csv'
INTO TABLE
				top_critic_years_more_than_four_games
FIELDS TERMINATED BY
					','
ENCLOSED BY
					'"'
LINES TERMINATED BY
					'\n'
IGNORE
					1 ROWS;

LOAD DATA INFILE
				'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/top_user_scores_more_than_four_games.csv'
INTO TABLE
				top_user_years_more_than_four_games
FIELDS TERMINATED BY
					','
ENCLOSED BY
					'"'
LINES TERMINATED BY
					'\n'
IGNORE
					1 ROWS;