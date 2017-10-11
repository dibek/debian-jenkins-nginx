#!/bin/bash
export temp_folder="./generated/qa247"
echo $temp_folder
mkdir   $temp_folder -p
sed -f vet_subst_qa_247.sed standalone.xml.template > $temp_folder/standalone.xml.tempvet
sed -f human_subst_qa_247.sed $temp_folder/standalone.xml.tempvet > $temp_folder/standalone.xml.temphuman
sed -f oracle_driver_subst.sed $temp_folder/standalone.xml.temphuman > $temp_folder/standalone.xml
