# ![Logo](https://raw.githubusercontent.com/webanet-australia/pg-us-census-poc/master/logo.jpg) U.S Census Google Maps with PostgreSQL
![License: MIT](https://img.shields.io/github/license/mashape/apistatus.svg)

This repo represents a basic proof of concept for using PostgreSQL with the PostGIS extension served with PostgREST to generate Google Maps. See it in action [here](http://census.preset.cloud/). 

The included database dump is populated with demographics (total population for San Francisco at block group level) from
[factfinder.census.gov](https://factfinder.census.gov) and [TIGER/Line® Shapefiles](https://www.census.gov/cgi-bin/geo/shapefiles/). Linking these tables within
the database and wrapping them with some views and functions allows the data to very easily be displayed in Google Maps with the maps api using map.data.addGeoJson().

This is just a simple demo, there are plenty of optimizations and work to be done for a production version. It took time to figure out and get working, hopefully this repo will save somebody that time getting started.

#### Screenshot showing block groups for San Francisco
![Screenshot](docs/screenshot.jpg)

In the setup code below **replace**: *{your-db-name}* *{your-table-name}* *{your-db-username}* *{your-db-password}*

with values for your environment. (Yes, the curly brackets too). Run commands from this repo's root directory.

## Installation and Usage

- Install the pre-requisites, PostgreSQL, PostGIS and PostgREST. Instructions (for Ubuntu) can be found [here](docs/install.md), though should easily translate to other OS's.
- [Download](https://github.com/webanet-australia/postgres-census-poc/archive/master.zip) or clone this repo.
- Create a new database and add a role for PostgREST.
   ```bash
     cd repo/root-directory
     psql -U postgres
   ```
   ```sql
     CREATE DATABASE {your-db-name};
     CREATE ROLE anon NOSUPERUSER NOINHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
   ```
- Restore db dump
   ```bash
     pg_restore -U postgres -d {your-db-name} -1 db/pg-census-poc.dump
   ```
- Edit PostgREST configuration with details of your environment (pretty self explanatory) but the documentation can be [found here](http://postgrest.org/en/v6.0/install.html#configuration)
- Start PostgREST

   ```bash
     bin/postgrest conf/postgrest.conf
   ```
- Edit public/index.html, enter {Your-Google-Maps-API-Key}
- File open public/index.html in your browser.

---

## Downloading and importing other data

Check out [docs/data.md](docs/data.md) for details on downloading and importing more data.

---

#### References:
- [https://tilemill-project.github.io/tilemill/docs/guides/postgis-work/](https://tilemill-project.github.io/tilemill/docs/guides/postgis-work/)
- [https://sparkgeo.com/blog/building-a-us-census-tracts-postgis-database/](https://sparkgeo.com/blog/building-a-us-census-tracts-postgis-database/)
- [https://gis.stackexchange.com/questions/14514/exporting-feature-geojson-from-postgis](https://gis.stackexchange.com/questions/14514/exporting-feature-geojson-from-postgis)
- [https://developers.google.com/maps/documentation/javascript/combining-data](https://developers.google.com/maps/documentation/javascript/combining-data)

#### Data:
- [https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml](https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml)
- [https://www.census.gov/cgi-bin/geo/shapefiles2010/main](https://www.census.gov/cgi-bin/geo/shapefiles2010/main)
