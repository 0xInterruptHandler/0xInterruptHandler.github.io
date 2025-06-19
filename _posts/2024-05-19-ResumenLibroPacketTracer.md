---
title: Resumen Libro Jesin A - Packet Tracer Network Simulator-PACKT (2014)
date: '2023-06-15 11:17:32'
comments: true
categories: [Networking]
tags:  [packet-tracer, cisco, redes, guía]
---


### Cosas para principiantes

- **Packet Tracer** muestra la parte trasera de un router cuando lo abres. En esta área es donde se conectan los cables, los módulos, la corriente y el interruptor de encendido. Algunos routers tienen pocos puertos en el lado frontal (aunque esto no es común).
    
- La parte delantera del router tiene luces indicadoras y generalmente está cubierta por una carcasa de metal o plástico.
    
- Los **módulos de red** (hardware) se instalan en los **slots**, que son las ranuras donde se conectan los componentes.
    
    - Un **módulo** es un componente de hardware que proporciona varias interfaces de dispositivos. Por ejemplo, el módulo `HWICK-4ESW` tiene 4 puertos Ethernet a 10 Mbps.
- Al hacer clic sobre un módulo, aparece una descripción detallada en la parte inferior de la ventana.
    
- Los routers siempre incluyen puertos de entrada **incorporados** (integrados), y los slots permiten agregar más puertos o módulos adicionales.
    
- **Etiquetas comunes de los cables**:
    
    - **Color amarillo**: Ethernet
    - **Color negro**: Auxiliar
    - **Color celeste**: Consola
    - **Símbolo de USB**: USB
- Los **routers y switches** están clasificados por **series**, y cada serie tiene subseries específicas.
    
- Los routers y switches **Cisco** se nombran de la siguiente manera: **Router/Switch + Cisco + Número de versión**.
    
- Los routers y switches Cisco pueden variar no solo por la versión, sino también por características adicionales, como la versión del **IOS**.
    
- Las versiones más comunes de routers Cisco comienzan con **2900** o **2600**, aunque algunos modelos empiezan en **1800** o **1900**.
    
    - **Packet Tracer** incluye routers y switches genéricos con el sufijo **-PT**, que son compatibles con el IOS de Cisco.
- **Diferenciar entre RJ45 y RJ11** es fundamental. (RJ = Jack Registrado).
    

---

### Siglas comunes

- **WIC**: **WAN Interface Card**
- **HWIC**: **High-Speed WAN Interface Card**
- **ISR**: **Integrated Service Router**
- **SFP**: **Small Form Factor Pluggable**
- **NM**: **Network Modules**

---

### Tipos de módulos en un router

- **WIC-Cover**: Es una pieza metálica que cubre el **slot** de un router.
 


# 2do Capitulo  

## 2.1 Router - Enrutador
- proprciona conectividad entre 2 redes logicas
PUNTOS CLAVE EN PACKET TRACER
- no puedes retirar un modulo del su slot si el equipo se encuentra encendido
- si no se guarda la "running configuration" (configuracion en ejecucion) entonces el apagado y encendido del dispositivo, hara que esta se pierda

## 2.2Switches - Conmutadores

- conecta mas de 2 dispositivos finales juntos
PUNTOS CLAVE 
- cada puerto de un switch es un "Collision Domain" 
- Es comun que un switch cuente con mas puertos Ethernet. Suelen contar con pocos puertos GigabitEthernet
	- Gigabit Ethernet : icono naranja
	- Ethernet : icono amarillo
- Existen switches de capa 3 es decir que actuan como router y como switch

## 2.3 Otros dispositivos
- Hubs  : no adecuados 
- Repeaters : repiten la senial 
- Coaxial Splitters : Divisores de conectores coaxiales

## 2.4 Convenciones de nombres

### 2.4.1 Cooper Ethernet Interface (Interfaz de ethernet de cobre)
- es una interfaz LAN NORMAL que utiliza un conector RJ45 "crimpeado" en un cable de cobre.
- Las interfaces ethernet de cobre son llamadas y clasificadas 
	- Clasificacion segun la velocidad:
		- ETHERNET `(10MBps)`
		- FAST ETHERNET `(100 MBps)`
		- GIGABIT ETHERNET `(1000 MBps)`
- los nombres de los modulos que cuentan incorporado una interfaz ethernet de cobre siguen esta convencion. 
	- (NOMBRE) +NUMERO+ E/FE/CE/CFE/CGE  o... (SW)
ejemplos:

```
HWIC-4ESW (four Ethernet switching ports)
WIC-1ENET (single Ethernet port)
NM-1E (single Ethernet port)
NM-1FE-TX (single Fast Ethernet port)
NM-4E (four Ethernet ports)
NM-ESW-161 (16 Ethernet switching ports)

PT-ROUTER-NM-1CE, PT-ROUTER-NM-1CFE, PT-ROUTER-NM-1CGE
(Packet Tracer custom modules)
```

### 2.4.2 Fiber Ethernet Interface (Interfaz de ethernet de FIBRA)
- similar a lo anterior, pero usan un cable de fibra. 
- identificados con la letra `F`
- ejemplos:

```
NM-1FE-FX (single Fast Ethernet fiber media)

PT-ROUTER-NM-1FFE, PT-ROUTER-NM-1FGE 
(PacketTracer custom modules)
```


### 2.4.3 Serial Interface 
- identificados con la letra `T` o `A/S`
	- `T` = SYNCHRONOUS
	- `A/S` = Asynchronous
	- (esta diferencia solo afecta en entornos de produccion y no en un simulador como packet tracer)
- Ejemplos

```
WIC-1T, WIC-2T (a single or dual synchronous serial port)
(un solo puerto serial sincrono)

NM-4A/S, NM-8A/S 
(four or eightasynchronous/synchronous serial ports)
(4 puertos seriales asincronos)

PT-ROUTER-NM-1S, PT-ROUTER-NM-1SS
(PacketTracer custom modules)
```

IMAGEN DE WIC-2T:
- Tiene 2 puertos seriales SINCRONOS
![Image](/assets/img/posts/networkin_images_book_ciscoPK/wic-2t-10102492-003_1280x1280.jpg)

IMAGEN DE NM-8A/S :
- tiene 8 puertos seriales ASINCRONOS
![Image](/assets/img/posts/networkin_images_book_ciscoPK/61ePSzESaML.jpg)


### 2.4.4 Modem interface (Interfaz de modem)
- los modulos con esta interfaz tienen puertos RJ11 para ser usados con telefonos de cable analogo
- al seleccionar el modulo aparece "LINE" debajo del conector. como ejercicio trata de ver la diferencia que hay entre el conector de RJ11 y RJ45 desde la vista de packet tracer usando un router o un CLOUD-PT
- identificados con las letras : `AM`

```
WIC-1AM (dual RJ11 ports for phone and modem)
WIC-2AM, WIC-8AM (two or eight RJ11 ports)

PT-ROUTER-NM-1AM
(PacketTracer custom modules)
```

###  2.4.5  Covers
- terminan en `-Cover`
ejemplos:

```
NM-Cover: Covers a network module slot
WIC-Cover: Covers a WIC slot
```


## 2.5 Emulando WAN
- Packet tracer emula esto en la subcategoria "WAN Emulation" donde aparece el icono de nube o un DSL(Digital Suscriber Line)
- CLOUD-PT : aparece con el icono de nube, pero al hacerle doble click se ve como un router con muchos slots. descripcion corta de cada slot:

```
NM1AM: Tiene un modulo RJ11 para conectar modems usando cables telefonicos. 


nm1ce, NM1CFE, NM1CGE:Todos estos son de tipo ethernet y son usados para conectar los modem 


```

![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624152850.png)

- NM-1FFE, NM-1FGE: proporcionan tipos de ethernet para conectar fibra
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624152915.png)

- Coaxial
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624153013.png)

- Puerto serial
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624153029.png)
 
- DSL-MODEM-PT : es un MODEN con 2 interfaces (RJ11 y RJ45)
- CABLE-MODEM-PT : similar al DSL-MODEM, pero en vez de RJ11, cuenta con un COAXIAL. (COAXIAL y RJ45)


## 2.6 Accediendo a la CLI

MINI LABORATORIO DE EJEMPLO:
elementos:
1. ROUTER  : 2621XM
2. PC
	1. Interfaz RS 232 (D sub 9 ) : tiene 9 pines (no confundir con el vga que utiliza el puerto RGB VGA -> RGB)  y (  conector D sub 9 -> RS232  )
3. cable : Consola
Conexion:
1. Computadora -> Router 
	1. Computadora : RS232
	2. Router : Consola 

![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624164518.png)
Luego si vas a Desktop -> Terminal (valores por defecto) -> OK. tendras acceso por consola al Router 2621MX
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624164641.png)
### Configurando dispositivos de red con la GUI

Click en el router > Config
se divide en :
- Global
- Routing (enrutamiento)
- Interface

CONFIGURACION ROUTER:
- Global  (la misma clasificacion para router y switch : settings y algorithm settings)
- Routing : (esta es la parte diferente a la del switch) : Puede ser enrutamiento estatico y  (DINAMICO) RIP
	- solo debes darle los valores en el caso de static 
```
Network: 192.168.30.0
Mask: 255.255.255.0
Next Hop: 10.0.0.6
```
y para RIP solo la ip de la red.
- Interface : todos los puertos o interfaces que tiene el dispostivo
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624164741.png)
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624164945.png)

Haz lo mismo para un SWITCH:
CONFIGURACION ROUTER:
-  Global  (la misma clasificacion para router y switch : settings y algorithm settings) permite hacer lo siguiente
	- Settings
		- cambiar el nombre que se muestra
		- cambiar el nombre de HOST
		- borrar o guardar  la NVRAM
		- guardar (exportar ) el archivo de configuracion EN TXT 
		- cargar (load) un archivo de configuracion EN TXT
	- Algorithm settings : destinada a usuarios avanzados que quieran configurar minuciosamente el dispositivo del emulador con el fin de ver como reacciona ante ciertas cituaciones o escenarios
- Switch : Configuracion de la BASE DE DATOS VLAN
- INTERFACE : todos los puertos o interfaces con las que cuenta el dispositivo
![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624164908.png)

![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624164922.png)

# 3er Capitulo : Dispositivos genericos

## Desktops and laptops
RESUMEN PERSONAL DE MODULOS DE ESTOS DISPOSITIVOS
- WIRELESS :  diferencias
	- Linksys-WMP300N : 2.4GHz
	- PT-HOST-NM-1W : 2.4GHz
	- PT-HOST-NM-1W-A : 5GHz
- Conexiones telefonicas RJ11:
	- PT-HOST-NM-1AM 
- Los headphones, microphone, camera, hard drives : son solo de adorno y no tienen ninguna funcionalidad

![Image](/assets/img/posts/networkin_images_book_ciscoPK/Pasted image 20240624171259.png)

## Servers : Servidores

 




