

CREATE OR REPLACE VIEW public.vw_sf_tracts AS 
 SELECT t.gid,
    t.statefp10,
    t.countyfp10,
    t.tractce10,
    t.blockce10,
    t.geoid10,
    t.name10,
    t.mtfcc10,
    t.ur10,
    t.uace10,
    t.uatype,
    t.funcstat10,
    t.aland10,
    t.awater10,
    t.intptlat10,
    t.intptlon10,
    t.geom,
    t.geog,
    c.x,
    st_distance(c.x, t.geog) AS distance
   FROM tracts t,
    ( SELECT st_geographyfromtext('SRID=4326;POINT(-122.4194 37.7749)'::text) AS st_geographyfromtext) c(x)
  WHERE st_dwithin(c.x, t.geog, 5000::double precision)
  ORDER BY (st_distance(c.x, t.geog));

ALTER TABLE public.vw_sf_tracts
  OWNER TO postgres;
