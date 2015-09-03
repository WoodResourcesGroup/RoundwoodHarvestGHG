usfsUrl := http://data.fs.usda.gov/geodata/edw/edw_resources/shp/
dbname := fcat
calFireUrl := ftp://ftp.fire.ca.gov/forest/Statewide_Timber_Harvest/
ecoReg := http://www.fs.fed.us/rm/ecoregions/downloads/ecoregions-united-states/data-sets/
srid := 102008
sridProj := '+proj=aea +lat_1=20 +lat_2=60 +lat_0=40 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs '

db:
	createdb ${dbname}
	psql -d ${dbname} -c 'create extension postgis;'
	psql -d ${dbname} -f project_srs.sql
	mkdir $@


src_data :
	mkdir $@

##State Boundary	
db/cb_2014_us_state_500k: src_data
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s :${srid}  $</$(@F).shp states| psql -d ${dbname}
	touch $@

### Baileys Ecoregions
db/eco-us-shp: src_data
	curl  ${ecoReg}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269:${srid}  $</eco_us.shp bailey| psql -d ${dbname}
	touch $@


### CalFire Spatial Data
db/Statewide_THPS_NTMPS_April2015: src_data
	curl  ${calFireUrl}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	ogr2ogr -overwrite -f "PostgreSQL" PG:"dbname=${dbname}" -t_srs ${srid} -nln ntmps $</Statewide_THPS_NTMPS_April2015/Statewide_THPS_NTMPS_April2015.gdb NTMPS
	ogr2ogr -overwrite -f "PostgreSQL" PG:"dbname=${dbname}" -t_srs ${srid} -nln thps $</Statewide_THPS_NTMPS_April2015/Statewide_THPS_NTMPS_April2015.gdb THPS
	touch $@

###PNW Data
db/umt_data: src_data
	python umt_data.py
	touch $@



### USFS Spatial Data

db/S_USA.Activity_HazFuelTrt_PL : src_data
	curl  ${usfsUrl}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269 -W LATIN1 $</$(@F).shp f_haz| psql -d ${dbname}
	touch $@

db/S_USA.Activity_TimberHarvest : src_data
	curl  ${usfsUrl}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269:${srid} -W LATIN1 $</$(@F).shp usfs_timber| psql -d ${dbname}
	touch $@

db/S_USA.Activity_StwrdshpCntrctng_PL : src_data
	curl  ${usfsUrl}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269:${srid} -W LATIN1 $</$(@F).shp usfs_stw| psql -d ${dbname}
	touch $@

.PHONY: import_data
import_data : db/S_USA.Activity_HazFuelTrt_PL db/S_USA.Activity_TimberHarvest db/S_USA.Activity_StwrdshpCntrctng_PL 
