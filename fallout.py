#!/usr/bin/python
# helps hack terminals in Fallout 3 and 4
# copyright 2015, Styopa Semenukha, GPL v3+
from __future__ import print_function
import sys

def hamming(op1, op2):
    i = 0
    for c1, c2 in zip(op1, op2):
        if c1 == c2:
            i += 1
    return i

if len(sys.argv) < 2:
    print("Too few arguments: %i" % (len(sys.argv) - 1), file = sys.stderr)
    print("USAGE: %s PASSWORD PASSWORD..." % sys.argv[0])
    exit(1)
