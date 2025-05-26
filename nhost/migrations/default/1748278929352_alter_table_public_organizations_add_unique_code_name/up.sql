alter table "public"."organizations" drop constraint "organizations_code_name_key";
alter table "public"."organizations" add constraint "organizations_code_name_key" unique ("code_name");
