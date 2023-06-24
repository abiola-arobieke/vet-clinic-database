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
