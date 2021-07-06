#!/bin/bash
aws  ec2 describe-instances | egrep -i -e 'ip|master|worker' | egrep -e 'PublicIpAddress|worker|master'
