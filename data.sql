INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23),
           ('Gabumon', '2018-11-15', 2, TRUE, 8.0),
           ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
           ('Devimon', '2017-05-12', 5, TRUE, 11.0);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered,  weight, species) 
VALUES ('Charmander', '2020-02-08',0, false, -11, 'Unspecified'),
       ('Plantmon', '2021-11-15',2, true, -5.7, 'Unspecified'),
       ('Squirtle', '1993-04-02',3, false, -12.13, 'Unspecified'),
       ('Angemon', '2005-06-12',1,  true, -45, 'Unspecified'),
       ('Boarmon', '2005-06-07',7, true, 20.4, 'Unspecified'),
       ('Blossom', '1998-10-13',3, true, 17, 'Unspecified'),
       ('Ditto', '2022-05-14',4, true, 22, 'Unspecified');


INSERT INTO owners (name, age) 
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);



INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');





SET species_id = CASE WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
                      ELSE (SELECT id FROM species WHERE name = 'Pokemon')
                 END;
SELECT * FROM animals;


UPDATE animals SET owner_id = (
  CASE 
    WHEN name = 'Agumon' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name = 'Gabumon' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name = 'Pikachu' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name = 'Devimon' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name = 'Plantmon' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name = 'Charmander' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name = 'Squirtle' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name = 'Blossom' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name = 'Angemon' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
    WHEN name = 'Boarmon' AND owner_id IS NULL THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END
);


INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations (vet_id, species)
VALUES
  (1, 'Pokemon'),
  (3, 'Digimon'),
  (3, 'Pokemon'),
  (4, 'Digimon');


INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES 
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');

