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
        "Date": "Date",
        "Winner": "WinnerID",
        "Duration": "Duration"
    },
    "teams": {
        "TeamName": "TeamName",
        "Region": "Region"
    },
    "champions": {
        "ChampionName": "ChampionName",
        "Role": "Role"
    },
    "players": {
        "PlayerName": "PlayerName",
        "TeamName": "TeamName",
        "Role": "Role",
        "Nationality": "Nationality",
        "DateOfBirth": "DateOfBirth"
    },
    "teamhistory": {
        "TeamName": "TeamName",
        "Season": "Season",
        "Wins": "Wins",
        "Losses": "Losses"
    }
}
