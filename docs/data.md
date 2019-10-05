# Getting, importing and preparing US census data

## Downloading Data

Two types of imports need be performed.

+ TIGER/Line® Shapefiles
  1. Open the Tiger Shapefiles [search & download site](https://www.census.gov/cgi-bin/geo/shapefiles/)
  2. Select a year
  3. Select layer type
  4. Click Submit
  5. Select a state
  6. Download and extract the zip file.
  7. Repeat from step 2, selecting desired data level: [Cencus Tracts, County subdivision, County, State, Country]
  8. Combine extracted directory's from zip files into a single directory

+ ACS data 
  1. Open the [Advanced Search Page](https://factfinder.census.gov/faces/nav/jsf/pages/searchresults.xhtml?refresh=t#none)
  2. Click "Load search" from the left hand side box: "Your Selections".
  3. Select the ACS search example file provided this repo: docs/database/search-example.aff to see the settings used to import the data provided.
  4. Download and extract the zip file.

  ---

  **ACS Search Example File**

  The search example file in the repo (docs/search-example.aff) populates a search of 2017 ACS 5-year estimates for California,
  change the state tag to select for other states or start a new search to retrieve the data your interested in.

  + Scope
  	- County
  	- County-Sub
  	- Tract
  	- Block Group

  + Common Measures
  	- B01003 TOTAL POPULATION
  	- B15003 EDUCATIONAL ATTAINMENT FOR THE POPULATION 25 YEARS AND OVER
  	- B19001 HOUSEHOLD INCOME IN THE PAST 12 MONTHS
  	- B19051 EARNINGS IN THE PAST 12 MONTHS FOR HOUSEHOLDS
  	- B23025 EMPLOYMENT STATUS FOR THE POPULATION 16 YEARS AND OVER

---

## Importing data

+ #### Importing TIGER/Line® Shapefiles

  Upload each of the .shp files as previously downloaded & extracted.

  *eg:*
  ```bash
    $ cd /downloaded/shapes/single/directory
    $ shp2pgsql -c -D -s 4269 -I tl_2017_06_bg/tl_2017_06_bg.shp {your-table-name} | psql -d {your-db-name}
  ```

  Repeat for all downloaded Shapefiles.

+ #### Importing ACS Data

  ACS data is provided as CSV files, import the ###_with_ann.csv files.

  **Before importing the data it is necessary to remove the first two lines (the column headings) from the csv files.**

  *eg:*
  ```bash
    $ cd /downloaded/extracted/asc-zipfile/contents
    $ cat ACS_17_5YR_B01003_with_ann.csv | psql -d {your-db-name} -c 'COPY {your-table-name} FROM STDIN'
  ```

  Repeat for all *_with_ann.csv files.

+ #### Add Geography column to ACS data tables

  To ease the extraction of geojson a geography column is added to the ACS data tables, then populated by converting the lat/lng column values.

  *eg:*
  ```sql
    # ALTER TABLE {your-table-name} ADD COLUMN geog geography(POINT);
    # update {your-table-name} t
      set geog = ST_SetSRID(
      	ST_MakePoint(
      		CAST(coalesce(t2.intptlon, '0') AS real),
      		CAST(coalesce(t2.intptlat, '0') AS real)
      	),4326)::geography
      from {your-table-name} t2
      where t.gid = t2.gid
   ```
