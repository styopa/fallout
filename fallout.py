#!/usr/bin/python
# helps hack terminals in Fallout 3 and 4
# copyright 2015, Styopa Semenukha, GPL v3+
from __future__ import print_function
import sys, re

def hamming(op1, op2):
    i = 0
    for c1, c2 in zip(op1, op2):
        if c1 == c2:
            i += 1
    return i

passwords = map(lambda p: p.lower(), sys.argv[1:])

if len(passwords) < 1:
    print("Too few arguments: %i" % len(passwords), file = sys.stderr)
    print("USAGE: %s PASSWORD PASSWORD..." % sys.argv[0])
    exit(1)

len_first = len(passwords[0])
for password in passwords:
    if len(password) != len_first:
        print("Passwords are of different length: '%s' and '%s'"
                % (passwords[0], password), file = sys.stderr)
        exit(2)

for each in passwords[:]:
    line = raw_input("Enter password and number of correct letters\n> ")
    (entered, correct) = tuple(re.split('\W+', line))
    entered = entered.lower()
    correct = int(correct)
    if (entered not in passwords):
        print("%s is not in the list of possible passwords" % entered, file = sys.stderr)
        exit(3)
    passwords.remove(entered)
    for password in passwords:
        if hamming(password, entered) != correct:
            passwords.remove(password)

    num = len(passwords)
    if num > 1:
        print("Possible passwords: " + ' '.join(passwords))
    elif num == 1:
        print("The password is: " + passwords[0])
        exit(0)
    else:
        print("No more passwords left", file = sys.stderr)
        exit(4)
