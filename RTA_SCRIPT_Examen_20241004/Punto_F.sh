#!/bin/bash

opa=~/repogit/UTNFRA_SO_1P2C_2024_Camara/RTA_ARCHIVOS_Examen_20241002/filtro_copado.txt

echo "Creando el archivo avanzado con los datos de IP, usuario, etc:"

{
    echo "Mi IP Pública es: $(curl -s ifconfig.me)"
    echo "Mi usuario es: $(whoami)"
    echo "El Hash de mi usuario es: $(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')"
} > "$opa"

cat "$opa"

git remote get-url origin

