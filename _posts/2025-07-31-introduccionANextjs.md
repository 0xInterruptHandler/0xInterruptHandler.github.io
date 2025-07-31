---
title: Introduccion a Nextjs
date: '2025-07-31 08:39:07'
comments: true
categories: [Web Development]
tags: [web, desarrollo-web, web-development]
---




Next.js es un  framework de JavaScript basado en React ( ya que react es una libreria de javascript, es decir next.js es una herramienta o conjunto de herramientas que extiende y mejora el funcionamiento de React para construir aplicaciones web ) que permite el renderizado del lado del servidor y la generación de sitios estáticos para aplicaciones web. Ofrece una experiencia de desarrollo fluida con características como la división de código automática, el enrutamiento basado en archivos y el soporte CSS integrado. Next.js es ampliamente utilizado para construir aplicaciones web rápidas, amigables para SEO y escalables.

A diferencia de React puro, que es solo la parte visual (UI), Next.js agrega estructura, enrutamiento y manejo del rendimiento, lo que lo convierte en un marco más completo para aplicaciones web.
En resumen, Next.js es un framework que te ayuda a construir aplicaciones web de manera más sencilla y rápida usando React como base.

Vercel es una  **plataforma de despliegue y alojamiento web que facilita a los desarrolladores frontend la creación, publicación y escalabilidad de sus aplicaciones web** 

---
 

- [Getting Started](https://nextjs.org/docs/13/getting-started)
    
    - [Installation](https://nextjs.org/docs/13/getting-started/installation)
	    - requerido node js 16 hacia arriba (hay instalacion manual y automatica) de forma automatica: `npx create-next-app@13.5.11` este comando configura automaticamente todo (nombre, usar typescript o no,  usar o no eslint, usar o no tailwind css, usar o no el directorio src, usar o no APP ROUTER pero es recomndable si usarlo, customizar o no el import alias), puedes usar src opcionalmente, usarlo te permite separa la aplicacion de los archivos de configuracion. CONFIGURACION MANUAL: `npm install next@13.5.11 react@18.2.0 react-dom@18.2.0`  luego agrega "scripts" en package.json lo si lanzas npm run dev, dira "no se ha podido encontrar ningun pages o app directory" pages antes se usaba, ahora ya no, ahora se usa app router, entonces crea el directorio app y dentro layout.tsx y page.tsx. inserta el codigo de ejemplo y ahora npm run dev muestra un string. (opcional) directorio public permite servir assets estaticos (imagenes, fuentes, etc) que pueden ser referenciados en el codigo empezando en la url base (`/`)
    - [Project Structure](https://nextjs.org/docs/13/getting-started/project-structure)
	    - archivos y carpetas de nivel superior (top level), archivos de configuracion, convenciones de enrutamiento

| tipo     | archivos                                                                                                        | descripcion                                                 |
| -------- | --------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| FOLDER   | app                                                                                                             | enrutador de la app                                         |
| FOLDER   | pages(no usado actualmente)https://nextjs.org/docs/13/getting-started/installation#the-pages-directory-optional | enrutador de paginas                                        |
| FOLDER   | public                                                                                                          | servir recursos o assets estaticos(fuentes, imgs, etc)      |
| FOLDER   | src                                                                                                             | directorio opcional para separar la app de los config files |
| ARCHIVOS | middleware.js                                                                                                   | midleware de requests de next js                            |
| ARCHIVOS | tsconfig.json                                                                                                   | archivo de configuracion para ts                            |
| ARCHIVOS | next.config.js                                                                                                  | archivo de config de nextjs                                 |
| ARCHIVOS | next-env.d.ts                                                                                                   | archivo de declaracion typescript para next js              |
| ARCHIVOS |                                                                                                                 |                                                             |
| ARCHIVOS |                                                                                                                 |                                                             |
| ARCHIVOS |                                                                                                                 |                                                             |
| ARCHIVOS |                                                                                                                 |                                                             |
| ARCHIVOS |                                                                                                                 |                                                             |
| ARCHIVOS |                                                                                                                 |                                                             |
| ARCHIVOS |                                                                                                                 |                                                             |

CONVENSIONES DE ENTURAMIENTO `APP ROUTING` (pudes ignorar el pages routing , ya que actualmente no se usa)
 
| tipo                             | archivos | descripcion |
| -------------------------------- | -------- | ----------- |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| ARCHIVOS ROUTING                 |          |             |
| RUTA ANIDADA                     |          |             |
| RUTA ANIDADA                     |          |             |
| RUTA DINAMICA                    |          |             |
| RUTA DINAMICA                    |          |             |
| RUTA DINAMICA                    |          |             |
| GRUPO RUTAS Y FOLDERS PRIVADOS   |          |             |
| GRUPO RUTAS Y FOLDERS PRIVADOS   |          |             |
| RUTAS PARALELTAS E INTERCEPTADAS |          |             |
| RUTAS PARALELTAS E INTERCEPTADAS |          |             |
| RUTAS PARALELTAS E INTERCEPTADAS |          |             |
| RUTAS PARALELTAS E INTERCEPTADAS |          |             |
| RUTAS PARALELTAS E INTERCEPTADAS |          |             |

 

- [Building Your Application](https://nextjs.org/docs/13/app/building-your-application)
	- next js provee de bloques de construccion para crear web apps full stack, se explicara como suar esto para personalizar el comportamiento de tu app. esta organizado seuencialmente de basico a avanzado. Recomendacion (routing, redering, data fetching, styling) para obtner los fundamentos, luego (optimizing y configuring) finalmente (deploying y upgrading)
    
- [Routing](https://nextjs.org/docs/13/app/building-your-application/routing)
	- Arbol sub arbol, hojas. asimismo la url esta formada por `dominio.com/segmento/segmento` donde `segment/segmento` recibe el nombre de path. APP ROUTER funciona en un directorio nombrado `app` (representa el `/` primero) , esta construido sobre [react server components](https://nextjs.org/docs/13/app/building-your-application/rendering/server-components), el cual soporta layouts compartidos, enrutamiento anidado, estados de carga, manejo de errores y mas; pero tambien puedes usar [client components](https://nextjs.org/docs/13/app/building-your-application/rendering/client-components). Ademas de app, existe pages(que actualmente no se usa) app tiene mayor prioridad sobre este.  ROL DE FOLDERS Y ARCHIVOS: folders son usados par definir rutas o paths utilizarndo una jerarquia de sistema de archivos desde el fonder raiz hasta el folder leaf/hoja que incluye el page.tsx o page.js y los archivos son usados para crear la UI que es mostrada en un segmento de la ruta. [Convension de archivos](https://nextjs.org/docs/13/app/building-your-application/routing#file-conventions), son el conjunto de archivos especiales que next js provee para crear UI con un comportamiento en especifico en rutas anidadas(ej. Layout es la UI compartida para un segmento y sus hijos, pagela UI unica para una ruta, route un endpoint server-side. PAGES ES EL MAS COMUN PARA MOSTRAR UI UNICA EN UNA RUTA([tambien pueden hacer data fetching](https://nextjs.org/docs/13/app/building-your-application/data-fetching)) Y LAYOUTS TAMBIEN ES EL MAS COMUN) puede usarse .js .jsx y .tsx como extensiones en los archivos espeiales. RUTA ANIDADA: /src/app/dashboard/(archivos)+(directorio/(archivos)) COLOCATION: se refiere aque ademas de los archivos especiales, tienes la opcion de agregar tus propios archivos, por que? porque recuerad que mientras que los folders definen rutas, es page.js o route.js los que son publicamente accesibles (ej. /app/components/button.js (no es enrutable) pero /app/dashboard/page.js (si es enrutable)). Asimismo existe jerarquia de componentes en los archivos especiales que englobaran dependiendo del caso al componente del segmento de una ruta anidada. [AVANZADO: PATRONES DE ENRUTAMIENTO AVANZADOS](https://nextjs.org/docs/13/app/building-your-application/routing#advanced-routing-patterns): 1. rutas paralelas 2. interceptacion de rutas: permite interceptar una ruta y mostrarlo en el contexto de otra ruta(ej.Seeing all tasks while editing one task or expanding a photo in a feed)


	-  [Defining Routes](https://nextjs.org/docs/13/app/building-your-application/routing/defining-routes)
		- lo anterior nos permitio comprender los fundamentos. definimos y organizamos rutas
	- [Pages and Layouts](https://nextjs.org/docs/13/app/building-your-application/routing/pages-and-layouts)
		-  los layouts (layout.js)preservan el estado, se mantiene interactivas y no se re renderizan, tambien pueden ser anidados. TEMPLATES (template.js) son similares a los layouts en el sentido que envuelven al child layout o page, se diferencian porque no mantienen el estado y crean una nueva instancia para cada hijo en la navegacion, es decir en la navegacion del cliente una nueva instancia del componente es montada y los elementos DOM son recreados. ROOT LAYOUT (OBLIGATORIO, junto a las tags html y body, debido a que next no las crea, puedes definir tags SEO aqui) es por defecto y unicamente puede ser un server component.
	- [Linking and Navigating](https://nextjs.org/docs/13/app/building-your-application/routing/linking-and-navigating) 
		-  existen 2 formas de navegar: 1. COMPONENTE `<link>` : es un componente incorporado que extienda a la etiqueta `<a>` para usarlo usa `import Link`  2.[HOOK `useRouter`](https://nextjs.org/docs/13/app/building-your-application/routing/linking-and-navigating#userouter-hook)  : permite cambiar rutas de manera programatica, obligatoriamente utiliza `'use client'` al inicio. RECOMENDACION: usa el hook cuando tengas un requerimiento especifico, sino usa el componente Link. 
	- [Route Groups](https://nextjs.org/docs/13/app/building-your-application/routing/route-groups) 
		- Un grupo de ruta permite realizar agrupaciones logicas, por ejemplo folder `(marketing)` agruparia rutas como about blog, etc sin afectar la ruta url, pero no deberian resolver a una misma ruta, por ejemplo un archivo con el mismo nombre.
	- [Dynamic Routes](https://nextjs.org/docs/13/app/building-your-application/routing/dynamic-routes) 
		- En Next.js, las **Dynamic Routes** permiten crear rutas cuyo nombre de segmento no se conoce de antemano, utilizando nombres de carpetas entre corchetes como `[slug]`. Estas rutas dinámicas reciben los valores como `params`, lo que permite renderizar contenido específico por URL, como en un blog con rutas como `/blog/a` o `/blog/b`. Además, con la función `generateStaticParams`, es posible pre-generar estas rutas en tiempo de compilación para mejorar el rendimiento. También existen **Catch-all Segments** (`[...slug]`) para capturar múltiples segmentos y **Optional Catch-all Segments** (`[[...slug]]`) que incluso permiten que el segmento sea opcional. En TypeScript, se pueden tipar los `params` para mayor seguridad y claridad en las rutas dinámicas.
	- [Loading UI and Streaming](https://nextjs.org/docs/13/app/building-your-application/routing/loading-ui-and-streaming) 
		- Next.js permite mejorar la experiencia del usuario durante la carga de rutas mediante archivos especiales como `loading.js`, que funcionan junto a React Suspense para mostrar interfaces de carga instantáneas, como _skeletons_ o spinners, mientras se renderiza el contenido. Este archivo se coloca junto a `layout.js` y `page.js` para mostrar de inmediato un estado de carga desde el servidor, sin bloquear la navegación ni la interactividad del layout. Además, con **Streaming**, Next.js divide y envía partes del HTML progresivamente al cliente, permitiendo mostrar secciones prioritarias antes de que toda la información esté lista. Esto reduce tiempos como TTFB, FCP y TTI, y gracias a la compatibilidad con Suspense y _selective hydration_, React prioriza la interactividad de los componentes más relevantes. Todo esto mantiene el SEO intacto, ya que los datos clave como los metadatos se procesan antes del inicio del streaming.
	- [Error Handling](https://nextjs.org/docs/13/app/building-your-application/routing/error-handling) 
		- Next.js utiliza el archivo especial `error.js` para manejar errores de forma controlada dentro de segmentos de rutas, creando automáticamente un **React Error Boundary** que aísla errores en componentes específicos sin afectar el resto de la aplicación. Este archivo permite mostrar interfaces personalizadas de error y ofrecer opciones de recuperación, como el botón `reset()` para reintentar renderizar el segmento afectado. Los errores se propagan al límite de error más cercano, y su alcance depende de la ubicación del `error.js` en la jerarquía de carpetas. Para errores en layouts o componentes raíz, se usa `global-error.js`, que envuelve toda la aplicación y debe incluir etiquetas `<html>` y `<body>`. En producción, los errores enviados al cliente son genéricos para proteger información sensible, mientras que en desarrollo se brinda más detalle para facilitar la depuración.


