create extension ci_text;
create extension pgcrypto;

create table auths(
  id bigserial primary key not null,
  pass text not null,
  email_citext not null unique,
  email_verification_code not null,
  is_email_verified boolean not null
);
