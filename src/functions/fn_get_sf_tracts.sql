-- Function: public.get_sf_tracts()

-- DROP FUNCTION public.get_sf_tracts();

-- SELECT public.get_sf_tracts()

CREATE OR REPLACE FUNCTION public.get_sf_tracts()
  RETURNS TEXT AS
$BODY$
begin
  return (
  select response from public.vw_sf_geojson
  );
end;
$BODY$
  LANGUAGE plpgsql;
ALTER FUNCTION api.get_sf_tracts()
  OWNER TO postgres;
