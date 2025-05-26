alter table "public"."image_individuals"
  add constraint "image_individuals_individual_id_fkey"
  foreign key ("individual_id")
  references "public"."individuals"
  ("id") on update restrict on delete restrict;
