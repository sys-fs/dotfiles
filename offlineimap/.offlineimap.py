#!/usr/bin/python2
from subprocess import check_output


def get_work_pass():
    return check_output('gpg -dq ~/.work-pass.gpg', shell=True).strip('\n')
