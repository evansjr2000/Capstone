#!/bin/bash
ansible all -i $INVENTORY -b  -a "timedatectl set-timezone America/Chicago"

