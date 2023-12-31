/* Populate database with sample data. */
-- day 1
-- INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', DATE '2020-02-03', 10.23, true, 0);

-- INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', DATE '2018-11-15', 8.0, true, 2);

-- INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', DATE '2021-01-07', 15.04, false, 1);

-- INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', DATE '2017-05-12', 11.0, true, 5);

-- day 2
-- INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
-- VALUES ('Charmander', DATE '2020-02-08', -11.00, false, 0),
-- ('Plantmon', DATE '2021-11-15', -5.7, true, 2),
-- ('Squirtle', DATE '1993-04-02', -12.13, false, 3),
-- ('Angemon', DATE '2015-06-12', -45.00, true, 1),
-- ('Boarmon', DATE '2005-06-07', 20.40, true, 7),
-- ('Blossom', DATE '1998-10-13', 17.00, true, 3),
-- ('Ditto', DATE '2022-05-14', 22.00, true, 4);

-- day 3
-- INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),
-- ('Jennifer Orwell', 19),
-- ('Bob', 45),
-- ('Melody Pond', 77),
-- ('Dean Winchester', 14),
-- ('Jodie Whittaker', 38);

-- INSERT INTO species (name) VALUES ('pokemon'),
-- ('digimon');

-- UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
-- UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- UPDATE animals SET owner_id = 1 WHERE name IN ('Agumon');
-- UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
-- UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
-- UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
-- UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

-- day 4
INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, DATE '2000-04-23'),
    ('Maisy Smith', 26, DATE '2019-01-17'),
    ('Stephanie Mendez', 64, DATE '1981-05-04'),
    ('Jack Harkness', 38, DATE '2008-06-08');
select * from vets;


INSERT INTO specializations (vet_id, species_id)
VALUES
    (5, 1),
    (7, 2),
    (7, 1),
    (8, 2);
select * from specializations;


INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
    (1, 5, DATE '2020-05-24'),
    (1, 7, DATE '2020-07-22'),
    (2, 8, DATE '2021-02-02'),
    (3, 6, DATE '2020-01-05'),
    (3, 6, DATE '2020-03-08'),
    (3, 6, DATE '2020-05-14'),
    (4, 7, DATE '2021-05-04'),
    (5, 8, DATE '2021-02-24'),
    (6, 6, DATE '2019-12-21'),
    (6, 5, DATE '2020-08-10'),
    (6, 6, DATE '2021-04-07'),
    (7, 7, DATE '2019-09-29'),
    (8, 8, DATE '2020-10-03'),
    (8, 8, DATE '2020-11-04'),
    (9, 6, DATE '2019-01-24'),
    (9, 6, DATE '2019-05-15'),
    (9, 6, DATE '2020-02-27'),
    (9, 6, DATE '2020-08-03'),
    (10, 7, DATE '2020-05-24'),
    (10, 5, DATE '2021-01-11');
select * from visits;

-- day 5
INSERT INTO visits (animal_id, vet_id, visit_date) 
SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, 
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

