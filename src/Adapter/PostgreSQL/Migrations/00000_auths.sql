CREATE EXTENSION IF NOT EXISTS citext;
create extension IF NOT EXISTS pgcrypto;

create table IF NOT EXISTS auths(
  id bigserial primary key not null,
  pass text not null,
  email citext unique not null ,
  email_verification_code text not null,
  is_email_verified boolean not null
);
