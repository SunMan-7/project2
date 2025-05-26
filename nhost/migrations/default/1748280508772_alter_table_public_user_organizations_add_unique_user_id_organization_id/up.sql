alter table "public"."user_organizations" add constraint "user_organizations_user_id_organization_id_key" unique ("user_id", "organization_id");
