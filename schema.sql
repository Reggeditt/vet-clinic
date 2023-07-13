/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY,
    full_name varchar(255),
    age integer
);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY,
    name varchar(255)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id BIGINT REFERENCES species(id);
ALTER TABLE animals ADD owner_id BIGINT REFERENCES owners(id);
