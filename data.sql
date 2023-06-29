/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agunmon','2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','2018-11-15', 2, true, 8.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu','2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon','2017-05-12', 5, true, 11.00);

-- Insert more data into the animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander','2020-02-08', 0, false, -11.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon','2021-11-15', 2, true, -5.70);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle','1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon','2005-06-12', 1, true, -45.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon','2005-06-07', 7, true, 20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom','1998-10-13', 3, true, 17.00);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto','2022-05-14', 4, true, 22.00);

-- Insert data into the owners table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Insert foreign key id into the species_id column in the animals table
UPDATE animals SET species_id = 1 WHERE name Like '%mon';
UPDATE animals SET species_id = 2 WHERE name NOT Like '%mon';

-- Insert foreign key id into the owner_id column in the animals table
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name IN ('Agunmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- Insert data into the vets table
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert data into the specializations table
INSERT INTO specializations (vet_id, specie_id) VALUES ((SELECT id FROM vets WHERE name IN ('William Tatcher')), (SELECT id FROM species WHERE name IN ('Pokemon')));
INSERT INTO specializations (vet_id, specie_id) VALUES ((SELECT id FROM vets WHERE name IN ('Stephanie Mendez')), (SELECT id FROM species WHERE name IN ('Digimon')));
INSERT INTO specializations (vet_id, specie_id) VALUES ((SELECT id FROM vets WHERE name IN ('Stephanie Mendez')), (SELECT id FROM species WHERE name IN ('Pokemon')));
INSERT INTO specializations (vet_id, specie_id) VALUES ((SELECT id FROM vets WHERE name IN ('Jack Harkness')), (SELECT id FROM species WHERE name IN ('Digimon')));

-- Insert data into the visits table
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Agunmon')), (SELECT id FROM vets WHERE name IN ('William Tatcher')), '2020-05-24'); 
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Agunmon')), (SELECT id FROM vets WHERE name IN ('Stephanie Mendez')), '2020-07-22');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Gabumon')), (SELECT id FROM vets WHERE name IN ('Jack Harkness')), '2021-02-02');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Pikachu')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2020-01-05');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Pikachu')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2020-03-08');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Pikachu')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2020-05-14');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Devimon')), (SELECT id FROM vets WHERE name IN ('Stephanie Mendez')), '2021-05-04');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Charmander')), (SELECT id FROM vets WHERE name IN ('Jack Harkness')), '2021-02-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Plantmon')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2019-12-21');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Plantmon')), (SELECT id FROM vets WHERE name IN ('William Tatcher')), '2020-08-10');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Plantmon')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2021-04-07');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Squirtle')), (SELECT id FROM vets WHERE name IN ('Stephanie Mendez')), '2019-09-29');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Angemon')), (SELECT id FROM vets WHERE name IN ('Jack Harkness')), '2020-10-03');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Angemon')), (SELECT id FROM vets WHERE name IN ('Jack Harkness')), '2020-11-04');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Boarmon')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2019-01-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Boarmon')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2019-05-15');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Boarmon')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2020-02-27');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Boarmon')), (SELECT id FROM vets WHERE name IN ('Maisy Smith')), '2020-08-03');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Blossom')), (SELECT id FROM vets WHERE name IN ('Stephanie Mendez')), '2020-05-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name IN ('Blossom')), (SELECT id FROM vets WHERE name IN ('William Tatcher')), '2021-01-11');

