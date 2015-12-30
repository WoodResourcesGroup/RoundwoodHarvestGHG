<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Climate impacts of woody biomass fates: Current practices and opportunities](#climate-impacts-of-woody-biomass-fates-current-practices-and-opportunities)
    - [Estimating CO2 equivalent emissions from forest biomass burning](#estimating-co2-equivalent-emissions-from-forest-biomass-burning)
    - [Harvested wood products](#harvested-wood-products)
        - [Forest Service Activity Tracking System (FACTS)](#forest-service-activity-tracking-system-facts)
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

![process](https://www.lucidchart.com/publicSegments/view/0199fdbb-bc60-4ec7-854c-a4ce2a3c4e66/image.png)

Emissions from forest biomass burning are published in the most current [statewide emissions inventory](http://www.arb.ca.gov/ei/ei.htm) maintained by the California Air Resources Board. The Criteria Air Pollutant (CPE) emissions inventory and the Greenhouse Gas (GHG) emissions inventory are both necessary sources for establishing aggregate annual climate-forcing emissions. The GHG inventory captures gasses with radiative forcing properties but does not capture elemental carbon or black carbon (BC) emissions which have strong radiative forcing properties. While the [Short Lived Climate Pollutant Strategy](https://docs.google.com/uc?id=0B9-9Vlx0SkkFWmxxQ2xtSkNxSlU&export=download) recognizes the importance of forest biomass management it does not publish an emission estimate fro BC.

 The California Air Resources Board has published [criteria air pollutant emissions estimates for 2015](http://www.arb.ca.gov/ei/emissiondata.htm). Particulate matter as reported in the criteria air pollutant emissions inventory contains black carbon which is a strong short lived climate pollutant.

|    |   gwp_20 |   gwp_20_std |   gwp_100 |   gwp_100_std |   gwp_500 |   gwp_500_std | source                          |
|---:|---------:|-------------:|----------:|--------------:|----------:|--------------:|:--------------------------------|
|  0 |     2200 |       888.82 |    633.33 |        255.41 |    193.33 |         77.67 | Fuglestvedt2000                 |
|  1 |     3200 |       nan    |    900    |        nan    |    nan    |        nan    | CaliforniaAirResourcesBoard2015 |
[Global warming potential estimates for black carbon from biomass burning]

CARB reports emissions from PM 2.5 in tons/day. Black Carbon emissions can be estimated from PM 2.5 emissions if the ratio of smoldering to flaming combustion is known. Ward et. al. (1989) provide estimates of the ratio of smoldering to flaming combustion for a hand/machine piled burns, prescribed natural fire and wildfire. Black Carbon is a fraction of the Total Carbon (TC) component of PM 2.5. Thus BC is related to PM 2.5 by the equation:

BC = (PM2.5 * F * TCf* BCf) + (PM2.5 * S * TCs* BCs)

Where:

* BC = Black Carbon 

* PM2.5 = PM2.5 mass units

* F = Percent of combustion in flaming phase

* TCf = Total Carbon fraction of PM 2.5 for flaming phase

* BCf = Black Carbon fraction of Total Carbon for flaming phase

* S = Percent of combustion in smoldering phase

* TCs = Total Carbon fraction of PM 2.5 for smoldering phase

* BCs = Black Carbon fraction of Total Carbon for smoldering phase

Based on [Ward and Hardy](https://docs.google.com/uc?id=0B9-9Vlx0SkkFaU1ITkFjQnBXUEk&export=download) and [Jenkins et. al., 1996](https://docs.google.com/uc?id=0B9-9Vlx0SkkFN1dQVjFkOXI1eVE&export=download), the following ratios are used here:

| Source                  |   BC/t PM (F, est.) |   TC/t PM (F, CV) |   BC/t TC (F, CV) |   BC/t PM (S, est.) |   TC/t PM (S, CV) |   BC/t TC (S, CV) |
|:------------------------|------------------------:|----------------------:|------------------:|------------------------:|----------------------:|------------------:|
| piles                   |               0.046904  |                0.09   |            0.45   |               0.01624   |                  0.01 |             0.49  |
| prescribed natural fire |               0.0801631 |                0.0733 |            0.5833 |               0.020944  |                  0.08 |             0.29  |
| wildfire                |               0.0587012 |                0.0867 |            0.4467 |               0.0228641 |                  0.06 |             0.338 |

To arrive at a rough estimate of BC emissions based on PM2.5 the following steps are taken

1. Determine the amount of PM2.5 produced in the flaming and smoldering phases of combustion for each type (piles, wildland fire use, wildfire). Ratios from Ward and Hardy (1989, Table 5) are used.
2. Define 1000 probability distributions for the percent of PM2.5 comprised of carbonaceous material (TC) and percent of TC comprised of black carbon (BC) give estimates and coefficient of variation estimates provided by Ward and Hardy (1989, tables 2 and 3)
3. Estimate annual BC emissions based on probability distributions defines in 2.

The following plot represents estimates of total BC emissions resulting from combustion of biomass in the CARB CPE emissions categories reflecting woody biomass combustion in wildfire, pile burning and prescribed natural fire.

![BC GHG](/graphics/bc_prob_gwp.png?raw=true)


In addition the [CARB's 1994 greenhouse gas emissions inventory](http://www.arb.ca.gov/cc/inventory/archive/tables/net_co2_flux_2007-11-19.pdf) estimates emissions from wildfire and slash burning through 2004. 

|    | Source Category            |   MMTCO2 |
|---:|:---------------------------|---------:|
|  0 | Forest and rangeland fires | 2.0194   |
|  1 | Timber harvest slash       | 0.155267 |

To arrive at an estimate of total annual emissions from burning forest management residuals in CO2 equivalent terms from published CARB estimates we can combine the CO2 emissions reported for 2004 in the LULUC Biodegradable Carbon Emissions and Sinks with black carbon emissions extrapolated from the CARB Criteria Air Pollutant Emissions inventory estimates. The dime discrepancy between the 2004 and 2015 is acknowledged as an irreconcilable source of uncertainty in this estimation among others. This does however reflect that a baseline of substantial emissions from forest management residuals has been reported in CARB emissions inventories and should be recognized as a baseline condition. We find that a rough estimate of CO2e emissions from pile burning annual approaches 1 Mt CO2e.

|    |   Mt CO2e | Source               |
|---:|----------:|:---------------------|
|  0 |  0.17     | CO2 pile burning      |
|  1 |  0.99     | CO2e BC pile burning |
|  2 |  1.16     | Total Mt CO2e        |

BC emissions in terms of CO2e has not been included in any GHG emissions inventory published by CARB.

## Harvested wood products

The [Timber Products Output](http://srsfia2.fs.fed.us/php/tpo_2009/tpo_rpa_int1.php) provides estimates of logging residues produced from commercial roundwood harvest . This data is based on mill surveys and as such does not capture residual slash produced from management activities that do not produce commercial products.

### Forest Service Activity Tracking System (FACTS)
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



## References
1. Ward DE, Hardy CC. Organic and elemental profiles for smoke from prescribed fires. In: Watson JG, editor. International specialty conference of the Air and Waste Management Association [Internet]. San Francisco: Air and Waste Management Association; 1989. Available from: [https://docs.google.com/uc?id=0B9-9Vlx0SkkFaU1ITkFjQnBXUEk&export=download](https://docs.google.com/uc?id=0B9-9Vlx0SkkFaU1ITkFjQnBXUEk&export=download)
2. Jenkins BM, Turn SQ, Williams RB, Goronea M, Abd-el-Fattah H, Mehlschau J, et al. Atmospheric Pollutant Emissions Factors From Open Burning of Agricultural and Forest Biomass By Wind Tunnel Simulations [Internet]. Sacramento, CA; 1996. Available [here](https://docs.google.com/uc?id=0B9-9Vlx0SkkFN1dQVjFkOXI1eVE&export=download) 
