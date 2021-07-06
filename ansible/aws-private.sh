#!/bin/bash
aws  ec2 describe-instances | egrep -i -e 'ip|master|worker' | egrep -e 'PrivateIpAddress|worker|master' | egrep -B2 -e 'worker|master'
