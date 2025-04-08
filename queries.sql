-- Active: 1744057336969@@127.0.0.1@3306@fifa_db

-- Select top 100 from each table
SELECT * FROM Player LIMIT 100;
SELECT * FROM Nationality LIMIT 100;
SELECT * FROM Team LIMIT 100;
SELECT * FROM Position LIMIT 100;
SELECT * FROM PlayerPosition LIMIT 100;

-- Join statement: Player with Team
SELECT 
    p.PlayerID, p.Name, t.TeamName, p.Overall
FROM 
    Player p
JOIN 
    Team t ON p.TeamID = t.TeamID
LIMIT 100;

-- Aggregate function: Average overall per nationality
SELECT 
    n.NationalityName,
    AVG(p.Overall) AS AvgOverall
FROM 
    Player p
JOIN 
    Nationality n ON p.NationalityID = n.NationalityID
GROUP BY 
    n.NationalityName
ORDER BY 
    AvgOverall DESC
LIMIT 100;
