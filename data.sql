/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', DATE '2020-02-08', -11.00, false, 0),
('Plantmon', DATE '2021-11-15', -5.7, true, 2),
('Squirtle', DATE '1993-04-02', -12.13, false, 3),
('Angemon', DATE '2015-06-12', -45.00, true, 1),
('Boarmon', DATE '2005-06-07', 20.40, true, 7),
('Blossom', DATE '1998-10-13', 17.00, true, 3),
('Ditto', DATE '2022-05-14', 22.00, true, 4);


INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('pokemon'),
('digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name IN ('Agumon');
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');