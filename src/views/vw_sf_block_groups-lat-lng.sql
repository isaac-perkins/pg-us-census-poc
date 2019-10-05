--select * from public.sf_block_groups limit 10
CREATE OR REPLACE VIEW public.vw_sf_block_groups AS 
 SELECT *,
    st_distance(c.x, t.geog) AS distance
   FROM tracts t,
    ( SELECT st_geographyfromtext('SRID=4326;POINT(-122.4194 37.7749)'::text) AS st_geographyfromtext) c(x)
  WHERE st_dwithin(c.x, t.geog, 5000::double precision)
  ORDER BY (st_distance(c.x, t.geog));

ALTER TABLE public.vw_sf_tracts
  OWNER TO postgres;
