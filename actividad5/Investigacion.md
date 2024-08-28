# ACTIVIDAD 5 - INVESTIGACION
## Tipos de Kernel y sus diferencias   
Los tipos de kernel se pueden clasificar principalmente en tres categorías:

1. <b>Kernel Monolítico:</b> Este tipo de kernel es grande y maneja todas las funciones del sistema operativo, incluyendo la gestión de memoria, procesos y controladores de hardware. Ejemplos de sistemas que utilizan un kernel monolítico son Linux y los sistemas operativos de tipo Unix.

2. <b>Microkernel:</b> A diferencia del kernel monolítico, el microkernel se centra en proporcionar solo las funciones más esenciales, delegando otras tareas a procesos de usuario. Esto permite una mayor modularidad y flexibilidad, aunque puede introducir una sobrecarga de comunicación entre los módulos.

3. <b>Kernel Híbrido:</b> Combina características de los kernels monolíticos y microkernels. Este tipo de kernel intenta mantener la eficiencia del kernel monolítico mientras permite la modularidad del microkernel. Windows NT es un ejemplo de un sistema operativo que utiliza un kernel híbrido 

## User vs Kernel Mode
El modo de usuario y el modo kernel son dos niveles de privilegio en los que puede operar un procesador:




|Modo de Usuario                                                                      | Modo kernel|
|-------------------------------------------------------------------------------------|------------|
|En este modo, las aplicaciones tienen acceso limitado a los recursos del sistema. Esto significa que no pueden interactuar directamente con el hardware o realizar operaciones críticas del sistema, lo que ayuda a proteger la estabilidad y seguridad del sistema operativo| Este es el modo privilegiado donde el sistema operativo y sus componentes pueden acceder a todos los recursos del hardware. Cuando una aplicación necesita realizar una operación que requiere más privilegios, como acceder a la memoria o a dispositivos de hardware, debe hacer una llamada al sistema, lo que provoca un cambio al modo kernel



## Interruptions vs traps
Las interrupciones y los traps son mecanismos que permiten al sistema operativo manejar eventos y errores:

|Interruptions                                                                    |Traps|
|-------------------------------------------------------------------------------------|------------|
|Son señales enviadas por hardware (como un teclado o un disco duro) al procesador para indicar que se necesita atención.  |  Son generadas por el propio software, generalmente como resultado de un error o una condición excepcional (como una división por cero). 
|Las interrupciones permiten que el sistema operativo responda a eventos externos de manera eficiente, interrumpiendo el flujo normal de ejecución para atender la solicitud|  Cuando ocurre un trap, el control se transfiere al sistema operativo para manejar la situación, permitiendo que el sistema responda a errores de manera controlada
