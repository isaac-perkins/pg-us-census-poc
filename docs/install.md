
# Ubuntu Install

**Pre-Requisites:**
- PostgreSQL  > 9.6 or latest
- PostGIS > latest
- PostgREST > latest

---

## Install PostgreSQL PostGIS

```bash
sudo add-apt-repository ppa:ubuntugis
sudo apt-get update
sudo apt-get install postgresql-10 postgresql-contrib-10 postgis postgresql-10-postgis-scripts
```

---

## Clone Project

```bash
git clone https://github.com/webanet-australia/pg-us-census-poc/
cd pg-us-census-poc
```

---

## Install PostgREST

Download an executable for your OS from https://github.com/PostgREST/postgrest/releases/latest and move it to the bin directory for this repo.

```bash
tar xfJ postgrest-<version>-<platform>.tar.xz -C bin/postgrest
```
