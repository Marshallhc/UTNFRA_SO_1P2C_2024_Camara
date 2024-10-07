#!/bin/bash

aprobame_Profe=~/Estructura_Asimetrica

echo "Creando estructura Asimétrica..."

mkdir -p "$aprobame_Profe"/{correo/{cartas_{1..100},carteros_{1..10}},clientes/cartas_{1..100}}

echo "Verificando la estructura creada..."

tree "$aprobame_Profe" --noreport | pr -T -s' ' -w 80 --column 4

echo "Estructura lograda con éxito."

