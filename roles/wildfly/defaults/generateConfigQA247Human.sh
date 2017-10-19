#!/bin/bash
export temp_folder="./generated/qa/247/human"
echo $temp_folder
mkdir   $temp_folder -p
sed -f human_subst_qa_247.sed standalone.xml.template > $temp_folder/standalone.xml.temphuman
sed -f oracle_driver_subst.sed $temp_folder/standalone.xml.temphuman > $temp_folder/standalone.xml
