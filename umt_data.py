import utils as ut

key = '1A7fdPckZg_XMEZRtOGQrC8_vwEYNFnTdBZ2_gjbHFxw'
sheets = {'fig2data':
          {'gid': 642454746,
           'title':'''Figure 2--California's timber
           harvest by ownership class, 1947-2012.''',
           'hrow': 4}}


def fig2():
    d = ut.gData(key,
                 sheets['fig2data']['gid'],
                 hrow = sheets['fig2data']['hrow'])
    d.drop([u'nf%', u'private%', u'unnamed:8', u'unnamed:9', u'unnamed:10'], 1, inplace=True)
    return d

data = fig2()
data.to_sql('umt_harvest',
            ut.engine,
            if_exists='replace')
