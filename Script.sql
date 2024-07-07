
DROP TABLE IF EXISTS artist_genre CASCADE;
DROP TABLE IF EXISTS artist_album CASCADE;
DROP TABLE IF EXISTS playlist_track CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS playlists CASCADE;


CREATE TABLE genres (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE artists (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE albums (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year BETWEEN 1000 AND 9999)
);

CREATE TABLE artist_album (
    artist_id INT,
    album_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (album_id) REFERENCES albums(id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE artist_genre (
    artist_id INT,
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE tracks (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(id)
);


CREATE TABLE playlists (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    release_year INT CHECK (release_year BETWEEN 1000 AND 9999)
);


CREATE TABLE playlist_track (
    playlist_id INT,
    track_id INT,
    FOREIGN KEY (playlist_id) REFERENCES playlists(id),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    PRIMARY KEY (playlist_id, track_id)
);
