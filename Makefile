usfsUrl := http://data.fs.usda.gov/geodata/edw/edw_resources/shp/
dbname := fcat
calFireUrl := ftp://ftp.fire.ca.gov/forest/Statewide_Timber_Harvest/
ecoReg := http://www.fs.fed.us/rm/ecoregions/downloads/ecoregions-united-states/data-sets/
srid := 2163



db:
	createdb ${dbname}
	psql -d ${dbname} -c 'create extension postgis;'
	mkdir $@


src_data :db
	mkdir $@

##State Boundary	
db/cb_2014_us_state_500k: src_data
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/$(@F).zip > $</$(@F).zip
	unzip -n -d $< $</$(@F).zip
	shp2pgsql -I -d -s 4269:${srid}  $</$(@F).shp states| psql -d ${dbname}
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
	ogr2ogr -overwrite -f "PostgreSQL" PG:"dbname=${dbname}" -t_srs EPSG:${srid} -nln ntmps $</Statewide_THPS_NTMPS_April2015/Statewide_THPS_NTMPS_April2015.gdb NTMPS
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
import_data : db/S_USA.Activity_HazFuelTrt_PL db/S_USA.Activity_TimberHarvest db/S_USA.Activity_StwrdshpCntrctng_PL db/umt_data db/Statewide_THPS_NTMPS_April2015 db/eco-us-shp db/cb_2014_us_state_500k

pd:
	mkdir $@

db/fcat_views:
	psql -d ${dbname} -f fcat_views.sql
	touch $@

pd/hrv_by_enduse.csv: db/fcat_views
	psql -d ${dbname} -c 'copy (select * from $(notdir $(basename $@))) to stdout with csv header' > $@

pd/tenyear_harv.csv: db/fcat_views
		psql -d ${dbname} -c 'copy (select * from $(notdir $(basename $@))) to stdout with csv header' > $@

pd/facts_notimber.csv:
	psql -d ${dbname} -c "copy (select f.subunit, f.facts_id, f.uom, f.date_plann, f.date_accom,f.date_compl, f.nbr_units_, f.nbr_units1, activity, method, equipment  from f_haz f left join usfs_timber t using(facts_id) where t.facts_id is NULL and f.admin_regi = '05') to stdout with csv header" > $@

.PHONY: fcat_out
fcat_out: db/fcat_views pd/hrv_by_enduse.csv pd/tenyear_harv.csv

db/lte_pfirs:
	unzip lf/pfirs.zip -d lf
	python -c "import os; import utils as ut; db = ut.sqlitedb('fcat_biomass'); [ut.csv2sqlite(db['cx'], 'lf/'+i) for i in os.listdir('lf/') if os.path.splitext(i)[1] == '.csv']"
	rm lf/*.csv
	touch $@
