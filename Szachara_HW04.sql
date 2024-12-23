-- Steven Szachara
-- ISTE 608
-- August 2024
-- HW04.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;
USE music;

CREATE TABLE artist (
	Artist VARCHAR(40) NOT NULL,
	NumGrpMembers SMALLINT NOT NULL,
	PRIMARY KEY (Artist)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE producer (
	Producer VARCHAR(40) NOT NULL,
	ProducerURL VARCHAR(40) NOT NULL UNIQUE,
	PRIMARY KEY (Producer)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE category (
	Category VARCHAR(40) NOT NULL,
	CategorySales DECIMAL (12, 2) NOT NULL,
	PRIMARY KEY (Category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE media_type (
	Media VARCHAR(40) NOT NULL,
	Media_Price DECIMAL (10,2) NOT NULL,
	PRIMARY KEY (Media)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE album (
	Title VARCHAR(40) NOT NULL,
	Year SMALLINT(4) NOT NULL,
	Artist VARCHAR(40) NOT NULL,
	Producer VARCHAR(40) NOT NULL,
	Category VARCHAR(40) NOT NULL,
	PRIMARY KEY (Title),
	CONSTRAINT Artist_FK Foreign Key (Artist)
		REFERENCES artist(Artist),
	CONSTRAINT Producer_FK Foreign Key (Producer)
		REFERENCES producer(Producer),
	CONSTRAINT Category_FK Foreign Key (Category)
		REFERENCES category(Category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE album_media (
	Title VARCHAR(40) NOT NULL,
	Media VARCHAR(40) NOT NULL,
	PRIMARY KEY (Title, Media),
	CONSTRAINT Title_FK Foreign Key (Title)
		REFERENCES album(Title),
	CONSTRAINT Media_FK Foreign Key (Media)
		REFERENCES media_type(Media)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO category (Category, CategorySales)
	VALUES ("Country", 1234567.00);
INSERT INTO category (Category, CategorySales)
	VALUES ("Rock", 789567345.00);
INSERT INTO category (Category, CategorySales)
	VALUES ("Rap", 10000000.00);
INSERT INTO category (Category, CategorySales)
	VALUES ("Heavy Metal", 100000.99);
INSERT INTO category (Category, CategorySales)
	VALUES ("Pop", 1001234.99);

INSERT INTO producer (Producer, ProducerURL)
	VALUES ("MAX Artists", "www.maxartists.com");
INSERT INTO producer (Producer, ProducerURL)
	VALUES ("ABC Music", "www.abcmusic.com");
INSERT INTO producer (Producer, ProducerURL)
	VALUES ("6th Street", "www.6street.com");
INSERT INTO producer (Producer, ProducerURL)
	VALUES ("Yee Haw Records", "www.yeehawrecords.com");
INSERT INTO producer (Producer, ProducerURL)
	VALUES ("Epic Records", "www.epicrecords.com");

INSERT INTO artist (Artist, NumGrpMembers)
	VALUES ("Slipknot", 12);
INSERT INTO artist (Artist, NumGrpMembers)
	VALUES ("Bon Jovi", 6);
INSERT INTO artist (Artist, NumGrpMembers)
	VALUES ("Kendrick Lamar", 1);
INSERT INTO artist (Artist, NumGrpMembers)
	VALUES ("Taylor Swift", 100);
INSERT INTO artist (Artist, NumGrpMembers)
	VALUES ("Michael Jackson", 100);

INSERT INTO media_type (Media, Media_Price)
	VALUES ("CD", 19.99);
INSERT INTO media_type (Media, Media_Price)
	VALUES ("Vinyl", 29.99);
INSERT INTO media_type (Media, Media_Price)
	VALUES ("MP3", 0.99);
INSERT INTO media_type (Media, Media_Price)
	VALUES ("Cassette", 9.99);


INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Really Bad", 2005, "Taylor Swift", "Yee Haw Records", "Country");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("HUMBLE.", 2013, "Kendrick Lamar", "6th Street", "Rap");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Iowa", 1998, "Slipknot", "MAX Artists", "Heavy Metal");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Livin' On A Prayer", 1985, "Bon Jovi", "ABC Music", "Rock");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Off the Wall", 1979, "Michael Jackson", "Epic Records", "Pop");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Thriller", 1982, "Michael Jackson", "Epic Records", "Pop");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Bad", 1987, "Michael Jackson", "Epic Records", "Pop");
INSERT INTO album (Title, Year, Artist, Producer, Category)
VALUES ("Dangerous", 1991, "Michael Jackson", "Epic Records", "Pop");


INSERT INTO album_media (Title, Media)
	VALUES ("Really Bad", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Really Bad", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Really Bad", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Really Bad", "Cassette");

INSERT INTO album_media (Title, Media)
	VALUES ("HUMBLE.", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("HUMBLE.", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("HUMBLE.", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("HUMBLE.", "Cassette");

INSERT INTO album_media (Title, Media)
	VALUES ("Iowa", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Iowa", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Iowa", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Iowa", "Cassette");

INSERT INTO album_media (Title, Media)
	VALUES ("Livin' On A Prayer", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Livin' On A Prayer", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Livin' On A Prayer", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Livin' On A Prayer", "Cassette");


INSERT INTO album_media (Title, Media)
	VALUES ("Off the Wall", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Off the Wall", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Off the Wall", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Off the Wall", "Cassette");

INSERT INTO album_media (Title, Media)
	VALUES ("Thriller", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Thriller", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Thriller", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Thriller", "Cassette");

INSERT INTO album_media (Title, Media)
	VALUES ("Bad", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Bad", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Bad", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Bad", "Cassette");


INSERT INTO album_media (Title, Media)
	VALUES ("Dangerous", "Vinyl");
INSERT INTO album_media (Title, Media)
	VALUES ("Dangerous", "CD");
INSERT INTO album_media (Title, Media)
	VALUES ("Dangerous", "MP3");
INSERT INTO album_media (Title, Media)
	VALUES ("Dangerous", "Cassette");






