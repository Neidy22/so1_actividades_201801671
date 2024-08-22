# ACTIVIDAD 4 - System Unit
## Proceso de instalacion del servicio 
1. Crear el archivo de unidad para el servicio, /etc/systemd/system/actividad4.service
    ```
        [Unit]
        Description=Servicio de actividad 4

        [Service]
        ExecStart=actividad4/script.sh
        Restart=always

        [Install]
        wantedBy=multi-user.target
    ```
2. Instalar el servicio
    ```
        sudo systemctl daemon-reload               
        sudo systemctl enable actividad4.service
        sudo systemctl start actividad4.service
    ```

3. Visualizar logs en tiempo real
    ```
        journalctl -u actividad4.service -f
    ```