CREATE TABLE public.identification_history (id int8 GENERATED ALWAYS AS IDENTITY, image_file_id uuid NOT NULL, identify_by text NOT NULL, identify_at timestamptz DEFAULT now() NOT NULL, type text NOT NULL, PRIMARY KEY (id), FOREIGN KEY (image_file_id) REFERENCES public.images (file_id) ON UPDATE RESTRICT ON DELETE CASCADE);
