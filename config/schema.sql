-- Table: Teams
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    Region VARCHAR(50) NOT NULL
);

-- Table: Players
CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CurrentTeamID INT,
    Role VARCHAR(50) NOT NULL,
    Nationality VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    FOREIGN KEY (CurrentTeamID) REFERENCES Teams(TeamID)
);

-- Table: Matches
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Season VARCHAR(50) NOT NULL,
    BlueTeamID INT NOT NULL,
    RedTeamID INT NOT NULL,
    WinnerID INT NOT NULL,
    Duration INT NOT NULL,
    MatchType VARCHAR(50) NOT NULL,
    FOREIGN KEY (BlueTeamID) REFERENCES Teams(TeamID), 
    FOREIGN KEY (RedTeamID) REFERENCES Teams(TeamID), 
    FOREIGN KEY (WinnerID) REFERENCES Teams(TeamID)
);

-- Table: Champions
CREATE TABLE Champions (
    ChampionID INT PRIMARY KEY,
    ChampionName VARCHAR(50) NOT NULL
);

-- Table: PlayerStats
CREATE TABLE PlayerStats (
    MatchID INT NOT NULL,
    PlayerID INT NOT NULL,
    Kills INT NOT NULL,
    Deaths INT NOT NULL,
    Assists INT NOT NULL,
    ChampionPlayed INT NOT NULL,
    -- Side VARCHAR(10) NOT NULL,
    PRIMARY KEY (MatchID, PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (ChampionPlayed) REFERENCES Champions(ChampionID)
);

-- Table: TeamHistory
CREATE TABLE TeamHistory (
    PlayerID INT NOT NULL,
    TeamID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (PlayerID, TeamID, StartDate),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);
