import os
import pandas as pd
import numpy as np
from db_utils import *


def get_files(filepath):
    all_files = []
    for root, dirs, files in os.walk(filepath):
        for file in files:
            if file.split('.')[-1] == 'json':
                file = os.path.join(root, file)
                all_files.append(file)
    
    print("get_files")
    return all_files



def load_songs_table(song_files, connection, cursor):
    for file in song_files:
        df = pd.read_json(file, lines=True)
        df = df[['song_id', 'title', 'artist_id', 'year', 'duration']]
        song_insert_data = df.values[0].tolist()

        cursor.execute(song_table_insert, song_insert_data)
        connection.commit()

    print("load_songs_table")


def load_artists_table(song_files, connection, cursor):
    for file in song_files:
        df = pd.read_json(file, lines=True)
        df = df[['artist_id', 'artist_name', 'artist_location', 'artist_latitude', 'artist_longitude']]
        artist_insert_data = df.values[0].tolist()

        cursor.execute(artist_table_insert, artist_insert_data)
        connection.commit()

    print("load_artists_table")


def load_users_table(log_files, connection, cursor):
    for file in log_files:
        df = pd.read_json(file, lines=True)
        df = df [['userId', 'firstName', 'lastName', 'gender', 'level']]
        df.drop_duplicates(subset=['userId'], inplace=True)
        df = df[df['userId'].notna()]
        df = df[df['userId'] != '']
        users_insert_data = df.values.tolist()

        cursor.executemany(user_table_insert, users_insert_data)
        connection.commit()

    print("load_users_table")



def main():
    song_files = get_files('data/song_data')
    log_files = get_files('data/log_data')

    connection, cursor = db_connect()
    drop_tables(connection, cursor)
    create_schema(connection, cursor)

    load_artists_table(song_files, connection, cursor)
    load_songs_table(song_files, connection, cursor)
    load_users_table(log_files, connection, cursor)

    connection.close()
    cursor.close()


main()