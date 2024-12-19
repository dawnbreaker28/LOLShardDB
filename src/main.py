from process_data import load_pkl_to_dataframe, apply_column_mapping
from colomn_mapping import COLUMN_MAPPINGS
from db_utils import insert_data

# Define files and database table mappings, order important, need to be strictly followed.
FILES_TO_TABLES = { 
    "teams.pkl": {"table": "Teams", "mapping": "teams"},
    "players.pkl": {"table": "Players", "mapping": "players"},
    
    "matches.pkl": {"table": "Matches", "mapping": "matches"},
    
    "champions.pkl": {"table": "Champions", "mapping": "champions"},
    "playerstats.pkl": {"table": "PlayerStats", "mapping": "playerstats"},
    "teamhistory.pkl": {"table": "TeamHistory", "mapping": "teamhistory"}
}

def process_and_insert():
    """Main function to process pkl files and insert into database."""
    for file_name, config in FILES_TO_TABLES.items():
        print(f"\nProcessing {file_name}...")
        file_path = f"../data/{file_name}"
        
        # Load data
        df = load_pkl_to_dataframe(file_path)
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
