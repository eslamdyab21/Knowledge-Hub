import psycopg2
from dotenv import load_dotenv
import os

def db_connect():
    load_dotenv()
    
    connection = psycopg2.connect(
        host=os.getenv('DATABASE_HOST'),
        port=os.getenv('DATABASE_PORT'),
        user=os.getenv('DATABASE_USER'),
        password=os.getenv('DATABASE_PASSWORD'),
        dbname=os.getenv('DATABASE_NAME'),
    )
    cursor = connection.cursor()


    return connection, cursor



def drop_tables(connection, cursor):
    artist_table_drop = "DROP TABLE IF EXISTS artists"
    song_table_drop = "DROP TABLE IF EXISTS songs"
    user_table_drop = "DROP TABLE IF EXISTS users"
    songplay_table_drop = "DROP TABLE IF EXISTS songplays"

    cursor.execute(songplay_table_drop)
    cursor.execute(user_table_drop)
    cursor.execute(song_table_drop)
    cursor.execute(artist_table_drop)
    connection.commit()

    print("drop_tables")


def create_schema(connection, cursor):
    with open('sparkifydb_schema.sql', 'r') as file:
        sql_queries = file.read()

    queries = sql_queries.split(';')

    for query in queries:
        if query.strip() != '':
            cursor.execute(query)
            connection.commit()

    print("create_schema")



artist_table_insert = ("""
    INSERT INTO artists (artist_id, artist_name, location, lattitude, longitude)
    VALUES (%s, %s, %s, %s, %s) ON CONFLICT(artist_id) DO NOTHING;
    """)

song_table_insert = ("""
    INSERT INTO songs (song_id, title, artist_id, year, duration)
    VALUES (%s, %s, %s, %s, %s) ON CONFLICT DO NOTHING;
    """)

user_table_insert = ("""
    INSERT INTO users (user_id, first_name, last_name, gender, level)
    VALUES (%s, %s, %s, %s, %s) ON CONFLICT(user_id) DO NOTHING;
    """)

songplays_table_insert = ("""
    INSERT INTO songplays (start_time, user_id, level, song_id, artist_id, session_id, location, user_agent)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
    """)


song_table_select = ("""
    SELECT songs.song_id, songs.artist_id FROM songs 
    WHERE songs.title = %s;
    """)