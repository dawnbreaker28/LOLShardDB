CREATE TABLE Players (
	PlayerID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	CurrentTeamName INT,
	Nationality VARCHAR(50) NOT NULL,
	DateOfBirth DATE NOT NULL,
	FOREIGN KEY (CurrentTeamName) REFERENCES Teams(TeamName)
);

CREATE TABLE Teams (
	TeamName VARCHAR(100) NOT NULL,
	TeamNameShort VARCHAR(50) NOT NULL,
	Region VARCHAR(50) NOT NULL
);

CREATE TABLE Matches (
	MatchID INT PRIMARY KEY,
	Date DATE NOT NULL,
	Season VARCHAR(50) NOT NULL,
	BlueTeamName INT NOT NULL,
	RedTeamName INT NOT NULL,
	Team1Players VARCHAR(50) NOT NULL,
	Team2Players VARCHAR(50) NOT NULL,
	Team1Bans VARCHAR(50) NOT NULL,
	Team1Picks VARCHAR(50) NOT NULL,
	Team2Bans VARCHAR(50) NOT NULL,
	Team2Picks VARCHAR(50) NOT NULL,
	WinnerID INT NOT NULL,
	Duration INT NOT NULL,
	FOREIGN KEY (BlueTeamName) REFERENCES Teams(TeamName), 
    FOREIGN KEY (RedTeamName) REFERENCES Teams(TeamName), 
    FOREIGN KEY (WinnerName) REFERENCES Teams(TeamName)
);

CREATE TABLE PlayerStats (
   	MatchID INT NOT NULL,
    PlayerID INT NOT NULL,
    Kills INT NOT NULL,
    Deaths INT NOT NULL,
    Assists INT NOT NULL,
    Side VARCHAR(50) NOT NULL,
    ChampionPlayed INT NOT NULL,
    PRIMARY KEY (MatchID, PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (ChmpionPlayed) REFERENCES Champions(ChampionID)
);

CREATE TABLE Champions (
	ChampionName VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE TeamHistory (
    PlayerID INT NOT NULL,
    TeamName INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (PlayerID, TeamName, StartDate),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (TeamName) REFERENCES Teams(TeamName)
);
