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
-- SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name ILIKE 'melody%';

-- SELECT animals.name AS animal, species.name AS species FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'pokemon';

-- SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id ORDER BY full_name;

-- SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- SELECT animals.name AS animal, species.name AS species, owners.full_name AS owner FROM 
-- (animals JOIN species ON animals.species_id = species.id) JOIN 
-- owners ON animals.owner_id = owners.id 
-- WHERE species.name = 'digimon' AND 
-- owners.full_name = 'Jennifer Orwell';

-- SELECT animals.name AS animal, owners.full_name AS owner FROM 
-- animals JOIN owners ON animals.owner_id = owners.id 
-- WHERE animals.escape_attempts = 0 AND 
-- owners.full_name = 'Dean Winchester';

-- SELECT owners.full_name AS owner, COUNT(*) AS animals_owned
-- FROM animals JOIN owners ON animals.owner_id = owners.id
-- GROUP BY owners.full_name
-- ORDER BY animals_owned DESC;


-- day 4
select '1. Who was the last animal seen by William Tatcher?' as query;
SELECT a.name AS animal_name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

select '2. How many different animals did Stephanie Mendez see?' as query;
SELECT COUNT(DISTINCT a.id) AS animal_count
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';

select '3. List all vets and their specialties, including vets with no specialties.' as query;
SELECT v.name AS vet_name, species.name
FROM vets v
LEFT JOIN specializations s ON v.id = s.vet_id
LEFT JOIN species ON s.species_id = species.id
ORDER BY v.id;

select '4. List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.' as query;
SELECT a.name AS animal_name
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
AND v.visit_date BETWEEN DATE '2020-04-01' AND DATE '2020-08-30';

select '5. What animal has the most visits to vets?' as query;
SELECT a.name AS animal_name, COUNT(v.vet_id) AS visit_count
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.id
ORDER BY visit_count DESC
LIMIT 1;

select '6. Who was Maisy Smith's first visit?' as query;
SELECT v.name AS vet_name, a.name, vt.visit_date
FROM vets v
JOIN visits vt ON v.id = vt.vet_id
JOIN animals a ON vt.animal_id = a.id
WHERE v.name = 'Maisy Smith'
ORDER BY vt.visit_date ASC
LIMIT 1;

select '7. Details for the most recent visit: animal information, vet information, and date of visit.' as query;
SELECT a.name AS animal_name, v.name AS vet_name, vt.visit_date
FROM animals a
JOIN visits vt ON a.id = vt.animal_id
JOIN vets v ON vt.vet_id = v.id
ORDER BY vt.visit_date DESC
LIMIT 1;

select '8. How many visits were with a vet that did not specialize in that animal's species?' as query;
SELECT COUNT(*) AS non_specialist_visits_count
FROM visits vt
JOIN animals a ON vt.animal_id = a.id
JOIN vets v ON vt.vet_id = v.id
LEFT JOIN specializations s ON v.id = s.vet_id
WHERE s.vet_id IS NULL;

select '9. What specialty should Maisy Smith consider getting? Look for the species she gets the most.' as query;
SELECT MAX(sp.name) as recommended_specialty
FROM vets v
JOIN visits vt ON v.id = vt.vet_id
JOIN animals a ON vt.animal_id = a.id
JOIN species sp ON a.species_id = sp.id
WHERE v.name = 'Maisy Smith'
GROUP BY sp.name
LIMIT 1;
