
CREATE TABLE public.shape_block_groups
(
  gid integer NOT NULL DEFAULT nextval('block_groups_gid_seq'::regclass),
  statefp character varying(2),
  countyfp character varying(3),
  tractce character varying(6),
  blkgrpce character varying(1),
  geoid character varying(12),
  namelsad character varying(13),
  mtfcc character varying(5),
  funcstat character varying(1),
  aland double precision,
  awater double precision,
  intptlat character varying(11),
  intptlon character varying(12),
  geom geometry(MultiPolygon,4269),
  geog geography(Point,4326),
  CONSTRAINT block_groups_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
