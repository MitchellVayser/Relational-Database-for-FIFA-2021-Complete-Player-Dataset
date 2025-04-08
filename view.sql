-- Active: 1744057336969@@127.0.0.1@3306@fifa_db

CREATE VIEW PlayerOverview AS
SELECT 
    p.Name,
    t.TeamName,
    n.NationalityName,
    p.Overall,
    p.Age,
    p.Potential
FROM 
    Player p
JOIN 
    Team t ON p.TeamID = t.TeamID
JOIN 
    Nationality n ON p.NationalityID = n.NationalityID;
