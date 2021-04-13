#!/bin/bash
echo "Nombre de la maquina: $(hostname) 
    IP: $(hostname -I) 
    Fecha: $(date +"%T") 
    Memoria libre: ($ram)"
