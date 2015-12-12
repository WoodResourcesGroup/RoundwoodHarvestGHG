from sqlalchemy import create_engine as ce
import pandas as pd
import sqlite3

gUrl = 'https://docs.google.com/spreadsheets/d/{0}/export?gid={1}&format=csv'

dbname = 'fcat'
engine = ce('postgresql:///{0}'.format(dbname), echo=True)


def gData(key, gid, hrow=0):
    data = pd.read_csv(gUrl.format(key, gid), header=hrow)
    data.columns = [i.replace(' ', '').lower() for i in data.columns]
    return data


def sqlitedb(dbname):
    fName = dbname+'.sqlite'
    conn = sqlite3.connect(fName)
    curs = conn.cursor()
    return {'fname': fName,
            'cx': conn,
            'crs': curs}
