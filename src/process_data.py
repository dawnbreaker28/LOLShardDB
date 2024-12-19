import pandas as pd
import psycopg2
from psycopg2 import sql
import pickle

# Function to load a .pkl file into a pandas DataFrame
def load_pkl_to_dataframe(file_path):
    """
    Load a .pkl file and ensure it is converted to a Pandas DataFrame.
    """
    try:
        # Load data from pickle file
        with open(file_path, "rb") as file:
            data = pickle.load(file)
        
        # If data is a list, convert it to a DataFrame
        if isinstance(data, list):
            data = pd.DataFrame(data)

        print("Data successfully loaded into DataFrame:")
        print(data.head())  # Verify first rows
        return data

    except Exception as e:
        print(f"Error loading the .pkl file: {e}")
        return None

def apply_column_mapping(dataframe: pd.DataFrame, mapping: dict) -> pd.DataFrame:
    """
    Apply column mapping to rename DataFrame columns and handle missing columns.

    Args:
        dataframe (pd.DataFrame): The input DataFrame.
        mapping (dict): A dictionary mapping original column names to new column names.

    Returns:
        pd.DataFrame: The DataFrame with renamed columns and added missing columns.
    """
    # Drop rows where 'Name' is null, only if 'Name' exists in the DataFrame
    if 'Name' in dataframe.columns:
        dataframe = dataframe.dropna(subset=['Name'])
    
    # Rename columns using the provided mapping
    dataframe = dataframe.rename(columns=mapping)
    
    # Ensure all target columns exist in the DataFrame
    for new_column in mapping.values():
        if new_column not in dataframe.columns:
            dataframe[new_column] = None  # Add missing columns with default None values
    
    return dataframe
