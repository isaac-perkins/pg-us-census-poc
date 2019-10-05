-- View: public.vw_sf_block_groups
 -- DROP VIEW public.vw_sf_block_groups;

CREATE OR REPLACE VIEW public.vw_sf_block_groups AS
SELECT p.id,
       p.value AS population,
       bg.tractce AS tract,
       bg.blkgrpce AS block_group,
       bg.geom,
       bg.geog
FROM acs_population p
JOIN shape_block_groups bg ON bg.geoid::text = "substring"(p.geoid::text, 10)
WHERE p.geography ~ 'Block Group'::text
  AND p.geography ~ 'San Francisco'::text
ORDER BY bg.tractce,
         bg.blkgrpce;

ALTER TABLE public.vw_sf_block_groups OWNER TO postgres;

GRANT ALL ON TABLE public.vw_sf_block_groups TO postgres;

GRANT SELECT ON TABLE public.vw_sf_block_groups TO anon;
