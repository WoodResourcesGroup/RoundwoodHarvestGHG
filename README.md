<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Climate impacts of woody biomass fates: Current practices and opportunities](#climate-impacts-of-woody-biomass-fates-current-practices-and-opportunities)
    - [Estimating CO2 equivalent emissions from forest biomass burning](#estimating-co2-equivalent-emissions-from-forest-biomass-burning)
    - [Harvested wood products](#harvested-wood-products)
        - [-](#-)
    - [References](#references)

<!-- markdown-toc end -->
# Climate impacts of woody biomass fates: Current practices and opportunities


In addition to sawlogs, forest management activities in the state result in a  stream of logging residuals and slash that are either left in the stand to decompose or piled and burned as directed by relevant environmental protection rules ([California Forest Practice Rules](http://calfire.ca.gov/resource_mgt/downloads/2013_FP_Rulebook_with_Tech_RuleNo1.pdf), Article 7 &sect; 917.2). Combustion or decomposition of this residual material results in emissions of greenhouse gasses as/or criteria air pollutants.

The objective of this analysis is, broadly stated: 

_To establish an emissions baseline for forest products including unutilized forest management residuals._

This is an ambitious goal given the sparse data available and ultimately I provide estimates where I can and leave placeholders where additional empirical data are needed.

It is **critical** to note that the empirical data used in this analysis reflect point-in-time measures that are affected by a dynamic system of climate, growth, and mortality in forests as well as macroeconomic and policy forces. To effective manage forests for climate (and/or other) benefits, a process modeling approach is necessary. This analysis may provide insight into opportunities to more effectively utilize woody biomass residuals from current forest management activities based on available historical data.

Several key tasks are necessary to address the objective stated above:

1. Estimate CO2 equivalent emissions from burning forest management residuals using criteria pollutant and GHG emissions inventory published by the California Air Resources Board 
2. Estimate the volume and fate of wood removed from, left in the forest, and burned as a result of direct anthropogenic management activities.
3. Establish life-cycle displacement or emissions factors for all utilized wood/

## Estimating CO2 equivalent emissions from forest biomass burning

Emissions from forest biomass burning are published in the most current [statewide emissions inventory](http://www.arb.ca.gov/ei/ei.htm) maintained by the California Air Resources Board. The Criteria Air Pollutant (CPE) emissions inventory and the Greenhouse Gas (GHG) emissions inventory are both necessary sources for establishing aggregate annual climate-forcing emissions. The GHG inventory captures gasses with radiative forcing properties but does not capture elemental carbon or black carbon (BC) emissions which have strong radiative forcing properties. While the [Short Lived Climate Pollutant Strategy](https://docs.google.com/uc?id=0B9-9Vlx0SkkFWmxxQ2xtSkNxSlU&export=download) recognizes the importance of forest biomass management it does not publish an emission estimate fro BC.

 The California Air Resources Board has published [criteria air pollutant emissions estimates for 2015](http://www.arb.ca.gov/ei/emissiondata.htm). Particulate matter as reported in the criteria air pollutant emissions inventory contains black carbon which is a strong short lived climate pollutant.

|    |   gwp_20 |   gwp_20_std |   gwp_100 |   gwp_100_std |   gwp_500 |   gwp_500_std | source                          |
|---:|---------:|-------------:|----------:|--------------:|----------:|--------------:|:--------------------------------|
|  0 |     2200 |       888.82 |    633.33 |        255.41 |    193.33 |         77.67 | Fuglestvedt2000                 |
|  1 |     3200 |       nan    |    900    |        nan    |    nan    |        nan    | CaliforniaAirResourcesBoard2015 |
[Global warming potential estimates for black carbon from biomass burning]

CARB reports emissions from PM 2.5 in tons/day. Black Carbon emissions can be estimated from PM 2.5 emissions if the ratio of smoldering to flaming combustion is known. Ward et. al. (1989) provide estimates of the ratio of smoldering to flaming combustion for a hand/machine piled burns, prescribed natural fire and wildfire. The following ranges are used in estimating BC emissions from PM2.5 emissions reported by CARB.

| CARB CPE Cat.           |   BC/t PM 2.5 (high) |   BC/t PM 2.5 (low) | Source                  |
|:------------------------|---------------------:|--------------------:|:------------------------|
| FOREST MANAGEMENT       |            0.0064695 |           0.0043405 | piles                   |
| WILDLAND FIRE USE (WFU) |            0.156683  |           0.06065   | prescribed natural fire |
| ALL VEGETATION          |            0.198383  |           0.0767915 | wildfire                |

The following plot represents estimates of total BC emissions resulting from combustion of biomass in the CARB CPE emissions categories reflecting woody biomass combustion in wildfire, pile burning and prescribed natural fire.

![BC GHG](/graphics/bc_gwp.png?raw=true)


In addition the [CARB's 1994 greenhouse gas emissions inventory](http://www.arb.ca.gov/cc/inventory/archive/tables/net_co2_flux_2007-11-19.pdf) estimates emissions from wildfire and slash burning through 2004. 

|    | Source Category            |   MMTCO2 |
|---:|:---------------------------|---------:|
|  0 | Forest and rangeland fires | 2.0194   |
|  1 | Timber harvest slash       | 0.155267 |

To arrive at an estimate of total annual emissions from burning forest management residuals in CO2 equivalent terms from published CARB estimates we can combine the CO2 emissions reported for 2004 in the LULUC Biodegradable Carbon Emissions and Sinks with black carbon emissions extrapolated from the CARB Criteria Air Pollutant Emissions inventory estimates. The dime discrepancy between the 2004 and 2015 is acknowledged as an irreconcilable source of uncertainty in this estimation among others. This does however reflect that a baseline of substantial emissions from forest management residuals has been reported in CARB emissions inventories and should be recognized as a baseline condition. We find that a rough estimate of CO2e emissions from pile burning annual approaches 1 Mt CO2e.

|    |   Mt CO2e | Source               |
|---:|----------:|:---------------------|
|  0 |  0.171152 | CO2 pile burning      |
|  1 |  0.651688 | CO2e BC pile burning |
|  2 |  0.82284  | Total Mt CO2e        |

BC emissions in terms of CO2e has not been included in any GHG emissions inventory published by CARB.

## Harvested wood products

The [Timber Products Output](http://srsfia2.fs.fed.us/php/tpo_2009/tpo_rpa_int1.php) provides estimates of logging residues produced from commercial roundwood harvest . This data is based on mill surveys and as such does not capture residual slash produced from management activities that do not produce commercial products.

#### Forest Service Activity Tracking System (FACTS)
Data from TPO does not account for forest management activities that do not result in commercial products (timber sales, biomass sales). The USFS [reports](http://data.fs.usda.gov/geodata/edw/datasets.php?dsetParent=Activities) Hazardous Fuels Treatment (HFT) activities as well as Timber Sales (TS) derived from the FACTS database. We use these two data sets to estimate the number of acres treated that did not produce commercial material (sawlogs or biomass) and where burning was not used. The first step is to eliminate all treatments in the HFT data set that included timber sales. We accomplish this by eliminating all rows in the HFT data set that have identical `FACTS_ID` fields in the TS dataset. We further filter the HFT dataset by removing any planned but not executed treatments (`nbr_units1 >0` below -- `nbr_units1` references `NBR_UNITS_ACCOMPLISHED` in the USFS dataset, see metadata for HFT [here](http://data.fs.usda.gov/geodata/edw/edw_resources/meta/S_USA.Activity_HazFuelTrt_PL.xml)), and use text matching in the 'ACTIVITY' and 'METHOD' fields to remove any rows that contain reference to 'burning' or 'fire'. Finally, we remove all rows that that reference 'Biomass' in the method category as it is assumed that this means material was removed for bioenergy.We use a range of 10-35 BDT/acre to convert acres reported in FACTS to volume. The following table presents descriptive statistics for estimates of residual unutilized wood biomass on an annual basis in million cubic feet.

|       |   nf_ncmr |    nf_lr |   opriv_lr |    fi_lr |   opub_lr |
|:------|----------:|---------:|-----------:|---------:|----------:|
| count |  11       |  4       |     4      |  4       |   4       |
| mean  |  12.0194  | 17.7     |    28.95   | 66.425   |   2.4     |
| std   |   4.68948 |  5.07346 |    16.1593 |  6.07639 |   1.79444 |
| min   |   2.37421 | 11.2     |    11.2    | 59.6     |   0.3     |
| 25%   |   8.92407 | 15.025   |    19.525  | 62.225   |   1.275   |
| 50%   |  13.3557  | 18.5     |    27.75   | 66.85    |   2.5     |
| 75%   |  14.5349  | 21.175   |    37.175  | 71.05    |   3.625   |
| max   |  17.8532  | 22.6     |    49.1    | 72.4     |   4.3     |

**TODO**
- [x] Public lands non-commercial management residuals 
- [ ] Private land non-commercial management residuals
- [x] Public lands logging residuals
- [x] Private lands logging residuals


<!-- ## Harvested Wood Products -->
<!-- Harvested wood products data comes from [McIver *et. al.* (2012)](https://docs.google.com/uc?id=0B9-9Vlx0SkkFMkhFZUN5X2djbms&export=download). The following tables have been created: -->

<!-- * **Harvest end-use by year** (MMBF Scribner) assumes that end use fractions presented in McIver (Figure 6) from 2012 apply historically. This assumtion is likely to underrepresent bioenergy, paper and engineered wood products and overemphasize mulch and soil as California's forest products industry has lost much of its secfondary processing capacity as well as its bioenergy infrastrucutre. [link to table](https://github.com/peteWT/fcat_biomass/blob/56770d7d2cd5a38b5f592a45cbcb74d133c7e53f/pd/hrv_by_enduse.csv) -->
<!-- * **Ten-year moving average harvest by by lanowner** (MMBF Scribner) Shows average of harvest and standard deviation for ten year moving windows by ownership category. [link to table](https://github.com/peteWT/fcat_biomass/blob/56770d7d2cd5a38b5f592a45cbcb74d133c7e53f/pd/tenyear_harv.csv) -->

## References
1. Ward DE, Hardy CC. Organic and elemental profiles for smoke from prescribed fires. In: Watson JG, editor. International specialty conference of the Air and Waste Management Association [Internet]. San Francisco: Air and Waste Management Association; 1989. Available from: (http://www.frames.gov/documents/smoke/serdp/ward_hardy_1989a.pdf)[http://www.frames.gov/documents/smoke/serdp/ward_hardy_1989a.pdf]
