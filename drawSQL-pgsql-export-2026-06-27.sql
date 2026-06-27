CREATE TABLE "Users"(
    "id" INTEGER NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NULL,
    "email" VARCHAR(255) NOT NULL,
    "new_column" BIGINT NOT NULL,
    "new_column" BIGINT NOT NULL,
    "email_validated" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "email_validation_before_login" BOOLEAN NOT NULL,
    "avatar" VARCHAR(255) NOT NULL,
    "bio" VARCHAR(255) NULL,
    "company" VARCHAR(255) NULL,
    "location" VARCHAR(255) NULL,
    "phone" VARCHAR(255) NULL,
    "website" VARCHAR(255) NULL,
    "social_facebook" VARCHAR(255) NULL,
    "social_instagram" VARCHAR(255) NULL,
    "social_twitter" VARCHAR(255) NULL,
    "social_linkedin" VARCHAR(255) NULL,
    "social_youtube" VARCHAR(255) NULL,
    "social_meetup" VARCHAR(255) NULL,
    "social_evenbrite" VARCHAR(255) NULL,
    "social_slack" VARCHAR(255) NULL,
    "social_discord" VARCHAR(255) NULL,
    "social_github" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "title" VARCHAR(255) NULL,
    "mentoring" VARCHAR(255) NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("id");
CREATE TABLE "partners"(
    "id" BIGINT NOT NULL,
    "group_id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "notes" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NULL,
    "logo" VARCHAR(255) NOT NULL,
    "social_facebook" VARCHAR(255) NULL,
    "social_instagram" VARCHAR(255) NULL,
    "social_twitter" VARCHAR(255) NULL,
    "social_linkedin" VARCHAR(255) NULL,
    "social_youtube" VARCHAR(255) NULL,
    "social_meetup" VARCHAR(255) NULL,
    "social_evenbrite" VARCHAR(255) NULL,
    "social_slack" VARCHAR(255) NULL,
    "social_discord" VARCHAR(255) NULL,
    "social_github" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "partners" ADD PRIMARY KEY("id");
CREATE TABLE "contacts"(
    "id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "notes" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "contacts" ADD PRIMARY KEY("id");
CREATE TABLE "sponsors"(
    "id" BIGINT NOT NULL,
    "group_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "sponsor_pack_id" BIGINT NOT NULL,
    "contact_id" BIGINT NULL,
    "start" DATE NOT NULL,
    "finish" DATE NOT NULL,
    "paid" DATE NULL,
    "price" DOUBLE PRECISION NULL
);
ALTER TABLE
    "sponsors" ADD PRIMARY KEY("id");
CREATE TABLE "venues"(
    "id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "contact_id" BIGINT NULL,
    "address" VARCHAR(255) NOT NULL,
    "address_lat" DOUBLE PRECISION NULL
);
ALTER TABLE
    "venues" ADD PRIMARY KEY("id");
CREATE TABLE "sponsor_packs"(
    "id" BIGINT NOT NULL,
    "group_id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "price" DOUBLE PRECISION NULL
);
ALTER TABLE
    "sponsor_packs" ADD PRIMARY KEY("id");
CREATE TABLE "groups"(
    "id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "logo" VARCHAR(255) NULL,
    "banner" VARCHAR(255) NULL,
    "contact" VARCHAR(255) NULL,
    "website" VARCHAR(255) NULL,
    "description" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NULL,
    "location_lat" DOUBLE PRECISION NULL
);
ALTER TABLE
    "groups" ADD PRIMARY KEY("id");
CREATE TABLE "logins"(
    "provider_id" VARCHAR(255) NOT NULL,
    "provider_key" VARCHAR(255) NOT NULL,
    "user_id" VARCHAR(255) NOT NULL
);
CREATE TABLE "cfps"(
    "id" BIGINT NOT NULL,
    "group_id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "begin" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "close" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "description" VARCHAR(255) NOT NULL,
    "tags" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "cfps" ADD PRIMARY KEY("id");
CREATE TABLE "events"(
    "id" BIGINT NOT NULL,
    "group_id" BIGINT NOT NULL,
    "cfp_id" BIGINT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "start" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "max_attendee" INTEGER NULL,
    "allow_rsvp" BOOLEAN NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "orga_notes_updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "orga_notes_updated_by" BIGINT NOT NULL,
    "venue" BIGINT NULL,
    "talks" VARCHAR(255) NOT NULL,
    "tags" VARCHAR(255) NOT NULL,
    "published" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "meetupgroup" VARCHAR(255) NULL,
    "meetupevent" BIGINT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" BIGINT NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" BIGINT NOT NULL,
    "kind" VARCHAR(255) NULL
);
ALTER TABLE
    "events" ADD PRIMARY KEY("id");
CREATE TABLE "event_rsvps"(
    "id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "answer" VARCHAR(255) NOT NULL,
    "answered_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "event_rsvps" ADD PRIMARY KEY("id");
CREATE TABLE "proposals"(
    "id" BIGINT NOT NULL,
    "talk_id" BIGINT NOT NULL,
    "cfp_id" BIGINT NOT NULL,
    "event_id" BIGINT NULL,
    "status" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "duration" BIGINT NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "speakers" VARCHAR(255) NOT NULL,
    "slides" VARCHAR(255) NULL,
    "video" VARCHAR(255) NULL,
    "tags" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" BIGINT NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" BIGINT NOT NULL,
    "org_tags" VARCHAR(255) NULL,
    "message" VARCHAR(255) NULL
);
ALTER TABLE
    "proposals" ADD PRIMARY KEY("id");
CREATE TABLE "talks"(
    "id" BIGINT NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "duration" BIGINT NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "speakers" VARCHAR(255) NOT NULL,
    "slides" VARCHAR(255) NULL,
    "video" VARCHAR(255) NULL,
    "tags" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "created_by" BIGINT NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_by" BIGINT NOT NULL,
    "message" VARCHAR(255) NULL
);
ALTER TABLE
    "talks" ADD PRIMARY KEY("id");
ALTER TABLE
    "sponsors" ADD CONSTRAINT "sponsors_contact_id_foreign" FOREIGN KEY("contact_id") REFERENCES "contacts"("id");
ALTER TABLE
    "venues" ADD CONSTRAINT "venues_contact_id_foreign" FOREIGN KEY("contact_id") REFERENCES "contacts"("id");