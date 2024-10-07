#!/bin/bash

echo "Creando estructura Asimétrica"

mkdir -p ~/Estructura_Asimetrica/{correo/{cartas_{1..100},carteros_{1..10}},clientes/cartas_{1..100}}

echo "Verificando la estructura creada"

tree ~/Estructura_Asimetrica/

echo "Estructura lograda con éxito"

