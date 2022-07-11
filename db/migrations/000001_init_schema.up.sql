CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "accounts"."owner" IS '用户';

COMMENT ON COLUMN "accounts"."balance" IS '余额';

COMMENT ON COLUMN "accounts"."currency" IS '币种';

COMMENT ON COLUMN "accounts"."created_at" IS '创建时间';

COMMENT ON COLUMN "entries"."account_id" IS '用户id';

COMMENT ON COLUMN "entries"."amount" IS '交易金额';

COMMENT ON COLUMN "entries"."created_at" IS '创建时间';

COMMENT ON COLUMN "transfers"."from_account_id" IS '转出用户id';

COMMENT ON COLUMN "transfers"."to_account_id" IS '转入账户id';

COMMENT ON COLUMN "transfers"."amount" IS '转账金额';

COMMENT ON COLUMN "transfers"."created_at" IS '创建时间';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
