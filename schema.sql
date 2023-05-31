-- Create label table
CREATE TABLE label(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 title VARCHAR(50),
 color VARCHAR(50),
 PRIMARY KEY(id)
);

