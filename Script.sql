
DROP TABLE IF EXISTS playlists CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS playlists_track CASCADE;


CREATE TABLE genres (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE artists (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    genres_id INT,
    FOREIGN KEY (genres_id) REFERENCES genres(id)
);


CREATE TABLE albums (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year BETWEEN 1000 AND 9999),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE tracks (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

create table playlist (
	id INT primary key ,
	titile varchar(50) not null,
	release_year INT CHECK (release_year BETWEEN 1000 AND 9999)
);



CREATE TABLE playlists_track (
    playlist_id INT,
    track_id INT,
    FOREIGN KEY (playlist_id) REFERENCES playlist(id),
    FOREIGN KEY (track_id) REFERENCES tracks(id)
    primary key (playlist_id, track_id)
);
