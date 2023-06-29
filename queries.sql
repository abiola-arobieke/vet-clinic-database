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

-- Who was the last animal seen by William Tatcher?
SELECT animals.name AS animal, vets.name As vet, visit_date 
FROM animals 
JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) AS animals_visited, vets.name As vet 
FROM animals 
JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez' GROUP BY vet;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet, species.name AS specialties 
FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id 
LEFT JOIN species ON specializations.specie_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name AS vet, animals.name AS visitors_animal, visit_date 
FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id 
WHERE (vets.name IN ('Stephanie Mendez') AND (visit_date >= '2020-04-01' AND visit_date <= '2020-08-30'));

-- What animal has the most visits to vets?
SELECT animals.name AS animal, COUNT(visits.animal_id) AS most_visit_to_vet 
FROM animals JOIN visits ON animals.id = visits.animal_id 
GROUP BY animals.name ORDER BY most_visit_to_vet DESC LIMIT 1; 

-- Who was Maisy Smith's first visit?
SELECT animals.name AS animal, vets.name AS vet, MIN(visit_date) AS first_visit_date 
FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name IN ('Maisy Smith') GROUP BY animal, vet ORDER BY first_visit_date ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name AS animal, date_of_birth, escape_attempts, neutered, weight_kg, vets.name AS vet, age, date_of_graduation, visit_date AS most_recent_visit 
FROM animals 
JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id 
ORDER BY most_recent_visit DESC LIMIT 5;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vet AS non_specialist, COUNT(number_of_visit) as number_of_visit 
FROM (SELECT vets.name AS vet, visits.visit_date AS number_of_visit , specializations.specie_id AS spec_id 
FROM vets
LEFT JOIN visits ON vets.id = visits.vet_id 
LEFT JOIN specializations ON vets.id = specializations.vet_id) as non_specialize WHERE spec_id IS NULL GROUP BY vet, spec_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vets.name AS vet, species.name AS most_treated_species, COUNT(species.name) as max_count 
FROM vets JOIN visits ON vets.id = visits.vet_id 
JOIN animals ON animals.id = visits.animal_id 
JOIN species ON species.id = animals.species_id 
WHERE vets.name IN ('Maisy Smith') GROUP BY species.name, vets.name ORDER BY max_count DESC LIMIT 1;

