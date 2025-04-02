CREATE TABLE public.individuals (id int4 GENERATED ALWAYS AS IDENTITY, individual_name text, code_name text UNIQUE NOT NULL, remarks text, species_id int4 NOT NULL, year_discovered text, age text, sex text, PRIMARY KEY (id), FOREIGN KEY (species_id) REFERENCES public.species (id) ON UPDATE RESTRICT ON DELETE RESTRICT);
