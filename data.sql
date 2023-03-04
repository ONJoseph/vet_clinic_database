/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

--Add a column species of type string to your animals table. Modify your schema.sql file.
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species)
VALUES ('Charmander', '2020-02-08', -11, FALSE, 0, 'Pokemon'),
       ('Plantmon', '2021-11-15', -5.7, TRUE, 2, 'Digimon'),
       ('Squirtle', '1993-04-02', -12.13, FALSE, 3, 'Pokemon'),
       ('Angemon', '2005-06-12', -45, TRUE, 1, 'Digimon'),
       ('Boarmon', '2005-06-07', 20.4, TRUE, 3, 'Digimon'),
       ('Blossom', '1998-10-13', 17, TRUE, 3, 'Powerpuff Girls'),
       ('Ditto', '2022-05-14', 22, TRUE, 4, 'Pokemon');
       
--Modify your inserted animals to include owner information (owner_id)
INSERT INTO owners (full_name, age) VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES 
('Pokemon'),
('Digimon');

INSERT INTO animals (name, species_id, owner_id) VALUES 
('Agumon', 2, 1),
('Gabumon', 2, 2),
('Pikachu', 1, 2),
('Devimon', 2, 3),
('Plantmon', 1, 3),
('Charmander', 1, 4),
('Squirtle', 1, 4),
('Blossom', 1, 4),
('Angemon', 2, 5),
('Boarmon', 1, 5);

-- Modify inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
BEGIN;
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name like '%mon';
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id is null;
COMMIT;
SELECT * from aniSmals;

-- Modify inserted animals to include owner information (owner_id)
SELECT * FROM owners;
BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name like 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
COMMIT;
SELECT * from animals;
ROLLBACK;


-- Insert the following data for vets
INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08')
SELECT * FROM vets;

-- Insert the following data for specialties
BEGIN;
INSERT INTO specializations (vet_id, spec_id)
SELECT vets.id, species.id FROM vets, species
WHERE vets.name = 'William Tatcher'
AND species.name = 'Pokemon';
COMMIT;
SELECT * FROM specializations;

BEGIN;
INSERT INTO specializations (vet_id, spec_id)
SELECT vets.id, species.id FROM vets, species
WHERE vets.name = 'Stephanie Mendez'
AND species.name IN ('Digimon','Pokemon');
COMMIT;
SELECT * FROM specializations;

BEGIN;
INSERT INTO specializations (vet_id, spec_id)
SELECT vets.id, species.id FROM vets, species
WHERE vets.name = 'Jack Harkness'
AND species.name = 'Digimon';
COMMIT;
SELECT * FROM specializations

-- Insert the following data for visits:
BEGIN;
INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24' FROM animals, vets
WHERE animals.name = 'Agumon'
AND vets.name = 'William Tatcher';
COMMIT;

BEGIN;
INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-07-22' FROM animals, vets
WHERE animals.name = 'Agumon'
AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-02-02' FROM animals, vets
WHERE animals.name = 'Gabumon'
AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-01-05' FROM animals, vets
WHERE animals.name = 'Pikachu'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-03-08' FROM animals, vets
WHERE animals.name = 'Pikachu'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-14' FROM animals, vets
WHERE animals.name = 'Pikachu'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-05-04' FROM animals, vets
WHERE animals.name = 'Devimon'
AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-02-24' FROM animals, vets
WHERE animals.name = 'Charmander'
AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-12-21' FROM animals, vets
WHERE animals.name = 'Plantmon'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-08-10' FROM animals, vets
WHERE animals.name = 'Plantmon'
AND vets.name = 'William Tatcher';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-04-07' FROM animals, vets
WHERE animals.name = 'Plantmon'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-09-29' FROM animals, vets
WHERE animals.name = 'Squirtle'
AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-10-03' FROM animals, vets
WHERE animals.name = 'Angemon'
AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-11-04' FROM animals, vets
WHERE animals.name = 'Angemon'
AND vets.name = 'Jack Harkness';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-01-24' FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2019-05-15' FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-02-27' FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-08-03' FROM animals, vets
WHERE animals.name = 'Boarmon'
AND vets.name = 'Maisy Smith';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2020-05-24' FROM animals, vets
WHERE animals.name = 'Blossom'
AND vets.name = 'Stephanie Mendez';

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT animals.id, vets.id, '2021-01-11' FROM animals, vets
WHERE animals.name = 'Blossom'
AND vets.name = 'William Tatcher';
COMMIT;
SELECT * FROM visits;


























