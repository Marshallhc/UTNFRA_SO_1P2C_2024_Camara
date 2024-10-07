#!/bin/bash

keloke=~/repogit/UTNFRA_SO_1P2C_2024_Camara/RTA_ARCHIVOS_Examen_20241002/filtro.txt

echo "Filtrando la información de la memoria RAM y creando un .txt"
grep MemTotal /proc/meminfo > "$keloke"

echo "Filtrando la información del chasis y agregándola al archivo .txt"
sudo dmidecode -t chassis | grep Manufacturer >> "$keloke"

echo "Tareas completadas. Archivo guardado en: $keloke"

