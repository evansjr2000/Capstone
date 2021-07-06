#!/bin/bash
ansible all -i $INVENTORY -a "date"
