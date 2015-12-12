# fcat_biomass
Development of a biomass framework for the California Forest Climate Action Plan

## Un-utilized logging residuals

Forest management activities in the state result in a residual stream of logging residuals and slash that are either left in the stand to decompose or piled and burned as directed by relevant environmental protection rules ([California Forest Practice Rules](http://calfire.ca.gov/resource_mgt/downloads/2013_FP_Rulebook_with_Tech_RuleNo1.pdf), Article 7 &sect; 917.2). Combustion or decomposition of this residual material results in emissions of greenhouse gasses as/or criteria air pollutants. The California Air Resources Board has published [criterial air pollutant emissions estimates for 2015](http://www.arb.ca.gov/ei/emissiondata.htm). Particulate matter as reported in the criteria air pollutant emissions inventory contains black carbon which is a strong short lived climate pollutant. Here we use a range of 0

In addition the [CARB's 1994 greenhouse gas emissions inventory](http://www.arb.ca.gov/cc/inventory/archive/tables/net_co2_flux_2007-11-19.pdf) estimates emissions from wildfire and slash burning through 2004. 

|    | Source Category            |   MMTCO2 |
|---:|:---------------------------|---------:|
|  0 | Forest and rangeland fires | 2.0194   |
|  1 | Timber harvest slash       | 0.155267 |

The [Timber Products Output](http://srsfia2.fs.fed.us/php/tpo_2009/tpo_rpa_int1.php) provides estimates of logging residues produced from commercial roundwood harvest . This data is based on mill surveys and as such does not capture residual slash produced from management activities that do not produce commercial products.  

## Harvested Wood Products
Harvested wood products data comes from [McIver *et. al.* (2012)](https://docs.google.com/uc?id=0B9-9Vlx0SkkFMkhFZUN5X2djbms&export=download). The following tables have been created:

* **Harvest end-use by year** (MMBF Scribner) assumes that end use fractions presented in McIver (Figure 6) from 2012 apply historically. This assumtion is likely to underrepresent bioenergy, paper and engineered wood products and overemphasize mulch and soil as California's forest products industry has lost much of its secfondary processing capacity as well as its bioenergy infrastrucutre. [link to table](https://github.com/peteWT/fcat_biomass/blob/56770d7d2cd5a38b5f592a45cbcb74d133c7e53f/pd/hrv_by_enduse.csv)
* **Ten-year moving average harvest by by lanowner** (MMBF Scribner) Shows average of harvest and standard deviation for ten year moving windows by ownership category. [link to table](https://github.com/peteWT/fcat_biomass/blob/56770d7d2cd5a38b5f592a45cbcb74d133c7e53f/pd/tenyear_harv.csv)
