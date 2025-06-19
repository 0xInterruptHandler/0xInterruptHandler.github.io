---
title: Enrutamiento dinamico vs estatico
date: '2023-06-15 11:17:32'
comments: true
categories: [Networking]
tags: [redes, routing, networking]
---

# **Resumen sobre Enrutamiento Estático**

El **enrutamiento estático** implica que el administrador de red configure manualmente las rutas que los paquetes deben seguir para llegar a su destino. Este tipo de enrutamiento permite un control preciso sobre las rutas, evitando la sobrecarga de tráfico que se puede generar con protocolos de enrutamiento dinámico.

### Tipos de rutas estáticas:

1. **Rutas Estáticas por Defecto**:  
   Se utilizan cuando un router no conoce una ruta hacia un destino específico. La ruta por defecto, o *default route*, se configura para enviar todos los paquetes cuyo destino no está en la tabla de enrutamiento a una puerta de enlace de último recurso (gateway). Esta ruta se representa con una **"S*"** en la tabla de enrutamiento. Ejemplo:
   ```bash
   Router_B(config)# ip route 0.0.0.0 0.0.0.0 Serial0
   ```

2. **Rutas Estáticas Flotantes**:  
   Son rutas estáticas configuradas con una distancia administrativa (DA) más alta que la de las rutas dinámicas, de modo que sirven como respaldo en caso de que la ruta dinámica principal falle. El router seleccionará siempre la ruta con la menor distancia administrativa, utilizando la ruta estática flotante solo cuando la ruta dinámica esté inalcanzable.

3. **Rutas Locales**:  
   En las versiones más recientes de Cisco, las **rutas locales** se identifican con la letra "L" en la tabla de enrutamiento. Estas rutas corresponden a las direcciones IP asignadas a las interfaces del router (rutas de host). Por ejemplo, una dirección como `10.1.1.1/32` sería una ruta local, que indica una IP específica asignada a una interfaz del router.  
   - **IPv4**: Las rutas de host tienen la máscara `/32`.
   - **IPv6**: Las rutas de host tienen la máscara `/128`.

### Ejemplos de visualización en la tabla de enrutamiento:

1. **Ruta Estática**:  
   En la tabla de enrutamiento, una ruta estática aparece con una **"S"**:
   ```bash
   S 198.10.1.0/24 [1/0] via 161.44.192.2
   ```

2. **Ruta Estática por Defecto**:  
   Aparece con **"S*"**:
   ```bash
   S* 198.10.1.0/24 [1/0] via 161.44.192.2
   ```

3. **Rutas Locales**:  
   Las rutas locales se identifican con una **"L"**:
   ```bash
   L 10.1.1.1/32 is directly connected, Ethernet0/0
   ```

En resumen, el enrutamiento estático es útil cuando se necesita un control preciso y no se requiere la adaptabilidad de un protocolo dinámico. Sin embargo, es importante recordar que las rutas estáticas deben actualizarse manualmente si cambian las condiciones de la red.


# Enrutamiento dinamico

**Resumen sobre Enrutamiento Dinámico**

El **enrutamiento dinámico** se utiliza cuando los cambios en la red hacen inviable el uso de rutas estáticas, ya que estas requerirían una reconfiguración manual cada vez que ocurra un cambio. A través de protocolos de enrutamiento, los routers pueden aprender y actualizar sus tablas de enrutamiento automáticamente para adaptarse a los cambios en la red, sin necesidad de intervención del administrador.

### Protocolo Enrutado vs. Protocolo de Enrutamiento

- **Protocolo Enrutado**: Define el formato y la estructura de los datos para su transmisión a través de la red (por ejemplo, TCP/IP, IPX, AppleTalk).
- **Protocolo de Enrutamiento**: Utilizado por los routers para **intercambiar información** sobre rutas y mantener sus tablas de enrutamiento actualizadas, permitiendo elegir la mejor ruta hacia un destino.

### Tipos de Protocolos de Enrutamiento

1. **Protocolos de Gateway Interior (IGP)**:  
   Se utilizan para intercambiar información de enrutamiento dentro de un mismo sistema autónomo (AS). Ejemplos: **RIP**, **EIGRP**, **OSPF**.

2. **Protocolos de Gateway Exterior (EGP)**:  
   Se usan para intercambiar información de enrutamiento entre sistemas autónomos, como en el caso de **BGP**.

### Clases de Protocolos de Enrutamiento

1. **Vector Distancia**:  
   Estos protocolos determinan la distancia y dirección a una red, enviando periódicamente actualizaciones entre routers. Ejemplos: **RIP** e **IGRP**.  
   - **RIP**: Utiliza el número de saltos como métrica y tiene dos versiones, **RIP v1** (classful) y **RIP v2** (classless).
   - **IGRP**: Desarrollado por Cisco, es un protocolo classful diseñado para redes grandes.

2. **Estado de Enlace**:  
   Los protocolos de estado de enlace tienen un conocimiento más detallado de la topología de la red y solo actualizan cuando ocurre un cambio real. Ejemplo: **OSPF**.

3. **Híbridos**:  
   Protocolos como **EIGRP** combinan aspectos de ambos, de vector distancia y estado de enlace.

### Enrutamiento Classfull vs. Classless

- **Classfull**: No manejan máscaras de subred (por ejemplo, RIP v1, IGRP).
- **Classless**: Pueden manejar máscaras de subred (por ejemplo, RIP v2, OSPF).

 En un sistema classless, los routers pueden usar máscaras de subred para mejorar la eficiencia del enrutamiento. Un administrador puede habilitar el comando `ip classless` para permitir que los paquetes dirigidos a subredes desconocidas sean enviados a la ruta predeterminada.

### Sistema Autónomo (AS)

Un **sistema autónomo** es un conjunto de redes bajo una administración común. Los protocolos de enrutamiento exterior (EGP), como **BGP**, se utilizan para intercambiar información entre diferentes sistemas autónomos.

---

### Enrutamiento Vector Distancia

Los protocolos **vector distancia** (como **RIP** e **IGRP**) utilizan la **métrica de ruta** (que generalmente se mide en número de saltos) para determinar la mejor ruta hacia un destino. Los routers envían actualizaciones periódicas con información sobre sus rutas a otros routers, lo que permite que todos los routers de la red tengan conocimiento de la topología.

### Bucle de Enrutamiento

Los **bucles de enrutamiento** ocurren cuando los routers continúan enviando información errónea de una red caída. Para evitarlo, los protocolos vector distancia implementan varias técnicas:

1. **Horizonte Dividido (Split Horizon)**:  
   Impide que un router reenvíe información sobre una ruta por la misma interfaz por la que la recibió.

2. **Métrica Máxima**:  
   Se utiliza para evitar que un bucle continúe más allá de un límite específico. En RIP, por ejemplo, la métrica máxima es 16 saltos, y cualquier ruta que exceda esa cantidad es considerada inalcanzable.

3. **Envenenamiento de Rutas (Route Poisoning)**:  
   Un router marca una ruta como inalcanzable (por ejemplo, asignando una métrica de 16 en RIP) para evitar que otros routers sigan utilizando una ruta caída.

4. **Temporizadores de Espera**:  
   Los routers usan temporizadores para esperar un período antes de aplicar cambios en las rutas, lo que ayuda a evitar fluctuaciones y mantener la estabilidad de la red.

### Resumen de Características de Protocolos de Enrutamiento

- **Protocolos de Vector Distancia**: Como **RIP** e **IGRP**, utilizan el número de saltos para determinar las mejores rutas.
- **Protocolos de Estado de Enlace**: Como **OSPF**, tienen un conocimiento más detallado de la topología y reaccionan solo cuando ocurren cambios.
- **Técnicas para evitar bucles**: Incluyen **horizonte dividido**, **métrica máxima** y **envenenamiento de rutas**.

### Conclusión

El enrutamiento dinámico permite a los routers adaptarse automáticamente a los cambios de la red, evitando la necesidad de configuraciones manuales constantes. Aunque los protocolos como RIP e IGRP son más sencillos, los protocolos como OSPF y EIGRP ofrecen una mayor eficiencia y flexibilidad, lo que los hace más adecuados para redes grandes y complejas.

