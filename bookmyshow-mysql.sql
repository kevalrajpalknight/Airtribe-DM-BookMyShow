-- Create Tables --
CREATE TABLE `MovieLanguage` (
  `movie` bigint NOT NULL,
  `language` ENUM ('hindi', 'english', 'urdu', 'tamil', 'telugu', 'gujrati', 'kannada', 'marathi', 'malayalam', 'bengali', 'punjabi', 'multi-language') NOT NULL
);

CREATE TABLE `MovieGenre` (
  `movie` bigint NOT NULL,
  `genre` ENUM ('drama', 'comedy', 'action', 'thriller', 'sci-fi', 'animation', 'biography', 'classic', 'crime', 'family', 'mystery', 'period', 'supernatural', 'political') NOT NULL
);

CREATE TABLE `Movie` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `duration` tinyint COMMENT '(in minutes)'
);

CREATE TABLE `Address` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `city` varchar(150) NOT NULL,
  `state` varchar(150) NOT NULL,
  `latitude` float,
  `longitude` float
);

CREATE TABLE `Theater` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` bigint
);

CREATE TABLE `Show` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `movie` bigint NOT NULL,
  `theatre` bigint NOT NULL,
  `date` date NOT NULL,
  `showtime` time NOT NULL,
  `available_seats` integer NOT NULL
);

ALTER TABLE `MovieLanguage` ADD FOREIGN KEY (`movie`) REFERENCES `Movie` (`id`);

ALTER TABLE `MovieGenre` ADD FOREIGN KEY (`movie`) REFERENCES `Movie` (`id`);

ALTER TABLE `Theater` ADD FOREIGN KEY (`location`) REFERENCES `Address` (`id`);

ALTER TABLE `Show` ADD FOREIGN KEY (`movie`) REFERENCES `Movie` (`id`);

ALTER TABLE `Show` ADD FOREIGN KEY (`theatre`) REFERENCES `Theater` (`id`);


-- Data Entry --
INSERT INTO Address(city, state, latitude, longitude)
VALUES ('Gwalior', 'Madhya Pradesh', 	53.792039, -77.616743
);

INSERT INTO Theater(name, location)
VALUES ('PVR: Nexus', 1);

INSERT INTO Movie(title, duration)
VALUES ('Dasara', 120), ('Kisi Ka Bhai Kisi Ki Jaan', 150), ('Tu Jhoothi Main Makkaar', 130), ('Avatar: The Way of Water', 190);

INSERT INTO MovieGenre(movie, genre)
VALUES (1, 'action'),(2, 'comedy'),(3, 'drama'), (4, 'sci-fi');
	
INSERT INTO MovieLanguage(language, movie)
VALUES ('telugu', 1),('hindi', 2),('hindi', 3),('english', 4);
  
INSERT INTO Show(movie, theatre, date, showtime, available_seats)
VALUES (1, 1, '2024-03-26', '10:30:00', 50);
