-- Function: public.fn_get_sf_block_groups()

-- DROP FUNCTION public.fn_get_sf_block_groups();

CREATE OR REPLACE FUNCTION public.fn_get_sf_block_groups()
  RETURNS text AS
$BODY$
begin
  return (
  select response from public.vw_sf_geojson
  );
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
ALTER FUNCTION public.fn_get_sf_block_groups()
  OWNER TO postgres;
