CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "image" blob);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "commenter" varchar, "body" text, "article_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_comments_on_article_id" ON "comments" ("article_id");
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar, "image" blob, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
INSERT INTO schema_migrations (version) VALUES ('20150211222510');

INSERT INTO schema_migrations (version) VALUES ('20150213203027');

INSERT INTO schema_migrations (version) VALUES ('20150307201249');

INSERT INTO schema_migrations (version) VALUES ('20150307203458');

INSERT INTO schema_migrations (version) VALUES ('20150322004842');

INSERT INTO schema_migrations (version) VALUES ('20150322032842');

INSERT INTO schema_migrations (version) VALUES ('20150322051717');

