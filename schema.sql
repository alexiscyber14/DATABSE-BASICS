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


