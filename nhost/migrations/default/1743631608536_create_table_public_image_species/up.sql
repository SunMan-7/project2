CREATE TABLE public.image_species (id int4 GENERATED ALWAYS AS IDENTITY, image_file_id uuid NOT NULL, species_id int4 NOT NULL, individual_count int2, PRIMARY KEY (id), FOREIGN KEY (image_file_id) REFERENCES public.images (file_id) ON UPDATE RESTRICT ON DELETE CASCADE, FOREIGN KEY (species_id) REFERENCES public.species (id) ON UPDATE RESTRICT ON DELETE RESTRICT);
