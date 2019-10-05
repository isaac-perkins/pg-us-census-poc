CREATE TABLE public.acs_population
(
  id integer NOT NULL DEFAULT nextval('acs_population_id_seq'::regclass),
  geoid character varying(32),
  geography text,
  value integer,
  CONSTRAINT acs_population_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
