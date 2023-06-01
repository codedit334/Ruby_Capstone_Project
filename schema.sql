CREATE TABLE games (
  id INT PRIMARY KEY,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
-- Create label table
CREATE TABLE label(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 title VARCHAR(50),
 color VARCHAR(50),
 PRIMARY KEY(id)
);

-- Create book table  
CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(15),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  CONSTRAINT fk_book FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);
CREATE TABLE genre (
   id SERIAL PRIMARY KEY,
   genre_name  VARCHAR(100)
);

CREATE TABLE music_album (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    published_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    CONSTRAINT fk_genre FOREIGN KEY (genre_id)
       REFERENCES genre (id)  
);
