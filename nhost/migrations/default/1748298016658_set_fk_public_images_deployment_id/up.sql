alter table "public"."images" drop constraint "images_deployment_id_fkey",
  add constraint "images_deployment_id_fkey"
  foreign key ("deployment_id")
  references "public"."deployments"
  ("id") on update restrict on delete restrict;
