# Detalles

    Objetivo: Familiarizar a los estudiantes con la administración de usuarios, grupos y permisos en un sistema operativo Linux.
    Requisitos previos: Tener instalado un sistema Linux y acceso al terminal.
    Envio: Enviar Link al folder actividad3 de su repositorio de GitHub

# Instrucciones

Crear un md file y resolver cada uno de los items solicitados a continuación. Debe de colocar el comando utilizado asi como el resultado si este fuera necesario. 

## Parte 1: Gestión de Usuarios

1. Creación de Usuarios: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.
```
sudo adduser usuario1 
sudo adduser usuario2 
sudo adduser usuario3 

```

2. Asignación de Contraseñas: Establece una nueva contraseñas para cada usuario creado.
```
└──╼  $sudo passwd usuario1
New password: 
Retype new password: 
passwd: password updated successfully

└──╼ $sudo passwd usuario2
New password: 
Retype new password: 
passwd: password updated successfully

└──╼ $sudo passwd usuario3
New password: 
Retype new password: 
passwd: password updated successfully

```

3. Información de Usuarios: Muestra la información de `usuario1` usando el comando `id`.

```
──╼ $id usuario1
uid=1001(usuario1) gid=1004(usuario1) groups=1004(usuario1)

```

4. Eliminación de Usuarios: Elimina `usuario3`, pero conserva su directorio principal.
```
└──╼ $sudo userdel usuario3

```

## Parte 2: Gestión de Grupos

1. Creación de Grupos: Crea dos grupos llamados `grupo1` y `grupo2`.

```
└──╼ $sudo groupadd grupo1
└──╼ $sudo groupadd grupo2

```

2. Agregar Usuarios a Grupos: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.

```
└──╼ $sudo usermod -a -G grupo1 usuario1
└──╼ $sudo usermod -a -G grupo2 usuario2

```

3. Verificar Membresía: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

```
└──╼ $cat /etc/group
usuario1:x:1004:
usuario2:x:1005:
grupo1:x:1006:usuario1
grupo2:x:1007:usuario2

```

4. Eliminar Grupo: Elimina `grupo2`.

```
└──╼ $sudo groupdel grupo2

```

## Parte 3: Gestión de Permisos

1. Creación de Archivos y Directorios:

    Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
    Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.
```
└──╼ $su - usuario1
Password: 

└──╼ $touch archivo1.txt

└──╼ $echo "Hola Usuario 1" > archivo1.txt



└──╼ $mkdir directorio1

└──╼ $touch directorio1/archivo2.txt


```



2. Verificar Permisos: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

```
└──╼ $ls -l
total 4
-rw-r--r-- 1 usuario1 usuario1 15 ago  4 22:23 archivo1.txt
drwxr-xr-x 1 usuario1 usuario1 28 ago  4 21:50 Desktop
drwxr-xr-x 1 usuario1 usuario1 24 ago  4 22:30 directorio1
drwxr-xr-x 1 usuario1 usuario1 22 ago  4 21:50 Templates

└──╼ $ls -ld
drwxr-xr-x 1 usuario1 usuario1 232 ago  4 22:29 .
```


3. Modificar Permisos usando `chmod` con Modo Numérico: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.
```
└──╼ $chmod 640 archivo1.txt

```


4. Modificar Permisos usando `chmod` con Modo Simbólico: Agrega permiso de ejecución al propietario del `archivo2.txt`.
```
└──╼ $chmod -rwx-r----- directorio1/archivo2.txt
```

5. Cambiar el Grupo Propietario: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

```
└──╼ $chown :grupo1 directorio1/archivo2.txt
```

6. Configurar Permisos de Directorio: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

```
└──╼ $chmod 740 directorio1
```

7. Comprobación de Acceso: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

```
└──╼ $cat usuario1/archivo1.txt
cat: usuario1/archivo1.txt: No such file or directory

└──╼ $cat usuario1/directorio1/archivo2.txt
cat: usuario1/directorio1/archivo2.txt: No such file or directory

```

8. Verificación Final: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.
```


└──╼ $ls -l
total 4
-rw-r----- 1 usuario1 usuario1 15 ago  4 22:23 archivo1.txt
drwxr-xr-x 1 usuario1 usuario1 28 ago  4 21:50 Desktop
drwxr----- 1 usuario1 grupo1   24 ago  4 22:30 directorio1
drwxr-xr-x 1 usuario1 usuario1 22 ago  4 21:50 Templates

└──╼ $ls -ld-vivo
drwxr-xr-x 1 usuario1 usuario1 232 ago  4 22:29 .



```


## Reflexión: (Opcional)

Contestar las siguientes preguntas:

    ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo? Para garantizar un menor manejo de los recursos y cumplir con los procesos de autenticacion de usuarios y su nivel de autorizacion dentro del sistema.

    ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux? 