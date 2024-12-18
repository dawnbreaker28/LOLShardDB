import pandas as pd
import psycopg2
from psycopg2 import sql

# Function to load a .pkl file into a pandas DataFrame
def load_pkl_to_dataframe(file_path):
    """
    Load a .pkl file and convert it into a pandas DataFrame.

    Args:
        file_path (str): Path to the .pkl file.

    Returns:
        DataFrame: A pandas DataFrame containing the data.
    """
    try:
        df = pd.read_pickle(file_path)
        print("Data successfully loaded into DataFrame.")
        print(df.head())  # Display the first few rows for confirmation
        return df
    except Exception as e:
        print(f"Error loading the .pkl file: {e}")
        return None
