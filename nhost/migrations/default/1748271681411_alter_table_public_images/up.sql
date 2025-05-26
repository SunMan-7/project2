ALTER TABLE public.images ADD CONSTRAINT images_deployment_id_fkey FOREIGN KEY (deployment_id) REFERENCES public.deployments (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE public.images ADD CONSTRAINT images_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
