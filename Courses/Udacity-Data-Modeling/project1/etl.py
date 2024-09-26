import os
import pandas as pd
import psycopg2
from dotenv import load_dotenv


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


    return cursor


def get_files(filepath):
    all_files = []
    for root, dirs, files in os.walk(filepath):
        for file in files:
            if file.split('.')[-1] == 'json':
                file = os.path.join(root, file)
                all_files.append(file)
    
    return all_files


def load_songs_tale(song_files, cursor):
    for file in song_files:
        df = pd.read_json(file, lines=True)
        df = df[['song_id', 'title', 'artist_id', 'year', 'duration']]
        song_insert_data = df.values[0].tolist()

        song_table_insert = ("""
            INSERT INTO songs (song_id, title, artist_id, year, duration)
            VALUES (%s, %s, %s, %s, %s);
            """)

        cursor.execute(song_table_insert, song_insert_data)
        cursor.commit()



cursor = db_connect()
song_files = get_files('data/song_data')
load_songs_tale(song_files, cursor)
