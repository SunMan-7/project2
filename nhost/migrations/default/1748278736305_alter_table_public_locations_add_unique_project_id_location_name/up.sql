alter table "public"."locations" add constraint "locations_project_id_location_name_key" unique ("project_id", "location_name");
