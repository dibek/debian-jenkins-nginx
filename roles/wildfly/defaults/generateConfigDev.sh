#!/bin/bash
sed -f vet_subst_dev.sed standalone.xml.template > standalone.xml.tempvetdev
sed -f human_subst_dev.sed standalone.xml.tempvetdev > standalone.xml.temphumandev
sed -f oracle_driver_subst.sed standalone.xml.temphumandev > standalone-dev.xml
