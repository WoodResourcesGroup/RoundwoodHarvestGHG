usfsUrl := http://data.fs.usda.gov/geodata/edw/edw_resources/shp/
dbname := fcat
calFireUrl := ftp://ftp.fire.ca.gov/forest/Statewide_Timber_Harvest/
usfsFeat := S_USA.Activity_HazFuelTrt_PL S_USA.Activity_TimberHarvest S_USA.Activity_StwrdshpCntrctng_PL S_USA.Activity_IRR_PL 

db:
	createdb ${dbname}
	psql -d ${dbname} -c 'create extension postgis;'
	mkdir $@

src_data :
	mkdir $@
### Baileys Ecoregions
db/ecoregions_sgca: src_data
	curl  http://srfs.wr.usgs.gov/Fresc_ScienceData/$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269  $</$(@F).shp bailey| psql -d ${dbname}
	touch $@


### CalFire Spatial Data
db/Statewide_THPS_NTMPS_April2015: src_data
	curl  ${calFireUrl}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	ogr2ogr -overwrite -f "PostgreSQL" PG:"dbname=${dbname}" -nln ntmps $</Statewide_THPS_NTMPS_April2015/Statewide_THPS_NTMPS_April2015.gdb NTMPS
	ogr2ogr -overwrite -f "PostgreSQL" PG:"dbname=${dbname}" -nln thps $</Statewide_THPS_NTMPS_April2015/Statewide_THPS_NTMPS_April2015.gdb THPS
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
	shp2pgsql -I -d -s 4269 -W LATIN1 $</$(@F).shp usfs_timber| psql -d ${dbname}
	touch $@

db/S_USA.Activity_StwrdshpCntrctng_PL : src_data
	curl  ${usfsUrl}$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269 -W LATIN1 $</$(@F).shp usfs_stw| psql -d ${dbname}
	touch $@

.PHONY: import_data
import_data : db/S_USA.Activity_HazFuelTrt_PL db/S_USA.Activity_TimberHarvest db/S_USA.Activity_StwrdshpCntrctng_PL 
