import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL Server (no specific database yet)
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="ISREAL"
        )

        if conn.is_connected():
            cursor = conn.cursor()
            # Create the database safely
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error connecting to MySQL Server: {e}")

    finally:
        # Ensure connection is closed properly
        if conn.is_connected():
            cursor.close()
            conn.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
