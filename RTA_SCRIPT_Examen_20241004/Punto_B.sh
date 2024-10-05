#!/bin/bash

DISCO_TP="/dev/sdc"
PART_SIZE="+10M"
UUIDS=("634a5b1f-83d5-423a-98d6-2536a9453144"
       "861b2621-f0e9-49dd-b7c4-95cea5bdbf4e"
       "602da879-083a-44b8-947f-a01c5f61efc5"
       "b41098a3-d656-4b30-b5ed-490070ce7be2"
       "a52958bb-0c10-48fa-8f3b-507bc27f3a8b"
       "daf85740-5c0d-46c3-964e-e66143cfc9cb"
       "60f54807-7714-406d-83fe-60910dfc3828"
       "45c2a066-8eac-4bff-83f7-2583cb8e9452"
       "da7f422f-879c-4a2b-a5e7-c6228d2c912c")
MOUNT_POINTS=("/Examenes-UTN/alumno_1/parcial_1"
              "/Examenes-UTN/alumno_1/parcial_2"
              "/Examenes-UTN/alumno_1/parcial_3"
              "/Examenes-UTN/alumno_2/parcial_2"
              "/Examenes-UTN/alumno_2/parcial_3"
              "/Examenes-UTN/alumno_3/parcial_1"
              "/Examenes-UTN/alumno_3/parcial_2"
              "/Examenes-UTN/alumno_3/parcial_3"
              "/Examenes-UTN/profesores")

echo "Script haciendo magia..."

# Crear 3 particiones primarias y 1 extendida con 7 particiones lógicas
sudo fdisk $DISCO_TP << EOF
n
p
1

$PART_SIZE
n
p
2

$PART_SIZE
n
p
3

$PART_SIZE
n
e
4


n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
n
l

$PART_SIZE
w
EOF

echo
echo "Mostrar particionamientos"
sudo fdisk $DISCO_TP -l

echo
echo "Formateando las particiones"

# Formateo de las particiones primarias
sudo mkfs.ext4 ${DISCO_TP}1
sudo mkfs.ext4 ${DISCO_TP}2
sudo mkfs.ext4 ${DISCO_TP}3

# Formateo de las particiones lógicas (5 a 11)
sudo mkfs.ext4 ${DISCO_TP}5
sudo mkfs.ext4 ${DISCO_TP}6
sudo mkfs.ext4 ${DISCO_TP}7
sudo mkfs.ext4 ${DISCO_TP}8
sudo mkfs.ext4 ${DISCO_TP}9
sudo mkfs.ext4 ${DISCO_TP}10
sudo mkfs.ext4 ${DISCO_TP}11

echo
echo "Montando de forma PERSISTENTE"

# Montajes persistentes usando los UUIDs y los puntos de montaje correspondientes
echo "UUID=${UUIDS[0]}  ${MOUNT_POINTS[0]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[1]}  ${MOUNT_POINTS[1]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[2]}  ${MOUNT_POINTS[2]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[3]}  ${MOUNT_POINTS[3]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[4]}  ${MOUNT_POINTS[4]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[5]}  ${MOUNT_POINTS[5]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[6]}  ${MOUNT_POINTS[6]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[7]}  ${MOUNT_POINTS[7]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab
echo "UUID=${UUIDS[8]}  ${MOUNT_POINTS[8]}  ext4  defaults  0  2" | sudo tee -a /etc/fstab

echo
echo "Mostrar montajes"
lsblk -f $DISCO_TP

echo
echo "Fin del script del punto B"

