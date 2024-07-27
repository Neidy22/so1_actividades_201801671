#!/bin/bash 

#Obtner la fecha de ejecucion
EXECUTION_DATE=$(date +"%F-%H-%M-%S")

# leer nombre de usuario
GITHUB_USER="Neidy22"

# obtener info de la api de github
USER_INFO=$(curl -s "https://api.github.com/users/$GITHUB_USER")

github_user=$(echo $USER_INFO | jq -r '.name')
id=$(echo $USER_INFO | jq -r '.id')
created_at=$(echo $USER_INFO | jq -r '.created_at')


# Crear el archivo log
LOG_FILE_PATH="tmp/$EXECUTION_DATE/saludos.log"
mkdir -p tmp/$EXECUTION_DATE/
#touch $LOG_FILE_PATH

#Escribir el mensaje en el archivo saludos.log
msg="Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at"

echo $msg >> $LOG_FILE_PATH


