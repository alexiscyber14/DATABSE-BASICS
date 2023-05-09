/* QUERIES */


/*finding the animals whose name ends with "mon*/
SELECT * FROM animals WHERE name LIKE '%mon';
/* list the names of all the animals born between 2016 and 2019 */
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
/* List the name of all animals that are neutered and have less than 3 escape attempts:*/
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
/*List the date of birth of all animals named either "Agumon" or "Pikachu":*/
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
/*List name and escape attempts of animals that weigh more than 10.5kg:*/
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
/*Find all animals that are neutered:*/
SELECT * FROM animals WHERE neutered = TRUE;
/*Find all animals not named Gabumon:*/
SELECT * FROM animals WHERE name != 'Gabumon';
/*SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;*/
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


---DAY TWO QUERIES--
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals; 
ROLLBACK;
SELECT * FROM animals;


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;



BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- Create a savepoint
SAVEPOINT update_weights;
-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals SET weight_kg = -1 * weight_kg;
-- Roll back to the savepoint
ROLLBACK TO update_weights;
-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
-- Commit the transaction
COMMIT;

SELECT * FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, AVG(escape_attempts) as avg_escape_attempts 
FROM animals 
GROUP BY neutered 
ORDER BY AVG(escape_attempts) DESC LIMIT 1;

SELECT species, MIN(weight_kg), MAX(weight_kg) 
FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) 
FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' 
GROUP BY species;


SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) AS animal_count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.id) AS animal_count
FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;


SELECT a.name AS animal_name
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id) AS num_animals
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez';


SELECT vt.name AS vet_name, s.name AS specialty_name
FROM vets vt
LEFT JOIN vet_specialties vs ON vt.id = vs.vet_id
LEFT JOIN specialties s ON vs.specialty_id = s.id
ORDER BY vt.name;

SELECT a.name AS animal_name, v.visit_date
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez' AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30'
ORDER BY v.visit_date;

SELECT a.name AS animal_name, COUNT(v.id) AS num_visits
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
GROUP BY a.id
ORDER BY num_visits DESC
LIMIT 1;

SELECT vt.name AS vet_name, v.visit_date
FROM visits v
INNER JOIN vets vt ON v.vet_id = vt.id
INNER JOIN animals a ON v.animal_id = a.id
WHERE a.name = 'Pikachu' AND vt.name = 'Maisy Smith'
ORDER BY v.visit_date
LIMIT 1;

SELECT a.name AS animal_name, vt.name AS vet_name, v.visit_date
FROM visits v
INNER JOIN vets vt ON v.vet_id = vt.id
INNER JOIN animals a ON v.animal_id = a.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS num_visits
FROM visits v
INNER JOIN vets vt ON v.vet_id = vt.id
INNER JOIN animals a ON v.animal_id = a.id
LEFT JOIN vet_specialties vs ON vt.id = vs.vet_id AND a.species_id = vs.specialty_id
WHERE vs.specialty_id IS NULL;


SELECT a.species, COUNT(*) AS total_visits, s.name AS specialty
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON v.vet_id = vt.id
LEFT JOIN specialties s ON vt.specialty_id = s.id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.species
ORDER BY total_visits DESC
LIMIT 1;
