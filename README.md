#Climate impacts of forest management

This web archive contains source code, source code documentation, and detailed description of the context, methods and results from analysis done to support the [Forest Climate Action Plan](http://www.fire.ca.gov/fcat/) and [California Assembly Bill 1504 (2010)](http://leginfo.legislature.ca.gov/faces/billNavClient.xhtml?bill_id=200920100AB1504). This work was done by [Peter Tittmann](http://ucanr.edu/?facultyid=22593), Academic Coordinator at the UC Berkeley Center for Forestry under Cooperative Agreement between the US Forest Service, the California Department of Forestry and Fire Protection and the UC Berkeley Center for Forestry. Dr. John Shelly (Emeritus) is the Primary Investigator on this project.


## Documentation

Context, methods, and results of this analysis are available on the [Wiki](https://github.com/peteWT/fcat_biomass/wiki).

## Implementation

The code for this analysis was written mostly in Python with bits of SQL and Make scattered about. IPython notebooks detailing data processing and calculations ara available for:

+ [Biomass burning black carbon and GHG]()
+ [Harvested wood products]()
+ [Displacement factor for biomass on CA Grid]()

Output tables can be found in the `pd/` directory.

The `Makefile` contains targets for building a PostgreSQL database with the PostGIS spatial extension which was used to make some of the output tables found in `/pd`.

## Downloading/Contributing

This archive can be saved locally using the following [link](https://github.com/peteWT/fcat_biomass/archive/master.zip). To contribute to the project please get a GitGub account (free) and review [GitHubs options](https://guides.github.com/activities/contributing-to-open-source/). [Contact Peter](mailto:ptittmann@gmail.com) to request contributor status.

The `.ipynb` files require python libraries listed in [`requirements.txt`](https://github.com/peteWT/fcat_biomass/blob/master/requirements.txt). Best way to meet them is to install Python and [PyPA](https://pip.pypa.io/en/stable/), create a [virtualenv](https://virtualenv.readthedocs.org/en/latest/) in the base directory (`fcat_biomass/`), activate it, and then run:

`$ pip install -r requirements.txt`


Some of the python libraries expect system libraries that may or may not be installed depending upon your OS. Check (`INSTALL.md`)[https://github.com/peteWT/fcat_biomass/blob/master/INSTALL.md] for additional notes on these issues.
