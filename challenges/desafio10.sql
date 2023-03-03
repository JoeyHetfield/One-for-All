CREATE TABLE SpotifyClone.favorites (
	id_favorite INT AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_music INT NOT NULL, 
    FOREIGN KEY (id_user) REFERENCES SpotifyClone.users (id_user),
    FOREIGN KEY (id_music) REFERENCES SpotifyClone.music (id_music),
    PRIMARY KEY (id_favorite, id_user, id_music)
);

INSERT INTO SpotifyClone.favorites (id_user, id_music)
VALUES (1, 3), (1, 6), (1, 10), (2, 4), (3, 1), (3, 3), (4, 7), (4, 4),
(5, 10), (5, 2), (8, 4), (9, 7), (10, 3);