alter table "public"."user_projects" add constraint "user_projects_project_id_user_id_key" unique ("project_id", "user_id");
