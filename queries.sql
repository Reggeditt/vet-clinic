/*Queries that provide answers to the questions from all projects.*/

-- day 1
-- SELECT * FROM animals WHERE name LIKE '%mon';

-- SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;

-- SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- SELECT * FROM animals WHERE neutered = true;

-- SELECT * FROM animals WHERE name != 'Gabumon';

-- SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- day 2
-- BEGIN;
-- UPDATE animals SET species = 'unspecified';
-- SELECT species FROM animals;
-- ROLLBACK;
-- SELECT species FROM animals;


-- BEGIN;
-- UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
-- SELECT species FROM animals;
-- COMMIT;
-- SELECT * FROM animals;


-- BEGIN;
-- DELETE FROM animals;
-- SELECT * FROM animals;
-- ROLLBACK;
-- SELECT * FROM animals;


-- BEGIN;
-- DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- SAVEPOINT deleteAfter2022;
-- SELECT * FROM animals;
-- UPDATE animals SET weight_kg = (weight_kg * -1);
-- SELECT * FROM animals;
-- ROLLBACK TO deleteAfter2022;
-- SELECT * FROM animals;
-- UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
-- COMMIT;
-- SELECT * FROM animals;


-- SELECT COUNT(*) FROM animals;

-- SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- SELECT AVG(weight_kg) FROM animals;

-- SELECT neutered, AVG(escape_attempts) as escape_attempts FROM animals GROUP BY neutered;

-- SELECT species, MAX(weight_kg) as max_weight, MIN(weight_kg) as min_weight FROM animals GROUP BY species; 

-- SELECT species, AVG(escape_attempts) as escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

-- Day 3
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name ILIKE 'melody%';

SELECT animals.name AS animal, species.name AS species FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'pokemon';

SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id ORDER BY full_name;

SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name AS animal, species.name AS species, owners.full_name AS owner FROM 
(animals JOIN species ON animals.species_id = species.id) JOIN 
owners ON animals.owner_id = owners.id 
WHERE species.name = 'digimon' AND 
owners.full_name = 'Jennifer Orwell';

SELECT animals.name AS animal, owners.full_name AS owner FROM 
animals JOIN owners ON animals.owner_id = owners.id 
WHERE animals.escape_attempts = 0 AND 
owners.full_name = 'Dean Winchester';

SELECT owners.full_name AS owner, COUNT(*) AS animals_owned
FROM animals JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animals_owned DESC;
