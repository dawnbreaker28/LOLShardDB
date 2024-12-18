import psycopg2

def get_db_connection():
    """Establish and return a PostgreSQL database connection."""
    try:
        conn = psycopg2.connect(
            dbname="lol",
            user="postgres",
            password="",
            host="localhost",
            port=5432
        )
        return conn
    except Exception as e:
        print(f"Database connection error: {e}")
        return None

def insert_data(df, table_name, columns):
    """
    Insert data into the specified table.
    Args:
        df: Processed DataFrame ready for insertion.
        table_name: Target table in the database.
        columns: Columns to insert into the database.
    """
    conn = get_db_connection()
    if not conn:
        return

    cursor = conn.cursor()
    placeholders = ", ".join(["%s"] * len(columns))
    insert_query = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({placeholders}) ON CONFLICT DO NOTHING;"

    try:
        for _, row in df.iterrows():
            cursor.execute(insert_query, tuple(row[col] for col in columns))
        conn.commit()
        print(f"Data inserted successfully into {table_name}.")
    except Exception as e:
        print(f"Error inserting data: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()
