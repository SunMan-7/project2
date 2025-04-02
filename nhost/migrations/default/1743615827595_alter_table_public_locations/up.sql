ALTER TABLE public.locations DROP CONSTRAINT IF EXISTS locations_organization_id_fkey;
ALTER TABLE public.locations DROP CONSTRAINT IF EXISTS locations_project_id_fkey;
ALTER TABLE public.locations ADD CONSTRAINT locations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE public.locations ADD CONSTRAINT locations_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
