#!/usr/bin/python

import math
import time
import random
from subprocess import call

n = 0
seconds = 60*5;

while 1:
	n+=1;
	wait = random.expovariate(1.0/seconds);
	call(["/home/pgadey/bin/tag.sh"]);
	print "Event " + str(n) + " will happen after " + str(wait) + " seconds.";
	time.sleep(wait);
