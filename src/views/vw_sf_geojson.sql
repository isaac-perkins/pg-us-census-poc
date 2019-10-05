-- View: public.vw_sf_geojson
 -- DROP VIEW public.vw_sf_geojson;

CREATE OR REPLACE VIEW public.vw_sf_geojson AS
SELECT jsonb_build_object('type', 'FeatureCollection', 'features', jsonb_agg(features.feature)) AS response
FROM
  (SELECT jsonb_build_object(
    'type',
    'Feature',
    'id', "row".id,
    'geometry', st_asgeojson("row".geom)::JSONB,
    'properties', to_jsonb("row".*) - 'gid'::text - 'geom'::text
    ) AS feature
   FROM
     (SELECT * FROM vw_sf_block_groups bg) "row") features;


ALTER TABLE public.vw_sf_geojson OWNER TO postgres;

GRANT ALL ON TABLE public.vw_sf_geojson TO postgres;

GRANT
SELECT ON TABLE public.vw_sf_geojson TO anon;
