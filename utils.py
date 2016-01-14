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
    return ec * gwp

