import itertools as it

own = ['private', 'state', 'tribal', 'blm', 'nationalforest']
bd = {'products':
      {'lumber': 0.43,
       'landscaping': 0.16,
       'energy': 0.34,
       'p&p': 0.07,
       'waste': 0.001},
      'ownership': ['private',
                    'state',
                    'tribal',
                    'blm',
                    'nationalforest']}

fnc = '{0}*{1} as {2}'
qry = 'select {0} from umt harvest;'
args = 
for o in bd['ownership']:
    
