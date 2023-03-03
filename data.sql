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
       