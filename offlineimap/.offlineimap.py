#!/usr/bin/python2
from subprocess import check_output


def get_pass(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[0]
