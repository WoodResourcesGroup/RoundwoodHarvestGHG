# Climate impacts of woody biomass fates: Current practices and opportuinites


In addition to sawlogs, forest management activities in the state result in a  stream of logging residuals and slash that are either left in the stand to decompose or piled and burned as directed by relevant environmental protection rules ([California Forest Practice Rules](http://calfire.ca.gov/resource_mgt/downloads/2013_FP_Rulebook_with_Tech_RuleNo1.pdf), Article 7 &sect; 917.2). Combustion or decomposition of this residual material results in emissions of greenhouse gasses as/or criteria air pollutants.

## Estimating slash residual GHG emissions from current forest practices.

Emissions from forest management residuals result from:

1. Anthropogenic buring (prescribed fire, pile buring)
2. Wildfire
3. Decomposition

To estimate emissions from these three sources we must rely on estimates from the must current [statewide emissions inventory](http://www.arb.ca.gov/ei/ei.htm)maintained by the California Air Resources Board. The Criterial Air Pollutant (CEP) emissions inventory and the Greenhouse Gas (GHG) emissions inventory are both necessary sources for establishing aggregate annnual climate-forcing emissions. The GHG inventory captures gasses with radiative forcing propeties but does not capture elemantal carbon or black carbon (BC) emissions which have strong radiative forsing properties. While the [Short Lived Climate Pollutant Strategy](https://docs.google.com/uc?id=0B9-9Vlx0SkkFWmxxQ2xtSkNxSlU&export=download) recognizes the importance of forest biomass management it does not publish an emission estimate fro BC.

 The California Air Resources Board has published [criterial air pollutant emissions estimates for 2015](http://www.arb.ca.gov/ei/emissiondata.htm). Particulate matter as reported in the criteria air pollutant emissions inventory contains black carbon which is a strong short lived climate pollutant.

|    |   gwp_20 |   gwp_20_std |   gwp_100 |   gwp_100_std |   gwp_500 |   gwp_500_std | source                          |
|---:|---------:|-------------:|----------:|--------------:|----------:|--------------:|:--------------------------------|
|  0 |     2200 |       888.82 |    633.33 |        255.41 |    193.33 |         77.67 | Fuglestvedt2000                 |
|  1 |     3200 |       nan    |    900    |        nan    |    nan    |        nan    | CaliforniaAirResourcesBoard2015 |
[Global warming potential estimates for black carbon from biomass buring]

CARB reports emissions from PM 2.5 in tons/day. Black Carbon emissions can be estimated from PM 2.5 emissions if the ratio of smouldering to flaming combustion is known. Ward et. al. (1989) provide estimates of the ratio of smouldering to flaming combustion for a hand/machine piled burns, prescribed natural fire and wildfire. The following ranges are used in estimating BC emissions from PM2.5 emissions reported by CARB.

| CARB CPE Cat.           |   BC/t PM 2.5 (high) |   BC/t PM 2.5 (low) | Source                  |
|:------------------------|---------------------:|--------------------:|:------------------------|
| FOREST MANAGEMENT       |            0.0064695 |           0.0043405 | piles                   |
| WILDLAND FIRE USE (WFU) |            0.156683  |           0.06065   | prescribed natural fire |
| ALL VEGETATION          |            0.198383  |           0.0767915 | wildfire                |

The following plot represents estimates of total BC emissions resulting from combustion of biomass in the CARB CPE emissions categores reflecting woody biomass combustion in wildfire, pile buring and prescribed natural fire.

![BC GHG](/graphics/bc_gwp.png?raw=true)


In addition the [CARB's 1994 greenhouse gas emissions inventory](http://www.arb.ca.gov/cc/inventory/archive/tables/net_co2_flux_2007-11-19.pdf) estimates emissions from wildfire and slash burning through 2004. 

|    | Source Category            |   MMTCO2 |
|---:|:---------------------------|---------:|
|  0 | Forest and rangeland fires | 2.0194   |
|  1 | Timber harvest slash       | 0.155267 |

To arrive at an estimate of total annual emissions from buring forest management residuals in CO2 equivalent terms from published CARB estimates we can combine the CO2 emissions reported for 2004 in the LULUC Biodegradable Carbon Emissions and Sinks with black carbon emissions extrapolated from the CARB Criteria Air Pollutant Emissions inventory estimates. The dime discreppancy between the 2004 and 2015 is acknowledged as an irreconcilable source of uncertainty in this estimation among others. This does however reflect that a baseline of substantial emissions from forest management residuals has been reported in CARB emissions inventories and should be recognized as a baseline condition. We find that a rough estimate of CO2e emissions from pile burning annual approaches 1 Mt CO2e.

|    |   Mt CO2e | Source               |
|---:|----------:|:---------------------|
|  0 |  0.171152 | CO2 pile buring      |
|  1 |  0.651688 | CO2e BC pile burning |
|  2 |  0.82284  | Total Mt CO2e        |

BC emissions in terms of CO2e has not been included in any GHG emissions inventry published by CARB.


The [Timber Products Output](http://srsfia2.fs.fed.us/php/tpo_2009/tpo_rpa_int1.php) provides estimates of logging residues produced from commercial roundwood harvest . This data is based on mill surveys and as such does not capture residual slash produced from management activities that do not produce commercial products.  

## Harvested Wood Products
Harvested wood products data comes from [McIver *et. al.* (2012)](https://docs.google.com/uc?id=0B9-9Vlx0SkkFMkhFZUN5X2djbms&export=download). The following tables have been created:

* **Harvest end-use by year** (MMBF Scribner) assumes that end use fractions presented in McIver (Figure 6) from 2012 apply historically. This assumtion is likely to underrepresent bioenergy, paper and engineered wood products and overemphasize mulch and soil as California's forest products industry has lost much of its secfondary processing capacity as well as its bioenergy infrastrucutre. [link to table](https://github.com/peteWT/fcat_biomass/blob/56770d7d2cd5a38b5f592a45cbcb74d133c7e53f/pd/hrv_by_enduse.csv)
* **Ten-year moving average harvest by by lanowner** (MMBF Scribner) Shows average of harvest and standard deviation for ten year moving windows by ownership category. [link to table](https://github.com/peteWT/fcat_biomass/blob/56770d7d2cd5a38b5f592a45cbcb74d133c7e53f/pd/tenyear_harv.csv)

## References
1. Ward DE, Hardy CC. Organic and elemental profiles for smoke from prescribed fires. In: Watson JG, editor. International specialty conference of the Air and Waste Management Association [Internet]. San Francisco: Air and Waste Management Association; 1989. Available from: (http://www.frames.gov/documents/smoke/serdp/ward_hardy_1989a.pdf)[http://www.frames.gov/documents/smoke/serdp/ward_hardy_1989a.pdf]