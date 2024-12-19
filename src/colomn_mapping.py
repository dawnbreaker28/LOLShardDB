# Mapping configuration for each pkl file
COLUMN_MAPPINGS = {
    "playerstats": {
        "GameId": "MatchID",
        "Name": "PlayerID",
        "Kills": "Kills",
        "Deaths": "Deaths",
        "Assists": "Assists",
        "Champion": "ChampionPlayed",
    },
    "matches": {
        "GameId": "MatchID",
        "DateTime UTC": "Date",
        "DST": "Season",
        "Team1": "BlueTeamName",
        "Team2": "RedTeamName",
        "WinTeam": "WinnerID",
        "Gamelength Number": "Duration"
    }, 
    "teams": {
        "Name": "TeamName",
        "Short": "TeamNameShort",
        "Region": "Region"
    },
    "champions": {
        "Name": "ChampionName",
    },
    "players": {
        "ID": "PlayerID",
        "Name": "Name",
        "TeamLast": "CurrentTeamName",
        "Birthdate": "DateOfBirth",
        "Nationality": "Nationality",
        # "DateOfBirth": "DateOfBirth"
    },
    "teamhistory": {
        "ID": "PlayerID",
        "TeamName": "TeamName",
        "StartDate": "StartDate",
        "EndDate": "EndDate"
    }
}
