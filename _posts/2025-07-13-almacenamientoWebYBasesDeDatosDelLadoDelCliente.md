---
title: Almacenamiento Web y Bases de Datos del Lado del Cliente
date: '2025-07-13 10:17:35'
comments: true
categories: [Programming, Web Development, Software Engineering]
tags: [arquitectura, desarrollo-web, web, web-development, desarrollo]
---

 

## Almacenamiento Web y Bases de Datos del Lado del Cliente

El navegador proporciona distintos mecanismos para almacenar datos localmente en el dispositivo del usuario. Estas herramientas son útiles para mejorar la experiencia del usuario, permitir el funcionamiento sin conexión y evitar solicitudes innecesarias al servidor.

---

### Almacenamiento en Sesión y Almacenamiento Local

**Session Storage** y **Local Storage** son mecanismos de almacenamiento clave-valor accesibles mediante JavaScript, limitados al mismo origen (protocolo, dominio y puerto).

* **Session Storage**: almacena datos de forma temporal. Su contenido se elimina cuando se cierra la pestaña o ventana del navegador.
* **Local Storage**: permite guardar datos de forma persistente. La información permanece incluso después de cerrar y volver a abrir el navegador.

Ambos están disponibles gracias a HTML5 y admiten alrededor de 5 MB de capacidad por origen. El acceso a estos datos es sincrónico y exclusivo del cliente.

---

### Cookies

Las **cookies** son pequeños archivos (máximo \~4 kB) que se almacenan en el navegador y se envían automáticamente al servidor con cada solicitud HTTP correspondiente al mismo dominio. Su uso más común incluye:

* Autenticación de usuarios
* Almacenamiento de preferencias
* Seguimiento de sesiones

A diferencia del Web Storage, las cookies se utilizan tanto en el cliente como en el servidor y están limitadas en tamaño y número.

---

### IndexedDB

**IndexedDB** es una base de datos NoSQL orientada a objetos, disponible en el navegador, que permite almacenar grandes volúmenes de datos estructurados. A diferencia de Local Storage, es asincrónica, más potente y adecuada para aplicaciones complejas.

Características clave:

* Permite crear múltiples almacenes de objetos (object stores)
* Soporta claves primarias e índices secundarios
* Funciona mediante operaciones asincrónicas
* Ideal para almacenamiento offline, sincronización y caching avanzado

IndexedDB es especialmente útil en aplicaciones progresivas (PWAs) o complejas que requieren acceso estructurado y eficiente a datos.

---

### CacheStorage

**CacheStorage** es un sistema de almacenamiento diseñado específicamente para guardar respuestas de red (request-response pairs). Es utilizado por los service workers para permitir que las aplicaciones funcionen sin conexión.

Requiere HTTPS y puede almacenar varios cientos de megabytes, dependiendo del navegador.

#### Ejemplo básico de uso:

```js
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open("mi-cache").then(async cache => {
      await cache.addAll([
        '/css/bootstrap.css',
        '/css/main.css',
        '/js/bootstrap.min.js',
        '/js/jquery.min.js',
        '/offline.html'
      ]);

      await cache.add(new Request("ruta-alguna"));
      await cache.put("ruta-alguna", new Response("contenido-personalizado"));
    })
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.open("mi-cache")
      .then(cache => cache.match(event.request))
      .then(response => {
        if (response === undefined) {
          return fetch(event.request).then(respuesta => {
            cache.put(event.request, respuesta.clone());
            return respuesta;
          });
        }
        return response;
      })
  );
});
```

Este sistema es clave para implementar experiencias offline robustas y rápidas, como en aplicaciones progresivas.

---

### WebAssembly (Wasm)

**WebAssembly** es una tecnología que permite ejecutar código binario de alto rendimiento en el navegador. Está diseñada para ejecutar aplicaciones intensivas en cálculo, como videojuegos, edición multimedia, motores gráficos o simuladores científicos, directamente en la web.

Características principales:

* Código precompilado a bytecode (`.wasm`)
* Soporta lenguajes como **C**, **C++**, y **Rust**
* Puede compilarse de forma anticipada (ahead-of-time) o interpretarse al vuelo (just-in-time)
* Ofrece rendimiento cercano al nativo, ejecutándose dentro del entorno del navegador

WebAssembly complementa a JavaScript, no lo reemplaza. Ambos pueden interoperar para aprovechar lo mejor de cada entorno.

 