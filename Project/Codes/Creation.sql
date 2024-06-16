CREATE DATABASE IF NOT EXISTS
							video_game;

CREATE TABLE IF NOT EXISTS 
							game_sales
								  (game VARCHAR(100) PRIMARY KEY,
								  platform VARCHAR(64),
								  publisher VARCHAR(64),
								  developer VARCHAR(64),
								  games_sold NUMERIC(5, 2),
								  year INT);
                              
CREATE TABLE IF NOT EXISTS 
							reviews
								(game VARCHAR(100) PRIMARY KEY,
								critic_score FLOAT,   
								user_score FLOAT);
DROP TABLE REVIEWS;
CREATE TABLE IF NOT EXISTS
							top_critic_years
									(year INT PRIMARY KEY,
									avg_critic_score NUMERIC(4, 2));

CREATE TABLE IF NOT EXISTS
							top_critic_years_more_than_four_games
															(year INT PRIMARY KEY,
															num_games INT,
															avg_critic_score NUMERIC(4, 2));

CREATE TABLE IF NOT EXISTS
							top_user_years_more_than_four_games
															(year INT PRIMARY KEY,
															num_games INT,
															avg_user_score NUMERIC(4, 2));