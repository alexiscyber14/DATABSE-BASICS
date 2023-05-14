CREATE TABLE animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text  NOT NULL,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species text,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)


CREATE TABLE owners
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    full_name text,
    age integer,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)

CREATE TABLE species
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text,
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

-- Removing column species
ALTER TABLE animals DROP COLUMN species;

-- Add column  of species_id and make it a foreign key referencing the species table
ALTER TABLE animals ADD COLUMN species_id integer REFERENCES species(id);

-- Add column of owner_id and make it a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id integer REFERENCES owners(id);


CREATE TABLE vets (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER,
  species TEXT,
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);


CREATE TABLE visits (
  animal_id INTEGER,
  vet_id INTEGER,
  visit_date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);


CREATE INDEX visits_animal_id_idx ON visits (animal_id);
CREATE INDEX visits_vet_id_idx ON visits (vet_id);
CREATE INDEX idx_owners_email ON owners(email);

