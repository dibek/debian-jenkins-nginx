#!/bin/bash
export temp_folder="./generated/dev/classic/human"
echo $temp_folder
mkdir   $temp_folder -p
sed -f human_subst_dev.sed standalone.xml.template > $temp_folder/standalone.xml.temphuman
sed -f oracle_driver_subst.sed $temp_folder/standalone.xml.temphuman > $temp_folder/standalone.xml
