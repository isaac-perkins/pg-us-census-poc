
# Ubuntu Install

**Pre-Requisites:**
- PostgreSQL  > 9.6 or latest
- PostGIS > latest
- PostgREST > latest

---

## Install PostgreSQL PostGIS

```bash
$ sudo add-apt-repository ppa:ubuntugis
$ sudo apt-get update
$ sudo apt-get install postgresql-10 postgresql-contrib-10 postgis postgresql-10-postgis-scripts
```

---

## Clone Project

```bash
$ git clone https://github.com/webanet-australia/postgres-census-poc.git
$ cd postgres-census-poc
```

---

## Install PostgREST

Use the included executable from the repo: bin/postgrest or download from https://github.com/PostgREST/postgrest/releases/latest

```bash
$ tar xfJ postgrest-<version>-<platform>.tar.xz -C bin/postgrest
```
