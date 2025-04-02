CREATE TABLE public.deployments (id int4 GENERATED ALWAYS AS IDENTITY, start_date timestamptz NOT NULL, end_date timestamptz NOT NULL, location_id int4 NOT NULL, camera_id int4 NOT NULL, subproject_id int4, check_number int2, camera_placement int2, setup_person text, pickup_person text, failure_type text, has_media bool DEFAULT 'true', is_upload_complete bool DEFAULT 'false', metadata jsonb, remarks text, project_id int4 NOT NULL, deployment_name text UNIQUE NOT NULL, PRIMARY KEY (id), FOREIGN KEY (location_id) REFERENCES public.locations (id) ON UPDATE RESTRICT ON DELETE RESTRICT, FOREIGN KEY (camera_id) REFERENCES public.cameras (id) ON UPDATE RESTRICT ON DELETE RESTRICT, FOREIGN KEY (subproject_id) REFERENCES public.subprojects (id) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (project_id) REFERENCES public.projects (id) ON UPDATE RESTRICT ON DELETE RESTRICT);
