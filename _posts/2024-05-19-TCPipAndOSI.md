---
title:  TCP-IP Model y OSI
date: '2024-06-15 11:17:32'
comments: true
categories: [Networking]
tags:  [tcpIp, osi, redes, protocolos]
---

MindMap:

- https://github.com/0xInterruptHandler/0xInterruptHandler.github.io/blob/main/assets%2Fimg%2Fposts%2FNetworkingConcepts.svg


Conocimiento previo:
1. ISO : organizacion de estandarizacion, no se limita a redes o computadoras. ha desarrollado mas de 18,500 estandares inteernacionales
2. Layers = representan funciones logicas que son parte del proceso de comunicacion entre 2 entidades, usualmente computadoras
3. Interface = una manera de intercambiar informacion
4. Compresion : elimina los datos redundantes, una vez enviado lo no redundante, se envia lo redundante y agrega
5. Numero de puertos (Repaso) : hay puertos fisicos y de software, estos son de software
	1. bien conocidos (0,1023)
	2. registrados por fabricantes de software (1024-49,151)
	3. puertos dinamios (49,152 - 65,535) : usados de forma aleatoria por la computadora
6. Tipos de transmision:
	1. Unicast, 
	2. Broadcast(Todos)
	3. Multicast/one-to-some(Una parte)
7. ID logico = IP
8. ID fisico = MAC
9. Red local = misma red
10. Red remota = distinta red
11. Ethernet 802.3 = Ethernet es al tecnologia de red mas famosa que opera en la capa 1 y 2 del modelo OSI y 802.3 es el estandar de como funciona Ethernet

----

El primer reto que se tuvo en las redes fue la falta de estandarizaciones entre los fabricantes de hardware y software, habian muchas implementaciones distintas, por lo que habian protocolos de red incompatibles y sistemas para identificacion de computadoras en una red. Por ello, en ese tiempo se crearon 2 modelos de referencia, que evolucionaron diferente, pero establecieron un campo base para la interoperabilidad :  
1. OSI (Open system interconection) : creada por la ISO (Organization for Standarization) (7 capas) : no estaba asociado a un metodo de transporte en la capa de transporte especifico
2. TCP IP : creada por DoD (The Department Of Defense) en 1970 (4 capas) : aqui se introducen los 2 protocolos que operan en la capa de transport (TCP y UDP)

CONTEXTO DE COMO SE FUE ADOPTANDO:
la organizacion de estandares internacionales (ISO) definio estandares, las cuales son naturalmente voluntarias, lo que sucedio en esos tiempos fue que no todos siguieron estandares hasta que la mayoria adopto uno, algunos fabricantes vieron un beneficio en los estandares y crearon los suyos, algunos fabricantes influyeron mas que otros, en especial las grandes industrias, por ejemplo Cisco.

ENTENDIENDO LOS BENEFICIOS DE LOS MODELOS DE REFERENCIA :
- dan un plano en el cual los desarrolladores de software y hardware pueden trabajar
- promueve la estandariacion
- enfoque modular mediante romper el proceso de comunicacion en partes o modulos
- previene que la modificacion de una capa, afecte a otra capa
- Estandarizar las interfaces entre las capas





---


- 5 Layer TCP/IP Model is generally regarded as more relevant than the 7 Layer OSI Model
- Layer 4 PDU (protocol date unit) = segments; Layer 4 uses ports
- Layer 3 PDU = packets; Layer 3 uses IP addresses
- Layer 2 PDU = frames; Layer 2 uses MAC addresses
- Layer 1 uses bits
---
# OSI Model
- Enumerada desde la perspectiva de recepcion de paquetes y no de la creacion, entonces Layer 1 corresponde a la capa fisica, hasta llegar a la Layer 7 (Aplicacion)
- del 1 al 7 : perspectiva de recepcion
- del 7 al 1 : perspectiva de creacion
Nota:
1. Todo lo mencionado en capa Aplicacion,Presentacion,Sesion corresponden a una sola Capa (Aplicacion) en el modelo TCP/IP.
2. Todas las capas infreiores hacen uso de la informacion recibida de la capa superior adyacente ignorandolos detalles de las demas capas superiores
3. Los (Headers) son piezas de informacion de la capa superior (lo primero que recibe)
4. Los Trailers son la informacion de "Atras" y son recibidas despues de que se haya recibido el header

## Layer 7 - Application
- Layer closest to the end user
- Interacts with software apps, like web browsers
- Protocolos de esta capa : DNS, SMTP, FTP
	- HTTP is a Layer 7 protocol
		- Identifying communication partners
		- Synchronizing communication
- los datos transmitidos, en el caso de HTTP, corresponderia ser HTML,PDF,SpreadSheet, pero en este contexto se le llama data o datos de forma generica
## Layer 6 - Presentation

- Responsable de la manera en como los datos se presentan en la capa de aplicacion del dispositivo destino, que pueda ser leido y entenido. Ex: se encarga de  traduccion de formatos si es necesario(como en la encriptacion o compresion)
- Data is in "application format"
	- Needs to be translated to a different format to be sent over the network
- The **Presentation Layer's job** is to translate between application and network formats
	- Ex. Encryption/Decryption occurs on Layer 6
ENCRIPTACION - DONDE SE DA? : se pueden dar en 2 capas
- capa de presentacion : solo los datos son encriptados
- capa de  enlace de datos : todo el paquete es encriptado
## Layer 5 - Session


- Controls dialogue/sessions between communicating hosts
- las acciones se dan entre la aplicacion local y la aplicacion remota (destino) 
- Establishes, manages, and terminates connections between the local application and the remote application. (but this doesn't mean managing sessions of computers, just from their apps)
	- Ex. The connection between the web browser and foreign site
- Considera la informacion recibida sin sus detalles como datos en si.
- Para lograr su funcionamiento, lo hace mediante agregar informacion adelante (Header) de la informacion recibida de la capa de aplicacion y presentacion (las capas de arriba)
- Ex : En el ejemplo de la pagina web, la capa de sesion se encargaria de manejar lasesion entre navegador de la computadora origen y de la computadora de destino
## Layer 4 - Transport
- responsable deidentificar la aplicacion de la computadora destino. Lograndolo mediante los numeros de puertos
- TCP/UDP : introducidos en el modelo TCP/IP  y no en el OSI
- entonces los numeros de puerto vienen de 2 tipos : TCP Y UDP
- y la decision de numero de puerto segun el tipo se da mediante el tipo de transmision:
	- TCP : UNICAST
	- UDP : Broadcast y Multicast
- Informacion que agrega como Header : Numero de puerto. Ex:23 -> Telnet
- Segments and reassembles data for communication between end hosts
- Breaks large pieces of data into smaller segments which can be more easily sent over the network and are less likely to cause transmission problems if errors occur
- Provides host-to-host communication
- Layer 4 Header

## Layer 3 - Network
- Responsable de identificar al dispositivo destino mediante su ID logico (IP)
- Informacion que agrega como Header : la IP
- Provides connectivity between end hosts on different networks (outside of the LAN)
- IP addressing
- Routers operate on Layer 3 porque necesitan conocer el ID logico para enrutarlo hacia la direccion correcta
- Layer 3 Header
## Layer 2 - Data Link
- responsable de convertir un identificador logico (IP) a un identificador fisico (MAC) haciendo uso del protocolo ARP
- Provides note-to-node connectivity and data transfer (ex. PC to switch, switch to router, etc.)
- MAC addresses
- Defines how data is formatted for transmission over a physical medium (ex. copper UTP cables)
- **Detects and possibly corrects Physical Layer errors**
- Switches operate at Layer 2
- Layer 2 Header & Trailer
	- Header : MAC
	- Trailer : informacion que el dispositivo destino usara para realizar una revision llamada Cyclic Redundancy Check (CRC) que comprueba la integridad

## Layer 1 - Physical
- Defines physical characteristics of the medium used to transfer data between devices
	- Ex. Voltage levels, maximum transmission distances, physical connectors, cable specifications
- Digital bits are converted into electrical (for wired connections) or radio (for wireless connections) signals
- Cables, pin layouts, etc.
Formas en que se representan los datos de forma fisica:
1. Wired Network : presencia y ausencia de carga electrica
2. Wireless : ondas de radio
3. Fibra optica : patrones de luz on lasers chicos
 

## PDUs
- Layer 5-7 = Data
- Layer 4 = Segment
- Layer 3 = Packet
- Layer 2 = Frame
- Layer 1 = Bit

## Ejemplo: 


### 1
Asi creara el paquete el web server : 
- Capa 7 : obtiene los datos del formulario
- Capa 6 : le da formato
- Capa 5 : agrega informacion necesaria para crear la sesion entre el server y el navegador
- Capa 4 : elige el transporte, punto a punto (unicast) entonces usa TCP y asigna el numero de puerto (80)
- Capa 3 : agrega la IP de origen y destino
- Capa 2 : agrega la MAC de origen y destino
- Capa 1 :  envia todo el paquete como bits

### 2
Asi creara el paquete el cliente : 
- Capa 1 : recibe los bits y les da formato para la capa 2
- Capa 2 : comprueba el campo MAC y verifica si es suyo, si lo es, entonces lo elimina y entrega a la siguiente capa
- Capa 3 : comprueba el campo IP y verifica si es suyo, si lo es, entonces lo elimina y entrega a la siguiente capa
- Capa 4 : comprueba el campo de puerto y la notifica al navegador que hay datos entrantes, elimina la parte del puerto y lo entrega
- Capa 5 : usa la informacion entregada en esta capa por el web server para establecer la conexion, luego la borra y continua
- Capa 6 : realiza traducciones de formato que sean requeridas
- Capa 7 : recibe el documento HTML y lo abre en laventana del navegador



# TCP/IP Suite
- Session/Presentation/Application (Layers 5-7) = Application (Layer 4)
- Transport (Layer 4) = Transport (Layer 3)
- Network (Layer 3) = Internet (Layer 2)
- Physical/Data Link (Layers 1-2) = Link (Layer 1)
 
 * OSI Model and TCP-IP Model:

 

* Layers of the OSI (Open Systems Interconnection) model:

  * Application layer - PoC for all network-aware apps
  * Presentation layer - converts data from session layer and sends it to application layer; offers encryption services
  * Session layer  : Crea y mantiene sesiones
  * Transport layer - uses segments as data unit, and adds header to segments for encapsulation; can use reliable (TCP) or unreliable (UDP) communication - also adds source port numbers
  * Network layer - uses packets as data unit; responsible for IP addressing and finding best path
  * Data link layer - uses frames as data unit; responsible for MAC addressing and error checking
  * Physical layer - uses bits as data unit; actual data transfer and hardware connections

* Simplified working of OSI model:
 
Suppose we send an email to someone; this email would first pass through application layer towards presentation layer - this will compress the data.

The session layer is responsible for communication and encryption. Then, the data is divided into segments in transport layer - this layer also adds a transport header to the data.

Now, the segments are sent to the network layer, which adds a header of its own to the segments, thus creating packets.

These packets are forwarded to data link layer, which adds a data link header to it, where it would be called a frame now.

Finally, this frame is converted into bits (0s and 1s) in the physical layer.

Once the physical layer sends these bits to the recipient physical layer, the receiving layers strip the headers of the corresponding layers until it gets all the segments, which is then taken care of by the upper layers.
## Clase 18 - Diferencias entre modelos TCP/IP y OSI💻

 

### Modelo TCP/IP

- Creado primero
- Más compacto
- Combina capas
- No está tan bien planeado
- Puede representar algunas redes computacionales
- También está basado en el modelo cliente/servidor.

### Modelo OSI

- Creado después
- Mejor segmentado
- Bien planeado
- Mejor para aprender sobre redes (Buena guía)
- Puede representar una gran variedad de redes computacionales.
- Es un modelo conceptual

No hay uno mejor que otro, hay que entender las capacidades de ambos y saber utilizarlos según el caso de uso.




