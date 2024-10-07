#!/bin/bash

usuarios=("p1c2_2024_A1" "p1c2_2024_A2" "p1c2_2024_A3" "p1c2_2024_P1")
grupos=("p1c2_2024_gAlumno" "p1c2_2024_gProfesores")
alumnos=("p1c2_2024_A1" "p1c2_2024_A2" "p1c2_2024_A3")
carpetas_alumnos=("/Examenes-UTN/alumno_1" "/Examenes-UTN/alumno_2" "/Examenes-UTN/alumno_3")
permisos=("750" "760" "700")

echo "Creando usuarios..."
for usuario in "${usuarios[@]}"; do
    sudo useradd "$usuario"
done

echo "Creando grupos..."
for grupo in "${grupos[@]}"; do
    sudo groupadd "$grupo"
done

echo "Modificando grupos de los usuarios..."
for alumno in "${alumnos[@]}"; do
    sudo usermod -aG p1c2_2024_gAlumno "$alumno"
done
sudo usermod -aG p1c2_2024_gProfesores p1c2_2024_P1

echo "Asignando claves..."
for usuario in "${usuarios[@]}"; do
    echo "$usuario:$usuario" | sudo chpasswd
done

echo "Ajustando permisos..."
for i in "${!carpetas_alumnos[@]}"; do
    sudo chmod -R "${permisos[$i]}" "${carpetas_alumnos[$i]}"
done

echo "Ajustando dueños..."
for i in "${!carpetas_alumnos[@]}"; do
    sudo chown -R "${alumnos[$i]}:${alumnos[$i]}" "${carpetas_alumnos[$i]}"
done
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

echo "Validando permisos y owners..."
for carpeta in "${carpetas_alumnos[@]}" /Examenes-UTN/profesores; do
    sudo ls -ld "$carpeta"
    sudo ls -l "$carpeta"
done

echo "Creando archivos de validación..."
for i in "${!carpetas_alumnos[@]}"; do
    sudo whoami > "${carpetas_alumnos[$i]}/validar$((i+1)).txt"
done
sudo whoami > /Examenes-UTN/profesores/validar4.txt

echo "Mostrando permisos de los archivos..."
for i in "${!carpetas_alumnos[@]}"; do
    sudo ls -l "${carpetas_alumnos[$i]}/validar$((i+1)).txt"
done
sudo ls -l /Examenes-UTN/profesores/validar4.txt

echo "Mostrando contenido de los archivos..."
for i in "${!carpetas_alumnos[@]}"; do
    sudo cat "${carpetas_alumnos[$i]}/validar$((i+1)).txt"
done
sudo cat /Examenes-UTN/profesores/validar4.txt

echo "Proceso finalizado."

