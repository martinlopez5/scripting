#!/bin/bash

tr '[:lower:]' '[:upper:]' < letras > letras_mayusculas
tr '[:upper:]' '[:lower:]' < letras > letras_minusculas