from sqlalchemy import create_engine as ce
import pandas as pd

gUrl = 'https://docs.google.com/spreadsheets/d/{0}/export?gid={1}&format=csv'

dbname = 'fcat'
engine = ce('postgresql:///{0}'.format(dbname), echo=True)

def gData(key, gid, hrow = 0):
    data = pd.read_csv(gUrl.format(key,gid), header = hrow)
    data.columns = [i.replace(' ','').lower() for i in data.columns]
    return data

