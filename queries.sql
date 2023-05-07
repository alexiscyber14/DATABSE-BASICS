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
