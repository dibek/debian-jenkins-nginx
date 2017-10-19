#!/bin/bash
export temp_folder="./generated/dev/classic/vet"
echo $temp_folder
mkdir   $temp_folder -p
sed -f vet_subst_dev.sed standalone.xml.template > $temp_folder/standalone.xml.tempvet
sed -f oracle_driver_subst.sed $temp_folder/standalone.xml.tempvet > $temp_folder/standalone.xml
