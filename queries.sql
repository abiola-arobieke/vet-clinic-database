/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name Like '%mon';
SELECT name from animals WHERE (date_of_birth >= '2016-01-01') AND (date_of_birth <= '2019-12-31');
SELECT name from animals WHERE (neutered IS True) AND (escape_attempts < 3);
SELECT date_of_birth from animals WHERE name IN ('Agunmon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered IS True;
SELECT * from animals WHERE name NOT IN ('Gabumon');
SELECT * from animals WHERE (weight_kg >= 10.4) AND (weight_kg <= 17.3);

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name Like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT first_sp;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO SAVEPOINT first_sp;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) as most_escaped FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) as minimum_weight, MAX(weight_kg) as maximum_weight FROM animals GROUP BY species;
SELECT AVG(escape_attempts) From animals WHERE (date_of_birth >= '1990-01-01') AND (date_of_birth <= '2000-12-31');


SELECT full_name, name as animal_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE full_name IN ('Melody Pond');
SELECT animals.name, species.name as type FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name IN ('Pokemon');
SELECT full_name, name AS animal_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id ORDER BY owners.full_name;
SELECT species.name, COUNT(species.name) AS number_of_animals FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT full_name, animals.name AS animal_name, species.name AS type From animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE (owners.full_name IN ('Jennifer Orwell') AND species.name IN ('Digimon'));
SELECT full_name, animals.name AS animal_name, escape_attempts From animals JOIN owners ON animals.owner_id = owners.id WHERE (full_name IN ('Dean Winchester') AND  escape_attempts = 0);
SELECT full_name, COUNT(owners.full_name) as highest_animal_count FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY full_name ORDER BY highest_animal_count DESC LIMIT 1;


CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NULL,
    PRIMARY KEY(id)
);

CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NULL,
    PRIMARY KEY(id)
);

-- Create a  joint table for vets and species
CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    specie_id INT REFERENCES species(id),
    PRIMARY KEY (vet_id, specie_id)
);

CREATE TABLE visits (
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visit_date DATE,
    PRIMARY KEY (animal_id, vet_id, visit_date)
);

SELECT animals.name AS animal, vets.name As vet, visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC LIMIT 1;

Who was the last animal seen by William Tatcher?
How many different animals did Stephanie Mendez see?
List all vets and their specialties, including vets with no specialties.
List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
What animal has the most visits to vets?
Who was Maisy Smith's first visit?
Details for most recent visit: animal information, vet information, and date of visit.
How many visits were with a vet that did not specialize in that animal's species?
What specialty should Maisy Smith consider getting? Look for the species she gets the most.
Take a screenshot of the results of your queries.