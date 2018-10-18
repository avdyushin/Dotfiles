#!/usr/bin/python

from __future__ import print_function
import re
import sys
import subprocess

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

pipes = subprocess.Popen("cargo test -- --nocapture", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
std_out, std_err = pipes.communicate()

# Print original output
print(std_err)
print(std_out)

# Write to stderr only processed errors and warnings
re_err = re.compile("^error(\[.*\])?:\s(?P<Message>.+)\n\s+-->\s(?P<File>.*)", re.MULTILINE)
errors = [m.groupdict() for m in re_err.finditer(std_err)]
quickfix_log = []
for error in errors:
    msg = 'Error: {} {}'.format(error['File'], error['Message'])
    if msg not in quickfix_log:
        quickfix_log.append(msg)

re_war = re.compile("^warning(\[.*\])?:\s(?P<Message>.+)\n\s+-->\s(?P<File>.*)", re.MULTILINE)
warnings = [m.groupdict() for m in re_war.finditer(std_err)]
for warning in warnings:
    msg = 'Warning: {} {}'.format(warning['File'], warning['Message'])
    if msg not in quickfix_log:
        quickfix_log.append(msg)

for msg in quickfix_log:
    eprint(msg)
