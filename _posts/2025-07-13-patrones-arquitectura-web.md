---
title: patrones de arquitectura web
date: '2025-07-13 10:59'
comments: true
categories: [Programming,Web Development,Software Engineering]
tags: [arquitectura,desarrollo-web, web,web-development,frontend, desarrollo]
image:
  path: /assets/img/posts/arquitectura-web-blog/patrones-de-arquitectura-web-banner.png 

---

 

# Patrones de Arquitectura Web

## **Aplicación Web Progresiva (PWA)**

Una **Progressive Web Application (PWA)** es una aplicación web moderna que ofrece una experiencia de usuario similar a la de una aplicación nativa. Las PWAs pueden instalarse en dispositivos móviles o de escritorio, funcionar sin conexión y ejecutar tareas en segundo plano gracias al uso de **service workers** y mecanismos de **almacenamiento en caché**.

### Características principales

- **Instalación como app nativa**: aunque inician desde el navegador, pueden instalarse en el dispositivo del usuario y ejecutarse como una app independiente.
    
- **Funcionamiento offline**: mediante el uso de service workers y cache local.
    
- **Seguridad**: deben ejecutarse sobre HTTPS.
    
- **Manifesto Web**: deben incluir un archivo `manifest.json` que describe la aplicación (nombre, icono, URL de inicio, etc.).
    

```html
<!-- Ejemplo de enlace en el HTML -->
<link rel="manifest" href="./manifest.json">
```

### Requisitos para ser considerada PWA

- Proveniencia desde un **origen seguro (HTTPS)**
    
- Capacidad de carga en **modo offline**
    
- Inclusión de un **Web App Manifest**
    

### Comportamiento recomendado

- Interfaz amigable y adaptada a dispositivos móviles
    
- Transiciones y animaciones fluidas
    
- Tiempo de carga rápido:
    
    - Antes de instalar el service worker: menos de 5 segundos
        
    - Después de instalar el service worker: menos de 2 segundos
        

---

### Service Workers

Los **service workers** son scripts que actúan como intermediarios entre la aplicación web y la red. Se ejecutan en segundo plano, en un hilo independiente del navegador, y no tienen acceso directo al DOM. Solo funcionan si el sitio está servido sobre HTTPS.

#### Características:

- Interceptan peticiones de red
    
- Permiten mostrar notificaciones push
    
- Permiten sincronización en segundo plano
    
- Son asociados a un dominio específico
    

#### Registro en el navegador

```js
if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker.register("./worker.js")
      .then(reg => console.log(`Scope: ${reg.scope}`))
      .catch(err => console.error(err));
  });
}
```

#### Estados posibles

- Activado
    
- Inactivo (idle)
    
- Terminado
    
- Escuchando peticiones (fetch/message)
    

#### Ejemplo básico de uso con `CacheStorage`

```js
const cacheName = "nombre-cache";
const recursos = ["/", "/index.html", "/main.css"];

self.addEventListener("install", event => {
  event.waitUntil(
    caches.open(cacheName).then(cache => cache.addAll(recursos))
  );
});

self.addEventListener("activate", () => console.log("Service Worker activado"));

self.addEventListener("fetch", event => {
  console.log(`Interceptando: ${event.request.url}`);
  event.respondWith(
    caches.match(event.request).then(cached => cached || fetch(event.request))
  );
});
```

---

## **Aplicación de Página Única (SPA)**

Una **Single Page Application (SPA)** es una aplicación web que se carga completamente desde una única página HTML, y luego actualiza dinámicamente el contenido sin recargar la página entera.

### Características:

- Toda la lógica de navegación y renderizado se maneja en el cliente.
    
- El servidor entrega siempre la misma página HTML, y los cambios en el contenido se hacen vía JavaScript.
    
- Se obtiene una experiencia de usuario fluida y rápida, sin tiempos de recarga.
    
- Utiliza frameworks como React, Angular o Vue.js.
    

**Ejemplos populares**: Google Docs, Trello.

---

### Ventajas de una SPA

- Interacción más rápida con el usuario (sin recargas de página).
    
- Experiencia fluida similar a una aplicación de escritorio.
    
- Mayor control sobre el flujo y comportamiento de la aplicación en el cliente.
    

### Desventajas

- **SEO limitado**: las páginas SPA requieren configuración especial para ser indexadas correctamente por los motores de búsqueda.
    
- **Historial del navegador**: el manejo del historial requiere usar la **Web History API** para simular las funciones de "atrás" y "adelante".
    
- **Seguridad**: al tener la lógica en el cliente, es más vulnerable a ataques como **XSS**. Es importante validar todo en el servidor.
    
- **Renderizado en el cliente**: en dispositivos lentos puede afectar el rendimiento.
    

---

## **Patrones Modelo-Vista aplicados a SPAs**

Las SPAs suelen utilizar variantes del patrón Modelo-Vista para estructurar la lógica de presentación y negocio.

### Modelo-Vista-Controlador (MVC)

- **Modelo**: contiene la lógica de negocio y datos. Notifica cambios a la vista.
    
- **Vista**: representa visualmente los datos del modelo. Envia eventos al controlador.
    
- **Controlador**: recibe eventos del usuario, actualiza el modelo.
    

```plaintext
        modelo           usuario              evento
Modelo ---------> Vista --------> Controlador --------> Modelo
        actualiza        evento              maneja
```

- El **modelo** notifica a la **vista** cuando hay cambios en los datos.
    
- La **vista** recibe la interacción del usuario y delega al **controlador**.
    
- El **controlador** interpreta la entrada del usuario y actualiza el **modelo**.
    
- La **vista** es pasiva: no contiene lógica de negocio ni estado.
    

**Ventajas:**

- Permite múltiples vistas sincronizadas del mismo modelo.
    
- Las vistas y controladores pueden ser intercambiables (pluggables).
    

**Desventajas:**

- Puede volverse complejo en aplicaciones grandes.
    
- Existe cierto acoplamiento entre controlador y vista.
    
- Puede mezclar código dependiente e independiente de la plataforma.

---

### Modelo-Vista-Presentador (MVP)
En este patrón, el **presentador** actúa como intermediario entre el modelo y la vista. No existe comunicación directa entre ellos.

Por ejemplo, si el usuario introduce datos inválidos, el presentador mostrará un mensaje de error en la vista, pero no actualizará el modelo hasta que la entrada sea válida.
- El **presentador** actúa como puente entre modelo y vista.
    
- La vista y el modelo no se comunican directamente.
    
- El presentador gestiona los eventos del usuario y actualiza tanto el modelo como la vista según sea necesario.
    

```plaintext
           actualización
Modelo <--> Presentador <--> Vista
             evento de usuario
```

---

### Modelo-Vista-ViewModel (MVVM)
Este patrón es utilizado por frameworks como Vue.js.

- El **ViewModel** contiene únicamente los datos necesarios para la vista y gestiona la comunicación entre la vista y el modelo. A esta capa también se le conoce como **enlazador** (binder).
    
- El **modelo** mantiene la lógica de negocio y los datos, los cuales pueden estar en el servidor.
    
- Existe un **enlace bidireccional** entre la vista y el ViewModel.
    
- No hay comunicación directa entre la vista y el modelo.
    
Utilizado por frameworks como **Vue.js**.

- El **ViewModel** es una representación del modelo, adaptada específicamente a las necesidades de la vista.
    
- Existe un **enlace bidireccional** entre la vista y el ViewModel.
    
- El modelo contiene los datos reales y la lógica de negocio.
    

```plaintext
         actualización del modelo              enlace bidireccional
Modelo <-------------------------------> ViewModel <-------------------> Vista
           manejador de eventos                      actualización UI
```

---

### Modelo-Vista y sus Variantes

**Separación de datos y su visualización:**  
Es fundamental mantener una clara separación entre el modelo de datos y su representación visual. Esto permite mayor reutilización, mantenimiento y escalabilidad en las aplicaciones.

En muchos casos, los datos visualizados no provienen directamente del modelo original, sino que han sido transformados o derivados. Por ello, se requiere una capa intermedia que actúe como puente entre el modelo y la vista. Esta capa permite desacoplar ambas partes y mejorar la organización del sistema.

Entre las variantes más comunes de este patrón se encuentran:

- Modelo-Vista-Controlador (MVC)
    
- Modelo-Vista-Adaptador (MVA)
    
- Modelo-Vista-Presentador (MVP)
    
- Modelo-Vista-ViewModel (MVVM)
    

### ¿Qué modelo utilizar?

Por lo general, la elección depende del framework o entorno de desarrollo utilizado.

### Enlace de datos (data-binding)

Dado que los datos pueden cambiar durante la ejecución, es útil implementar mecanismos de **enlace de datos** que actualicen automáticamente la vista cuando el modelo se modifica. Este enlace puede ser unidireccional o bidireccional.

- **Estado de registro:** se refiere a la fuente definitiva de los datos, que puede estar en el servidor.
    
- **Estado de sesión:** corresponde al estado mantenido en el cliente (modelo), vinculado a la vista para su presentación.
