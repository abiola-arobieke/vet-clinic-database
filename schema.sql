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

-- Create owner's table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

-- Create species's table
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY(id)
);

-- Modify animals table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);


