CREATE TABLE IF NOT EXISTS users(
    user_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(1),
    level VARCHAR(10),

    PRIMARY KEY (user_id),
    CHECK (level IN ('paid', 'free'))
);

CREATE TABLE IF NOT EXISTS artists(
    artist_id VARCHAR(50),
    artist_name VARCHAR(100),
    location VARCHAR(100),
    lattitude FLOAT(5),
    longitude FLOAT(5),

    PRIMARY KEY (artist_id)
);


CREATE TABLE IF NOT EXISTS songs (
    song_id VARCHAR(20),
    title VARCHAR(100),
    artist_id VARCHAR(50),
    year INTEGER,
    duration FLOAT(5),

    PRIMARY KEY (song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);


CREATE TABLE IF NOT EXISTS songplays (
    songplay_id SERIAL,
    start_time TIMESTAMP,
    user_id INTEGER,
    level VARCHAR(10),
    song_id VARCHAR(20),
    artist_id VARCHAR(50),
    session_id INTEGER,
    location VARCHAR(50),
    user_agent VARCHAR(150),

    PRIMARY KEY (songplay_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);