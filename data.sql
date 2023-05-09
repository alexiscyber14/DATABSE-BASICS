INSERT INTO public.animals(
	name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23),
           ('Gabumon', '2018-11-15', 2, TRUE, 8.0),
           ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
           ('Devimon', '2017-05-12', 5, TRUE, 11.0);


INSERT INTO animals (name, birthdate, weight, neutered, escape_attempts, species) 
VALUES ('Charmander', '2020-02-08', -11, false, 0, 'Unknown'),
       ('Plantmon', '2021-11-15', -5.7, true, 2, 'Unknown'),
       ('Squirtle', '1993-04-02', -12.13, false, 3, 'Unknown'),
       ('Angemon', '2005-06-12', -45, true, 1, 'Unknown'),
       ('Boarmon', '2005-06-07', 20.4, true, 7, 'Unknown'),
       ('Blossom', '1998-10-13', 17, true, 3, 'Unknown'),
       ('Ditto', '2022-05-14', 22, true, 4, 'Unknown');


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

