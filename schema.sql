/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg FLOAT,
    PRIMARY KEY(id)
);

-- Add new column to the animals' table
ALTER TABLE animals ADD COLUMN species VARCHAR(250);
