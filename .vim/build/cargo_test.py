#!/usr/bin/python

from __future__ import print_function
import re
import sys
import subprocess

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

pipes = subprocess.Popen("cargo test -- --nocapture", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
std_out, std_err = pipes.communicate()

#print(std_err)
#print(std_out)

re_err = re.compile("^error:\s(?P<Message>.+)\n\s+-->\s(?P<File>.*)", re.MULTILINE)
errors = [m.groupdict() for m in re_err.finditer(std_err, re.MULTILINE)]
for error in errors:
    eprint('Error: {} {}'.format(error['File'], error['Message']))

re_war = re.compile("^warning:\s(?P<Message>.+)\n\s+-->\s(?P<File>.*)", re.MULTILINE)
warnings = [m.groupdict() for m in re_war.finditer(std_err, re.MULTILINE)]
for warning in warnings:
    eprint('Warning: {} {}'.format(warning['File'], warning['Message']))
