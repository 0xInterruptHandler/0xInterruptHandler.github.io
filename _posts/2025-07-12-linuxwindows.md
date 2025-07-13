---
title: Comparativa de Comandos Windows vs Unix/Linux
date: '2025-07-13 00:24:16'
comments: true
categories: [Pentesting]
tags: [cybersec]
---


#  Comparativa de Comandos: Windows vs Unix/Linux

| Comando en Windows             | Comando en Unix/Linux      | Notas                                                                                                                                   |
| ------------------------------ | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `arp`                          | `arp`                      | Igual en ambos sistemas.                                                                                                                |
| `assign`                       | `ln`                       | Crea un enlace (link) de archivo.                                                                                                       |
| `assign`                       | `ln -s`                    | En Unix, los directorios no pueden tener múltiples enlaces duros, así que se utilizan enlaces simbólicos con `ln -s`.                   |
| `assoc`                        | `file`                     | Muestra información sobre el tipo de archivo.                                                                                           |
| `at`                           | `at`, `batch`, `cron`      | Planifica tareas. Ver también `schtasks`.                                                                                               |
| `attrib`                       | `chown`, `chmod`           | Cambia permisos y propietario de archivos o directorios.                                                                                |
| `cd`                           | `cd`                       | En Unix, `cd` sin argumentos te lleva al directorio home. En Windows solo muestra el directorio actual.                                 |
| `cd`                           | `pwd`                      | `pwd` imprime el directorio actual en Unix.                                                                                             |
| `chkdsk`                       | `fsck`                     | Verifica y repara el sistema de archivos.                                                                                               |
| `cls`                          | `clear`, `Ctrl+L`          | Limpia la pantalla del terminal.                                                                                                        |
| `copy`                         | `cp`                       | Copia archivos.                                                                                                                         |
| `date` / `time`                | `date`                     | En Unix, `date` muestra fecha y hora. En Windows, `date` y `time` son comandos separados y piden nuevos valores.                        |
| `del`                          | `rm`                       | Elimina archivos.                                                                                                                       |
| `deltree`                      | `rm -r`                    | Elimina directorios y su contenido recursivamente.                                                                                      |
| `dir`                          | `ls`                       | En algunos Unix, `dir` también funciona.                                                                                                |
| `doskey /history` o tecla `F7` | `history`                  | Muestra el historial de comandos. En Unix es parte del shell (ej. Bash).                                                                |
| `edit`                         | `vi`, `emacs`, etc.        | En Unix se usa el editor configurado en la variable de entorno `EDITOR`.                                                                |
| `exit`                         | `exit`, `Ctrl+D`           | `Ctrl+D` también cierra la sesión del shell.                                                                                            |
| `explorer`                     | `nautilus`, `thunar`, etc. | Abre el explorador de archivos gráfico.                                                                                                 |
| `fc`                           | `diff`                     | Compara archivos.                                                                                                                       |
| `find`                         | `grep`                     | Busca texto dentro de archivos.                                                                                                         |
| `ftp`                          | `ftp`                      | Cliente FTP en ambos sistemas.                                                                                                          |
| `help`                         | `man`                      | `man` muestra el manual de un comando.                                                                                                  |
| `hostname`                     | `hostname`                 | Muestra o establece el nombre del host.                                                                                                 |
| `ipconfig /all`                | `ifconfig -a`              | Muestra configuración de red.                                                                                                           |
| `mem`                          | `top`                      | Muestra uso de memoria y estado del sistema.                                                                                            |
| `mkdir`                        | `mkdir`                    | Crea directorios.                                                                                                                       |
| `more`                         | `more`, `less`             | Muestra contenido de archivos página por página.                                                                                        |
| `move`                         | `mv`                       | Mueve o renombra archivos.                                                                                                              |
| `net session`                  | `who`, `w`                 | Muestra usuarios conectados.                                                                                                            |
| `net statistics`               | `uptime`                   | Muestra el tiempo que ha estado encendido el sistema.                                                                                   |
| `nslookup`                     | `nslookup`                 | Consulta servidores DNS.                                                                                                                |
| `ping`                         | `ping`                     | Igual en ambos sistemas.                                                                                                                |
| `print`                        | `lpr`                      | Envía archivos a la impresora.                                                                                                          |
| `shutdown -r`                  | `shutdown -r`              | Reinicia el sistema.                                                                                                                    |
| `regedit`                      | `editar /etc/*`            | En Unix, los archivos de configuración están en `/etc` o `/usr/local/etc`. Se editan con editores de texto, no con interfaces gráficas. |
| `rmdir`                        | `rmdir`                    | Elimina directorios vacíos.                                                                                                             |
| `rmdir /s`                     | `rm -r`                    | Elimina directorios con contenido. Usa `rm -i` para confirmar cada eliminación.                                                         |
| `schtasks`                     | `at`, `cron`               | Programación de tareas.                                                                                                                 |
| `set`                          | `env`                      | Muestra variables de entorno. Para una variable específica: `echo $VARIABLE`.                                                           |
| `set Path`                     | `echo $PATH`               | Muestra el valor de una variable específica.                                                                                            |
| `shutdown`                     | `shutdown`                 | Con `-h` apaga, `-r` reinicia.                                                                                                          |
| `shutdown -s`                  | `shutdown -h`              | Opción `-f` en Windows fuerza el cierre de aplicaciones.                                                                                |
| `sort`                         | `sort`                     | Ordena contenido.                                                                                                                       |
| `start`                        | `&`                        | En Unix, `comando &` lanza el proceso en segundo plano. En Windows se usa `start comando`.                                              |
| `systeminfo`                   | `uname -a`                 | Muestra información del sistema.                                                                                                        |
| `tasklist`                     | `ps`                       | Lista procesos en ejecución.                                                                                                            |
| `title`                        | —                          | Cambiar el título del terminal en Unix requiere configuración adicional (ver "change title xterm").                                     |
| `tracert`                      | `traceroute`               | Rastrea rutas de red.                                                                                                                   |
| `tree`                         | `find`, `ls -R`            | Muestra la estructura de directorios.                                                                                                   |
| `type`                         | `cat`                      | Muestra el contenido de archivos.                                                                                                       |
| `ver`                          | `uname -a`                 | Muestra versión del sistema.                                                                                                            |
| `xcopy`                        | `cp -R`                    | Copia directorios de forma recursiva.                                                                                                   |

