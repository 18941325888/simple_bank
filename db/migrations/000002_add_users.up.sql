CREATE TABLE "users" (
  "username" varchar PRIMARY KEY,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password_change_at" timestamptz NOT NULL DEFAULT '0001-01-01 00:00:00Z',
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "accounts" ADD FOREIGN KEY ("owner") REFERENCES "users" ("username");

ALTER TABLE "accounts" ADD CONSTRAINT "owner_currency_key" UNIQUE("owner","currency");

COMMENT ON COLUMN "users"."username" IS 'owner';

COMMENT ON COLUMN "users"."hashed_password" IS '密码';

COMMENT ON COLUMN "users"."full_name" IS '全名';

COMMENT ON COLUMN "users"."email" IS '电子邮件';

COMMENT ON COLUMN "users"."password_change_at" IS '上次修改密码时间';

COMMENT ON COLUMN "users"."created_at" IS '创建时间';