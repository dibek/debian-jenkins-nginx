#!/bin/bash
sed -f vet_subst.sed standalone.xml.template > standalone.xml.tempvet
sed -f human_subst.sed standalone.xml.tempvet > standalone.xml.temphuman
sed -f oracle_driver_subst.sed standalone.xml.temphuman > standalone.xml
