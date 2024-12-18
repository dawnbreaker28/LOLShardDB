from process_data import load_pkl, apply_column_mapping
from column_mapping import COLUMN_MAPPINGS
from db_utils import insert_data

# Define files and database table mappings
FILES_TO_TABLES = {
    "playerstats.pkl": {"table": "PlayerStats", "mapping": "playerstats"},
    # "matches.pkl": {"table": "Matches", "mapping": "matches"},
    # "teams.pkl": {"table": "Teams", "mapping": "teams"},
    # "champions.pkl": {"table": "Champions", "mapping": "champions"},
    # "players.pkl": {"table": "Players", "mapping": "players"},
    # "teamhistory.pkl": {"table": "TeamHistory", "mapping": "teamhistory"}
}

def process_and_insert():
    """Main function to process pkl files and insert into database."""
    for file_name, config in FILES_TO_TABLES.items():
        print(f"\nProcessing {file_name}...")
        file_path = f"../data/{file_name}"
        
        # Load data
        df = load_pkl(file_path)
        if df is None:
            continue

        # Apply column mapping
        column_mapping = COLUMN_MAPPINGS[config["mapping"]]
        df = apply_column_mapping(df, column_mapping)

        # Insert into database
        table_name = config["table"]
        insert_data(df, table_name, columns=list(column_mapping.values()))

if __name__ == "__main__":
    process_and_insert()
