-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS PlayerStats CASCADE;
DROP TABLE IF EXISTS Matches CASCADE;
DROP TABLE IF EXISTS TeamHistory CASCADE;
DROP TABLE IF EXISTS Players CASCADE;
DROP TABLE IF EXISTS Teams CASCADE;
DROP TABLE IF EXISTS Champions CASCADE;

-- Teams Table
CREATE TABLE Teams (
    TeamName VARCHAR(100) PRIMARY KEY,
    TeamNameShort VARCHAR(50) NOT NULL,
    Region VARCHAR(50) NOT NULL
);

-- Champions Table
CREATE TABLE Champions (
    ChampionName VARCHAR(100) PRIMARY KEY
);

-- Players Table
CREATE TABLE Players (
    PlayerID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CurrentTeamName VARCHAR(100),
    Nationality VARCHAR(50),
    DateOfBirth DATE
);

-- Matches Table
CREATE TABLE Matches (
    MatchID VARCHAR(50) PRIMARY KEY,
    Date DATE NOT NULL,
    Season VARCHAR(50) NOT NULL,
    BlueTeamName VARCHAR(100) NOT NULL,
    RedTeamName VARCHAR(100) NOT NULL,
    Team1Players VARCHAR(50) ,
    Team2Players VARCHAR(50) ,
    Team1Bans VARCHAR(50),
    Team1Picks VARCHAR(50),
    Team2Bans VARCHAR(50),
    Team2Picks VARCHAR(50),
    WinnerID VARCHAR(100) NOT NULL,
    Duration FLOAT NOT NULL
);

-- PlayerStats Table
CREATE TABLE PlayerStats (
    MatchID VARCHAR(50) NOT NULL,
    PlayerID VARCHAR(50) NOT NULL,
    Kills INT NOT NULL,
    Deaths INT NOT NULL,
    Assists INT NOT NULL,
    Side VARCHAR(50) NOT NULL,
    ChampionPlayed VARCHAR(100) NOT NULL,
    PRIMARY KEY (MatchID, PlayerID)
);

-- TeamHistory Table
CREATE TABLE TeamHistory (
    PlayerID VARCHAR(50) NOT NULL,
    TeamName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (PlayerID, TeamName, StartDate)
);
