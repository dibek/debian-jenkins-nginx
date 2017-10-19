#!/bin/bash
export temp_folder="./generated/qa/classic/human"
echo $temp_folder
mkdir   $temp_folder -p
sed -f human_subst_qa.sed standalone.xml.template > $temp_folder/standalone.xml.temphuman
sed -f oracle_driver_subst.sed $temp_folder/standalone.xml.temphuman > $temp_folder/standalone.xml
