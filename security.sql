-- Active: 1744057336969@@127.0.0.1@3306@fifa_db

-- Step 1: Create the role
CREATE ROLE 'fifa_viewer';

-- Step 2: Grant SELECT privilege to the role for the relevant tables
GRANT SELECT ON fifa_db.Player TO 'fifa_viewer';
GRANT SELECT ON fifa_db.Team TO 'fifa_viewer';
GRANT SELECT ON fifa_db.Nationality TO 'fifa_viewer';
GRANT SELECT ON fifa_db.Position TO 'fifa_viewer';
GRANT SELECT ON fifa_db.PlayerPosition TO 'fifa_viewer';

-- Step 3: Create Users
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'user1pass';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'user2pass';

-- Step 4: Grant the 'fifa_viewer' role to the users
GRANT 'fifa_viewer' TO 'user1'@'localhost';
GRANT 'fifa_viewer' TO 'user2'@'localhost';

-- Step 5: Ensure the users can only use SELECT, no other permissions
-- This step ensures the users are granted only the SELECT permissions
-- and that no additional privileges are given.
-- The role 'fifa_viewer' only has SELECT privileges, so this step is redundant,
-- but it is included for clarity.

-- Grant the 'SELECT' privilege only via the role
GRANT SELECT ON fifa_db.Player TO 'user1'@'localhost';
GRANT SELECT ON fifa_db.Team TO 'user1'@'localhost';
GRANT SELECT ON fifa_db.Nationality TO 'user1'@'localhost';
GRANT SELECT ON fifa_db.Position TO 'user1'@'localhost';
GRANT SELECT ON fifa_db.PlayerPosition TO 'user1'@'localhost';

GRANT SELECT ON fifa_db.Player TO 'user2'@'localhost';
GRANT SELECT ON fifa_db.Team TO 'user2'@'localhost';
GRANT SELECT ON fifa_db.Nationality TO 'user2'@'localhost';
GRANT SELECT ON fifa_db.Position TO 'user2'@'localhost';
GRANT SELECT ON fifa_db.PlayerPosition TO 'user2'@'localhost';

-- Final step: Flush privileges to ensure changes take effect
FLUSH PRIVILEGES;
