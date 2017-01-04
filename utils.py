from sqlalchemy import create_engine as ce
import pandas as pd
import sqlite3
import os
import numpy as np
from pint import UnitRegistry as UR

gUrl = 'https://docs.google.com/spreadsheets/d/{0}/export?gid={1}&format=csv'

dbname = 'fcat'
engine = ce('postgresql:///{0}'.format(dbname), echo=True)


def gData(key, gid, hrow=0, indx=None):
    if not indx:
        data = pd.read_csv(gUrl.format(key, gid), header=hrow)
    else:
        data = pd.read_csv(gUrl.format(key, gid), header=hrow, index_col=indx)
    data.columns = [i.replace(' ', '').lower() for i in data.columns]
    return data


def sqlitedb(dbname):
    fName = dbname+'.sqlite'
    conn = sqlite3.connect(fName)
    curs = conn.cursor()
    return {'fname': fName,
            'cx': conn,
            'crs': curs}


def csv2sqlite(dbcon, csvfile, ex='replace'):
    df = pd.read_csv(csvfile)
    fn = os.path.basename(os.path.splitext(csvfile)[0])
    df.to_sql(fn, dbcon, if_exists=ex)


def distFromRange(total, maxr=32, minr=2):
    av = (maxr + minr)/2
    stdev = (float(maxr) - float(minr))/4
    d_frac = (total - np.floor(total)) * \
        np.random.normal(av, stdev, 1).clip(min=0)[0]
    t_bdt = np.random.normal(av, stdev, np.floor(total)).clip(min=0)
    return np.append(t_bdt, d_frac)


def sumFromDist(total, maxr=0.32, minr=0.02):
    av = (maxr + minr)/2
    stdev = (float(maxr) - float(minr))/4
    d_frac = (total - np.floor(total)) * \
        np.random.normal(av, stdev, 1).clip(min=0)[0]
    t_bdt = np.sum(np.random.normal(av, stdev, np.floor(total)).clip(min=0))
    return (d_frac+t_bdt)


def co2eDecomp(biomass):
    '''
    estimates ghg emissions from decomposition of biomass in un-burned piles
    '''
    cFraction = 0.5
    cMethane = 0.09
    cCO2 = 0.61
    cT = cFraction*biomass
    ch4co2e = cT * cMethane * 56
    return ch4co2e + (cCO2 * cT)


def pm2bcgwpPiles(pm, gwp=3200):
    '''converts a PM 2.5 estimate produced
    from pile burns to an estimate of black carbon.
    returns tons BC and CO2e
    '''
    pctFlaming = 0.9
    pctSmolder = 0.5
    tcFest = 0.082
#   tcFcv = 0.09
    tcSest = 0.560
#   tcScv = 0.01
    ecFest = 0.082
#   ecFcv = 0.45
    ecSest = 0.029
#   ecScv = 0.49

    pmSm = pm*pctSmolder
    pmF = pm*pctFlaming
    tcS = tcSest * pmSm
    tcF = tcFest * pmF
    tc = tcS + tcF
    ecS = ecSest*tcS
    ecF = ecFest*tcF
    ec = ecS + ecF


def ward2db():
    """
    pulls Table 2 from Ward 1989 transposed for sql easieness
    """
    ward = gData('13UQtRfNBSJ81PXxbYSnB2LrjHePNcvhJhrsxRBjHpoY', 1488869919)
    ward.to_sql('ward89_2',sqlitedb('fcat_biomass')['cx'],if_exists = 'replace')
    
def pm2bcPiles(pm, est='estimate', gwp=3200):
    db = sqlitedb('fcat_biomass')
    # Step 1: Detetermine the S:F ratio for piled fuels
    # From Ward 1989 table V (Regional Composite for Piled Slash)
    fRatio = 0.9
    sRatio = 1-fRatio

    # Step 2: Calculate PM from S and F
    pmF = pm * fRatio
    pmS = pm * sRatio

    # Step 3: Determine PM:BC ratio for flaming and smoldering.
    # Based on Ward 1989 Table 2 this requires knowing the PM:TC (Total Carbon) ratio.
    fTCQuery = "select avg(tc)/100 tc, avg(tc_coefv) from ward89_2 where combustion = 'f' and profile in ('tractor','crane');"
    fTC,fTCcv=db['crs'].execute(fTCQuery).fetchall()[0]
    sTCQuery = "select avg(tc)/100 tc, avg(tc_coefv) from ward89_2 where combustion = 's' and profile in ('tractor','crane');"
    sTC,sTCcv=db['crs'].execute(sTCQuery).fetchall()[0]

    #Then the TC:BC ratios for smoldering and flaming
    fBCQuery = "select avg(tc)/100 tc, avg(tc_coefv) from ward89_2 where combustion = 'f' and profile in ('tractor','crane');"
    fBC,fBCcv=db['crs'].execute(fBCQuery).fetchall()[0]
    sBCQuery = "select avg(tc)/100 tc, avg(tc_coefv) from ward89_2 where combustion = 's' and profile in ('tractor','crane');"
    sBC,sBCcv=db['crs'].execute(sBCQuery).fetchall()[0]

    #Estimate for Black Carbon from flaming phase
    tcFest = pmF * fTC
    bcFest = tcFest * fBC
    #High stimate for Black Carbon from flaming phase
    tcFhigh = tcFest + (fTCcv * tcFest)
    bcFhigh = tcFhigh * fBC + ((tcFhigh * fBC)*fBCcv)

    #Low stimate for Black Carbon from flaming phase
    tcFlow = tcFest - (fTCcv * tcFest)
    bcFlow = tcFlow * fBC - ((tcFlow * fBC)*fBCcv)
    
    #Estimate for Black Carbon from smoldering phase
    tcSest = pmS * sTC
    bcSest = tcSest * sBC

    #High stimate for Black Carbon from smoldering phase
    tcShigh = tcSest + (sTCcv * tcSest)
    bcShigh = tcShigh * sBC + ((tcShigh * sBC)*sBCcv)
    #Estimate for Black Carbon from smoldering phase
    bcSest = pmS * sTC * sBC

    #Low stimate for Black Carbon from smoldering phase
    tcSlow = tcSest - (sTCcv * tcSest)
    bcSlow = tcSlow * sBC - ((tcSlow * sBC)*sBCcv)


    results = {'estimate': (bcFest + bcSest) * gwp,
               'high': (bcFhigh + bcShigh) *gwp,
               'low': (bcFlow +bcSlow) * gwp
               }

    return results[est]
