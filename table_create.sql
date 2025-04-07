-- Active: 1744057336969@@127.0.0.1@3306@fifa_db
-- Make sure you're in the right database
USE fifa_db;

-- 1. Team Table
CREATE TABLE Team (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Nationality Table
CREATE TABLE Nationality (
    NationalityID INT PRIMARY KEY AUTO_INCREMENT,
    NationalityName VARCHAR(100) NOT NULL UNIQUE
);

-- 3. Position Table
CREATE TABLE `Position` (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(10) NOT NULL UNIQUE
);

-- 4. Player Table
CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Overall INT,
    Potential INT,
    Hits INT,
    NationalityID INT,
    TeamID INT,
    FOREIGN KEY (NationalityID) REFERENCES Nationality(NationalityID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- 5. PlayerPosition Table (Many-to-Many between Player and Position)
CREATE TABLE PlayerPosition (
    PlayerID INT,
    PositionID INT,
    PRIMARY KEY (PlayerID, PositionID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

