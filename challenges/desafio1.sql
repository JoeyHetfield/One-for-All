DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA SpotifyClone;

CREATE TABLE SpotifyClone.plan(
	id_plan INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(15) NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE SpotifyClone.users(
	id_user INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    id_plan INTEGER,
    date_assignature DATETIME NOT NULL,
    FOREIGN KEY(id_plan) REFERENCES plan (id_plan)
);

-- CREATE TABLE SpotifyClone.user_plan(
	-- id_user_plan INT AUTO_INCREMENT PRIMARY KEY,
  --  id_user INTEGER, 
 --   id_plan INTEGER,
 --   date_assignature DATETIME NOT NULL,
--    FOREIGN KEY(id_user) REFERENCES users (id_user),
--    FOREIGN KEY(id_plan) REFERENCES plan (id_plan)
-- );

CREATE TABLE SpotifyClone.artist(
	id_artist INT AUTO_INCREMENT PRIMARY KEY,
    artist VARCHAR(25) NOT NULL
);

CREATE TABLE SpotifyClone.album(
	id_album INT AUTO_INCREMENT PRIMARY KEY,
    album VARCHAR(30) NOT NULL,
    release_date YEAR NOT NULL, 
    id_artist INTEGER,
    FOREIGN KEY(id_artist) REFERENCES artist (id_artist)
);

CREATE TABLE SpotifyClone.music(
	id_music INT AUTO_INCREMENT PRIMARY KEY,
    music VARCHAR(50) NOT NULL, 
    length INT NOT NULL, 
    id_artist INTEGER,
    id_album INTEGER,
    FOREIGN KEY(id_artist) REFERENCES artist (id_artist),
    FOREIGN KEY(id_album) REFERENCES album (id_album)
    );
    
CREATE TABLE SpotifyClone.historic(
	id_historic INT AUTO_INCREMENT,
    id_user INT NOT NULL, 
    id_music INT NOT NULL,
    data_reproduce DATETIME, 
    FOREIGN KEY(id_user) REFERENCES users (id_user),
    FOREIGN KEY(id_music) REFERENCES music(id_music),
    PRIMARY KEY (id_historic, id_user, id_music, data_reproduce)    
);

CREATE TABLE SpotifyClone.follow(
	id_follow INT AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_artist INT NOT NULL,
	  FOREIGN KEY(id_user) REFERENCES users (id_user),
    FOREIGN KEY(id_artist) REFERENCES artist (id_artist),    
    PRIMARY KEY (id_follow, id_user, id_artist)
);

INSERT INTO SpotifyClone.plan (name, price)
VALUES ('gratuito', 0), ('universitario', 5.99), ('pessoal', 6.99), ('familiar', 7.99);

INSERT INTO SpotifyClone.users (name, age, id_plan, date_assignature)
VALUES ('Barbara Liskov', 82, 1, '2019-10-20'), ('Robert Cecil Martin', 58, 1, '2017-01-06'), ('Ada Lovelace', 37, 4, '2017-12-30'), ('Martin Fowler', 46, 4, '2017-01-17'),
 ('Sandi Metz', 58, 4, '2018-04-29'), ('Paulo Freire', 19, 2, '2018-02-14'), ('Bell Hooks', 26, 2, '2018-01-05'), ('Christopher Alexander', 85, 3, '2019-06-05'),
('Judith Butler', 45, 3, '2020-05-13'), ('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO SpotifyClone.artist (artist)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

INSERT INTO SpotifyClone.album (album, release_date, id_artist)
VALUES ('Renaissance', 2022, 1), ('Jazz', 1978, 2), ('Hot Space', 1982, 2), ('Falso Brilhante', 1998, 3), ('Vento de Maio', 2001, 3), 
('QVVJFA?', 2003, 4), ('Somewhere Far Beyond', 2007, 5), ('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.music (music, length, id_artist, id_album)
VALUES ('BREAK MY SOUL', 279, 1, 1), ("VIRGO'S GROOVE", 369, 1, 1), ('ALIEN SUPERSTAR', 116, 1 , 1), ("Don't Stop Me Now", 203, 2, 2),
('Under Pressure', 152, 2, 3), ('Como Nossos Pais', 105, 3, 4),('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
('Samba em Paris', 267, 4, 6), ("The Bard's Song", 244, 5, 7), ('Feeling Good', 100, 6, 8);

INSERT INTO SpotifyClone.historic (id_user, id_music, data_reproduce)
VALUES (1, 8, '2022-02-28 10:45:55'), (1, 2, '2020-05-02 05:30:35'), (1, 10, '2020-03-06 11:22:33'), (2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'), (3, 10, '2020-11-13 16:55:13'), (3, 2, '2020-12-05 18:38:30'),  (4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'), (5, 5, '2020-08-06 15:23:43'), (6, 7, '2017-01-24 00:31:17'), (6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'), (8, 4, '2012-03-17 14:56:41'), (9, 9, '2022-02-24 21:14:22'), (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.follow (id_user, id_artist)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);
