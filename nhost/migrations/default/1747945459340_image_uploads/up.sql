CREATE TABLE public.image_uploads (id int4 GENERATED ALWAYS AS IDENTITY, submits int2 NOT NULL, uploads int2, start_time timestamptz NOT NULL, end_time timestamptz, status text NOT NULL, project_id int4 NOT NULL, PRIMARY KEY (id));

