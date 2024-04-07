#!/bin/bash

BKP_IFS=$IFS
IFS="-"
parametros_ingresados="$*"

echo "Los parametros ingresados, fueron los siguientes: $*"

IFS=$BKP_IFS