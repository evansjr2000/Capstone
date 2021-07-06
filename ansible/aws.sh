#!/bin/bash
aws  ec2 describe-instances | egrep -i -e ip
