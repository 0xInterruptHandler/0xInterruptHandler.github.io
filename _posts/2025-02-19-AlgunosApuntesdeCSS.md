---
title: Algunos apuntes de CSS
date: '2025-02-18 11:17:32'
comments: true
categories: [Web Development]
tags:  [css, frontend, web-development]
---

 

# PART l
- Se puede utilizar una version acortada de`<p>` sin cerrarlo?   : si, pero no es recomandable
- Que es un documento HTML? : un archivo de texto que contiene markup instrucctions los cuales indican como el navegador deberia estructurar o presentar el documento
- Que nombre reciben los markup elements que no encierran ningun contenido y da un ejemplo : Se llaman Empty Elements y el tag `<br>` es uno de ellos
- De que esta compuesto un tag element? : contenido, atributos y valores de los atributos
- La etiqueta`<!DOCTYPE >` Que indica ? : indica la version de HTML
- La etiqueta `<meta>` que indica ? : indica el MIME type y el charset
- Como se llama la idea de permitir solo a ciertos tag elements estar andidados o dentro de otros tag elements? : Content Model, por ejemplo las listas siguen uno al solo permitir `<ul> <li> </ul>`
- Como puedes hacer un campo de texto con listas de autocompletado? : mediante el tag `<input list="nombre"> <datalist id="nombre"> <option> opcion_1 </option> </datalist>` asociamos un elemento dataLista hacia el input tag
- Cual es la API de html5 que permite realizar dibujos? : es canvas y es utilizado en conjunto con JS
- Cual es el atributo del tag `<p>` que permite editar el contenido? : `contenteditable="true"`
- Es cierto que HTML5 tiene incorporada una API de drag and drop? : Si
- Menciona los valores del atributo `type` para el tag `input` : son estos text, password, hidden, checkbox, radio, submit, reset, image, or button 
- HTML5 cuenta con soporte de internacionalizacion ? : Si, por ejemplo se puede colocar romanji sobre el kanji
- Es cierto que se pueden especificar metadatos sobre los elementos? : Si, se puede y tiene distintos propositos

# PART ll

- Habla sobre HTML y el formatting : Inicialmente se realizaba el formatting con HTML, pero eso no era lo mejor, ya que se generaba mucho codigo anidado y varios inconvenientes
- Para que sirven los selectors de CSS? : sirven para indicar a que elemento deseo aplicar una regla CSS
- Cuales son las 4 maneras de aplicar CSS ? : Mediante un enlace hacia un archivo exterterno, tambien de forma embebida o tambien mediante import, tambien con Inline styles que se aplican a un solo elemento mediante su atributo. Link - Embeded - Import - style attribute (inline)

----

- Menciona nociones basicas de CSS : Los selectors, las 4 maneras de aplicar CSS, las distintas unidades de medida que se pueden utilizar
- que son los pattern libraries o style guides ? : son una documentacion de los componentes CSS de un proyecto en particular, existen varias herramientas que facilitan el proceso de documentacion.
- que permiten las media queries? : permiten aplicar un conjunto de reglas CSS bajo ciertas condiciones
- Habla sobre el "Hamburger Menu" : es un menu desplegable que permite esconder varios elementos en pantallas chicas, pero con la desventaja que reduce la cantidad de interaccion del usuario con estos
- Habla sobre el "Responsive design" y como se origino: Inicialmente para resolver el problema de tener un sitio web que sea compatible con moviles y escritorios, se creaban dos sitios web distintos para cada uno, lo que generaba problemas como la falta de funciones o decidir si era correcto que un dispositivo X utilice la web desktop o movile. Esto se soluciono mediante el renderizado en funcion del viewport size o a veces en la resolucion de la pantalla.
- Que es "cascade"  ? : Cascade es el nombre del conjunto de reglas que indican que realizar cuando las reglas CSS entran en conflicto y determina cual aplicar. Es la parte fundamental de como el lenguaje funciona
- Como se resuelven los conflictos en el rule set de css? : Se resuelve mediante el browser el cual seguira reglas para que asi el resultado sea predecible 
- Es cierto que "Cascade" es igual a "Inheritance" ? : No, son terminos distintos
- Es cierto que CSS es un lenguaje de programacion y una herramienta de disenio ? : No, pero al utilizarlo se tiene un poco de ambos, abstraccion y creatividad
- Cuales son las 3 cosas que CSS considera cuando ocurre un conflicto ? : Primero el origen del stylesheet, luego que selector toma precedencia sobre otro y por ultimo el orden de declaracion en el stylesheet
- Como se denomina la declaracion que gana la cascade? : Se denomina "Cascade Value"
- Cuales son los dos tipos de stylesheet origin? : El primero es "Author Style" y el otro "User agent styles" los cuales varian ya que son incorporados por un navegador en especifico
- Que STYLESHEET ORIGIN tiene mayor prioridad, los user agent o los author styles ? : Los author styles tienen  mayor prioridad que los user agent styles y sobreescriben a estos.

# PARTE 2:

- Cuales son los 2 tipos de unidades de medida en CSS ? : las unidades relativas (como em o rem) y las absolutas (como pixels)
- Por que trabajar con unidades relativas?  : porque hacen al codigo mas versatil y mas facil de trabajar
- A que se refiere "responsive" en el termino "responsive design" ? : se refiere a que el estilo debe responder de forma diferente basandose en el tamanio del browser
- Que significa REM ? : Es la sigla de "Root  em"
- Cual es la diferencia de los REM con los EM ? : La diferencia es que REM es relativo al elemento root y EM, al elemento
- Como se llama `>` en CSS ? : Se llama "Direct Descendant Combinator". Por ejemplo : `.panel > h2` apunta hacia h2 el cual es un hijo de un elemento con clase .panel
- Como se les llama tambien a las "Variables CSS" ? : Se les conoce tambien como "Custom Properties"
- Las unidades relativas "Em" y "Rem" son relativas a que? : Son relativas al "font-size"
- Que es el viewport? : Es el area de la ventana del navegador donde la pagina web es visible (no incluye la barra de navegacion, tabs, etc)
  


