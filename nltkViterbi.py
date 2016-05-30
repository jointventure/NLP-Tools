

import nltk

grammar = nltk.parse_pcfg("""
  S		->  NP VP		 [.80] 
  S		->	EN VP		 [.20]
  NP	->  Det N		 [.30]
  NP    ->  Det A N		 [.70]
  VP	->  V NP		 [.20] 
  VP    ->  V			 [.80]
  V		->  'includes'	 [.05]
  V		->	'say'		 [.95] 
  Det	->  'the'		 [.40] 
  Det	->  'a' 		 [.40]
  Det   ->  'an'         [.20]
  N		->	'meal'		 [.01]
  N		->	'flight'	 [.02]
  N     ->  'bus'        [.97]
  EN    ->  'Hans'		 [1.0]
  A		->  'blue'       [1.0]
""")


viterbi_parser = nltk.ViterbiParser(grammar)
x = viterbi_parser.parse(['the','flight','includes','a','meal'])

print x

from nltk.draw.tree import draw_trees
draw_trees(x)





