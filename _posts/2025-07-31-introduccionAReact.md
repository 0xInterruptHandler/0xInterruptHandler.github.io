---
title: introduccion a react
date: '2025-07-31 08:43:48'
comments: true
categories: [Web Development]
tags: [web-development, Web, desarrollo-web]
---


La principal diferencia entre React y HTML es que ==HTML es un lenguaje de marcado para la estructura y contenido de las páginas web, mientras que React es una biblioteca de JavaScript para construir interfaces de usuario interactivas==. HTML define la estructura básica de una página, mientras que React permite crear componentes reutilizables que pueden manejar la lógica y el estado de la interfaz. 

Aquí hay más detalles sobre las diferencias:

- **HTML:**
    - Es un lenguaje de marcado estático. 
	- Define la estructura y el contenido de una página web usando etiquetas (por ejemplo, `<p>`, `<div>`, `<img>`). 
	- No puede manejar la interactividad ni el estado por sí solo. 
	- Requiere actualizaciones completas de la página para reflejar cambios. 
- **React:**
    - Es una biblioteca de JavaScript para construir interfaces de usuario. 
	- Utiliza componentes reutilizables que encapsulan la interfaz y la lógica. 
	- Permite la creación de interfaces dinámicas y reactivas. 
	- Actualiza solo los elementos que cambian, lo que mejora el rendimiento. 
	- Se basa en [JSX](https://www.google.com/search?client=firefox-b-d&cs=1&sca_esv=4da7261d6af0beeb&sxsrf=AE3TifPmcCqqhIskkwB-OKHrIx2Zmd_Ptg%3A1751465673004&q=JSX&sa=X&ved=2ahUKEwjgo9eJrp6OAxUYALkGHcg4GHYQxccNegQIMBAB&mstk=AUtExfDEfKCvFYSFeJYhUwghxgXCMS2j8hC_fupC3mQ1xHG7ERmYJfjkWDsbEvoQk11iDBVmOEadMHdfZ_iMy9HXZolEeRUGP7BDNtiq5sd8fbOO5te_fS8haz1PMPN9g40Pk6HzFQoJtx29Zp5iFYlCTh4f4Meg7J7XmvJtYBbU4bd23YM&csui=3) (una extensión de JavaScript que permite escribir HTML dentro de JavaScript) para definir la estructura de los componentes. 
- **Relación entre ambos:**
    - React utiliza HTML (a través de JSX) para definir la estructura de sus componentes. 
	- React se ejecuta en el navegador y utiliza el DOM (Document Object Model) para renderizar la interfaz, que se basa en el HTML generado. 
- En resumen, React construye interfaces dinámicas utilizando componentes que a su vez pueden contener HTML (vía JSX). 
En pocas palabras, HTML es la base, el lenguaje de marcado, mientras que React es una herramienta para construir interfaces más complejas y dinámicas sobre esa base. 

Este video explica las diferencias clave entre HTML y React en atributos:


 
# React JS – Conceptos Básicos


---

## 1. Introducción a JSX

 `002 Introducción a JSX`  
JSX (JavaScript XML) es una **extensión de sintaxis para JavaScript** que permite escribir código similar a HTML dentro de archivos `.js` o `.jsx`. Se utiliza principalmente con React para definir la estructura visual de los componentes.

- Aunque se parece a HTML, JSX no es un lenguaje de marcado; es una extensión de JavaScript.
    
- Permite incrustar expresiones de JavaScript dentro de las etiquetas utilizando `{}`.
    

---

## 2. ¿Qué es React JS?

 `03 Conceptos básicos de React JS`  
React JS es una **biblioteca de JavaScript de código abierto** desarrollada por Meta, diseñada para construir interfaces de usuario de forma declarativa y eficiente.

### DOM real vs DOM virtual:

- **DOM real:** Es la representación en memoria de la estructura HTML de una página. Es manipulable directamente por JavaScript y el navegador.
    
- **DOM virtual:** Es una **copia ligera** del DOM real utilizada por React. Permite identificar y aplicar únicamente los cambios necesarios al DOM real, lo que mejora el rendimiento.
    

---

## 3. Crear una aplicación con React

 `004 Creando nuestra primera app en React JS 2025-05-25

```bash
npx create-react-app mi-primera-react-app
```

---

## 4. Estructura básica de un proyecto en React

 `005 Estructura de React JS 2025-05-25

- Contiene carpetas como `src`, `public`, `node_modules`.
    
- El punto de entrada por defecto es `src/index.js`.
    
- Los componentes se organizan dentro de `src/components` (opcionalmente).
    

---

## 5. Componentes en React

 `006 Nuestro primer componente en React JS`  
En React, los componentes son bloques reutilizables que definen partes de la UI. Pueden crearse como:

### 🔹 Componentes funcionales (usando `rfce`)

```js
function MiComponente(props) {
  return (
    <div>
      <h1>{props.titulo}</h1>
      <p>Este es mi componente.</p>
    </div>
  );
}

export default MiComponente;
```

### 🔹 Componentes de clase (usando `rccp`)

```js
import React from 'react';

class MiComponente extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.titulo}</h1>
        <p>Este es mi componente.</p>
      </div>
    );
  }
}

export default MiComponente;
```

### 🔹 Uso de componentes

```js
import MiComponente from './MiComponente';

function App() {
  return (
    <div>
      <MiComponente titulo="Mi Componente" />
    </div>
  );
}
```

---

## 6. Props en React

📹 _Archivos:_

- `007 ¿Qué son los Props de React
    
- `008 Pasando props básicos entre componentes
    
- `009 Pasando variables y objetos entre componentes por los props
    

### 🔹 Qué son las props:

- Son propiedades que se pasan de un componente padre a un componente hijo.
    
- Son **inmutables** dentro del componente hijo.
    
- Permiten reutilizar componentes de forma flexible.
    

### 🔹 Ejemplo:

```js
function ComponentePadre() {
  const nombre = "Juan";
  const datos = { nombre: "Maria", edad: 30 };

  return <ComponenteHijo nombre={nombre} datos={datos} />;
}

function ComponenteHijo(props) {
  return (
    <div>
      <h1>Hola, {props.nombre}!</h1>
      <p>Datos: {props.datos.nombre} - {props.datos.edad}</p>
    </div>
  );
}
```

---

## 7. Pasar funciones como props

 `010 Pasando funciones entre componentes por los props

```js
const user = { nombre: "jose", edad: 15, color: "azul" };

const saludarFn = nombre => {
  console.log("hola, " + nombre);
};

return (
  <BotonSaludar funcionSaludar={saludarFn} datos={user} />
);
```

**Componente hijo:**

```js
function BotonSaludar(props) {
  const { funcionSaludar, datos } = props;

  return (
    <button onClick={() => funcionSaludar(datos.nombre)}>
      Saludar
    </button>
  );
}
```

---

## 8. Desestructuración de props

 `011 El uso de la Asignación por Destructuring
La **desestructuración** permite extraer propiedades de objetos directamente en variables:

```js
const { datos, saludarFn } = props;
const { nombre } = datos;

<button onClick={() => saludarFn(nombre)}>Saludar</button>
```

---

## 9. Props por defecto

 `012 Props por defecto`  
Puedes definir valores por defecto para props si no se pasan:

```js
const { datos, saludarFn } = props;
const { nombre = "Anónimo" } = datos;

<button onClick={() => saludarFn(nombre)}>Saludar</button>
```

---

## 10. Template Strings (Cadenas plantilla)

 `013 Template Strings
Son una característica de ES6+ que permiten interpolación de variables:

```js
const saludarFn = nombre => {
  console.log(`Hola ${nombre}`);
};
```

Se usan comúnmente en JSX para insertar valores dinámicos en el marcado.

---

## 11. React Developer Tools

 `014 Usando React Developer Tools
Extensión para Chrome y Firefox que permite:

- Ver estructura de componentes.
    
- Inspeccionar props y estado.
    
- Detectar problemas de rendimiento.
    

---

## 12. Hook de estado: useState

 `015 Hook de estado - useState
Permite usar estado en componentes funcionales.

```js
import { useState } from 'react';

const [stateCar, setStateCar] = useState(false);

const encenderApagar = () => {
  setStateCar(prev => !prev);
};

return (
  <>
    <button onClick={encenderApagar}>Encender/Apagar</button>
    <h3>El coche está: {stateCar ? "encendido" : "apagado"}</h3>
  </>
);
```

---

## 13. Hook de efecto: useEffect

 `016 Hook de efecto - useEffect
Permite ejecutar efectos secundarios como llamadas a APIs, suscripciones o manipulaciones del DOM.

```js
const [contar, setContar] = useState(0);

useEffect(() => {
  console.log(`Total: ${contar}`);
}, [contar]);

const incrementar = () => {
  setContar(prev => prev + 1);
};
```

---



# Documentacion de React 



- [Describing the UI](https://react.dev/learn/describing-the-ui "Describing the UI")

    - [Your First Component](https://react.dev/learn/your-first-component "Your First Component") 
		- **Resumen – Your First Component (Tu primer componente en React)** En React, los componentes son funciones de JavaScript que devuelven una estructura JSX y representan bloques reutilizables de interfaz de usuario. Son el núcleo del desarrollo en React y permiten combinar HTML, CSS y lógica de manera modular. Un componente se define como una función cuyo nombre debe comenzar con mayúscula y que retorna JSX, como por ejemplo un <img />. Estos componentes pueden anidarse y reutilizarse en otros, formando estructuras más complejas, como un componente Gallery que contiene varios Profile. React distingue entre etiquetas HTML nativas (en minúsculas) y componentes personalizados (iniciados con mayúscula). Para mantener un rendimiento óptimo, los componentes deben definirse en el nivel superior del archivo, evitando su declaración dentro de otros componentes. Esta estructura fomenta la reutilización y la organización del código, sentando las bases para construir aplicaciones interactivas modernas.
    - [Importing and Exporting Components](https://react.dev/learn/importing-and-exporting-components "Importing and Exporting Components") 
	    - **Resumen – Importing and Exporting Components (Importación y Exportación de Componentes)** En React, la reutilización de componentes es esencial, y para mantener el código organizado y modular, es común separar los componentes en diferentes archivos. El archivo raíz (por ejemplo, `App.js`) contiene el componente principal que puede importar otros componentes desde archivos externos. Para mover un componente, simplemente se crea un nuevo archivo, se exporta el componente (usando exportaciones **por defecto** o **nombradas**), y luego se importa en el archivo que lo usará. Solo puede haber una exportación por defecto por archivo, pero múltiples exportaciones nombradas. Por ejemplo, puedes exportar `Gallery` como exportación por defecto y `Profile` como exportación nombrada desde un mismo archivo, e importarlos en `App.js` con `import Gallery from './Gallery'` y `import { Profile } from './Gallery'`. Esta estructura modular mejora la legibilidad, el mantenimiento y la escalabilidad de las aplicaciones React.
    - [Writing Markup with JSX](https://react.dev/learn/writing-markup-with-jsx "Writing Markup with JSX")
	    - **Resumen – Writing Markup with JSX** : JSX es una extensión de sintaxis para JavaScript que permite escribir marcado similar a HTML dentro del código JavaScript, lo que facilita combinar lógica y presentación en componentes React. A diferencia del enfoque tradicional de separar HTML, CSS y JS, JSX agrupa el marcado con la lógica de renderizado, manteniéndolos sincronizados y más mantenibles. Aunque se parece a HTML, JSX es más estricto: requiere un único elemento raíz, etiquetas cerradas explícitamente y atributos en camelCase (por ejemplo, className en lugar de class). También permite insertar lógica dinámica directamente en el marcado. Para convertir HTML a JSX correctamente, es importante seguir estas reglas, aunque existen herramientas automáticas que pueden ayudar en el proceso. JSX y React son independientes, pero comúnmente se usan juntos para crear interfaces interactivas de forma eficiente.
    - [JavaScript in JSX with Curly Braces](https://react.dev/learn/javascript-in-jsx-with-curly-braces "JavaScript in JSX with Curly Braces") 
	    - **Resumen – JavaScript in JSX with Curly Braces**  : JSX permite insertar lógica y variables de JavaScript directamente en el marcado usando llaves {}, lo que facilita integrar contenido dinámico en los componentes. Puedes pasar strings entre comillas para atributos, pero si deseas usar variables, funciones u objetos, debes usar llaves. JSX admite expresiones JavaScript dentro del contenido de una etiqueta o como valores de atributos (por ejemplo, alt={description} o style={{ color: 'pink' }}). Cuando ves {{ }}, se trata simplemente de un objeto JavaScript dentro de JSX. También es común usar objetos para estilos en línea o agrupar varias propiedades relacionadas. Esta capacidad de combinar lógica y presentación mantiene los componentes sincronizados, reutilizables y fáciles de mantener.
    - [Passing Props to a Component](https://react.dev/learn/passing-props-to-a-component "Passing Props to a Component") 
	    - En React, los **props** permiten que los componentes padres pasen información a sus componentes hijos, como si fueran argumentos de funciones, y pueden incluir cualquier valor de JavaScript (strings, objetos, funciones, JSX, etc.). Se pasan como atributos en JSX y se leen mediante **desestructuración** en la función del componente hijo. Puedes asignar valores por defecto a props usando `=`, y para mayor concisión, es posible reenviar todos los props usando el operador spread (`{...props}`), aunque con moderación. Además, cuando se anida contenido dentro de un componente (por ejemplo, `<Card><Avatar /></Card>`), este se accede a través del prop especial `children`, lo que permite crear componentes envoltorios flexibles. Es importante saber que los props son **inmutables**: si un componente necesita cambiar sus datos, deberá hacerlo a través del **estado (state)** desde su componente padre, ya que los props son solo lecturas instantáneas del momento. 
    - [Conditional Rendering](https://react.dev/learn/conditional-rendering "Conditional Rendering") 
	    - En React, el renderizado condicional permite mostrar diferentes elementos en pantalla según ciertas condiciones, utilizando estructuras de control de JavaScript como `if`, el operador ternario (`? :`) o el operador lógico `&&`. Puedes retornar distintos fragmentos de JSX según el valor de una prop, omitir contenido devolviendo `null`, o asignar dinámicamente contenido a una variable antes de incluirlo en JSX. Estas técnicas hacen el código más flexible y legible, y aunque existen atajos como el ternario y el `&&`, también puedes usar estructuras más explícitas como `if` y variables intermedias, especialmente cuando el código se vuelve complejo. En resumen, React se apoya completamente en la lógica de JavaScript para decidir qué renderizar y cuándo. 
    - [Rendering Lists](https://react.dev/learn/rendering-lists "Rendering Lists") 
	    - En React, para mostrar múltiples componentes similares a partir de una colección de datos, se utilizan métodos de JavaScript como `map()` para transformar cada elemento en un componente JSX y `filter()` para mostrar solo ciertos elementos según una condición. Es fundamental asignar una `key` única a cada elemento generado para que React pueda identificar correctamente cada uno, incluso si su posición cambia. Estas claves deben ser estables, como un ID de base de datos, y no deben generarse dinámicamente, ya que esto puede provocar errores y pérdidas de estado. Organizar los datos fuera de los componentes y renderizarlos dinámicamente permite construir interfaces más eficientes y mantenibles.
    - [Keeping Components Pure](https://react.dev/learn/keeping-components-pure "Keeping Components Pure") 
	    - Mantener los componentes puros en React significa que deben comportarse como funciones puras: no deben modificar variables externas ni tener efectos secundarios durante el renderizado, y siempre deben devolver el mismo JSX dado los mismos props. Esta pureza ayuda a evitar errores difíciles de detectar y garantiza un comportamiento predecible. Para lograrlo, se deben evitar mutaciones de estado o variables fuera del componente, y delegar efectos secundarios a los controladores de eventos o, si es necesario, al hook `useEffect`, el cual se ejecuta después del renderizado. Aunque se pueden mutar variables internas creadas durante el render, no debe hacerse con datos que existían antes. React confía en esta pureza para optimizar y garantizar una experiencia estable, por lo que adoptar este enfoque es clave para desarrollar componentes fiables y mantenibles.
    - [Your UI as a Tree](https://react.dev/learn/understanding-your-ui-as-a-tree "Your UI as a Tree") 
	    - En React, la estructura de una aplicación se representa como un árbol, lo cual ayuda a entender la relación entre componentes y cómo fluye la información. El **árbol de renderizado** refleja la jerarquía de componentes en una única pasada de renderizado, donde cada nodo es un componente, y puede cambiar dinámicamente con el renderizado condicional. Identificar componentes de nivel superior (más complejos y críticos para el rendimiento) y componentes hoja (frecuentemente re-renderizados) es clave para optimizar la aplicación. Por otro lado, el **árbol de dependencias de módulos** representa las relaciones de importación entre archivos JavaScript, incluyendo no solo componentes, sino también utilidades y constantes. Este árbol es utilizado por herramientas como los _bundlers_ para agrupar el código necesario que se enviará al cliente, y es crucial para controlar el tamaño del _bundle_ y mejorar el tiempo de carga de la interfaz.
    
- [Adding Interactivity](https://react.dev/learn/adding-interactivity "Adding Interactivity")
    - El capítulo _Adding Interactivity_ de React explica cómo manejar la interacción del usuario mediante eventos y cómo utilizar el **estado** para que los componentes recuerden y reaccionen a esos cambios. React usa el hook `useState` para declarar variables de estado que cambian con el tiempo, como el índice de una galería o el contenido de un formulario. El estado no se actualiza de inmediato, sino que React lo trata como una _instantánea_ que provoca un nuevo renderizado. Las actualizaciones múltiples deben hacerse con funciones de actualización (`setState(prev => ...)`) para evitar errores. Además, al trabajar con **objetos o arrays** en el estado, es importante no mutarlos directamente, sino crear copias con el operador spread (`...`) o usar librerías como **Immer** para facilitar esta tarea. Finalmente, React realiza las actualizaciones en dos fases: renderizado y compromiso al DOM, lo que permite entender mejor el ciclo de vida de una actualización de la interfaz. 
    - [Responding to Events](https://react.dev/learn/responding-to-events "Responding to Events") 
	    - El apartado **"Responding to Events"** de React explica cómo manejar eventos en componentes JSX mediante funciones llamadas _event handlers_, que se ejecutan ante interacciones del usuario como clics o enfoque de inputs. Estas funciones pueden definirse dentro del componente o pasarse desde un componente padre como props, permitiendo mayor reutilización. Es importante pasar la función sin ejecutarla (`onClick={handleClick}`), y no llamarla directamente (`onClick={handleClick()}`), ya que eso la ejecutaría inmediatamente al renderizar. React también permite nombrar los manejadores de eventos con nombres personalizados como `onPlayMovie`, y controlar el flujo del evento usando `e.stopPropagation()` para evitar que se propague a componentes padres, o `e.preventDefault()` para evitar comportamientos por defecto del navegador (como recargar la página al enviar un formulario). Además, en lugar de depender de la propagación, se puede optar por que el hijo ejecute su lógica y luego invoque explícitamente la función pasada por el padre. Estos patrones hacen más predecible y flexible el manejo de eventos en una aplicación React.
    - [State: A Component's Memory](https://react.dev/learn/state-a-components-memory "State: A Component's Memory") 
	    - El estado (_state_) en React es la forma en que un componente recuerda información entre renderizados, como el valor de un input, la imagen mostrada en una galería o los productos de un carrito. A diferencia de variables normales, el estado persiste entre renderizados y puede activar una nueva renderización al actualizarse. Se declara con el Hook `useState`, que devuelve un par: el valor actual y una función para actualizarlo. Los Hooks solo pueden usarse en el nivel superior del componente y no dentro de condiciones o bucles. Puedes tener múltiples variables de estado en un componente, cada una independiente, ideal para datos no relacionados. Además, el estado es local y aislado por instancia de componente: renderizar dos veces un mismo componente crea estados separados. Para sincronizar estados entre componentes, se recomienda levantar el estado a un componente padre común. Así, `useState` convierte los componentes de React en entidades dinámicas y reactivas con memoria propia.
    - [Render and Commit](https://react.dev/learn/render-and-commit "Render and Commit") 
	    - El proceso de actualización en una aplicación React ocurre en tres etapas: **trigger, render y commit**. Primero, se **dispara un renderizado** cuando un componente se monta por primera vez o cuando cambia su estado (o el de un ancestro). Luego, React **llama a los componentes involucrados** para calcular qué debe mostrarse, en un proceso puro y predecible que no debe alterar datos externos. Finalmente, en la fase de **commit**, React actualiza el DOM solo si hubo cambios respecto al renderizado anterior, aplicando las modificaciones mínimas necesarias. Así, React optimiza el rendimiento, evita renderizados innecesarios y garantiza una experiencia fluida, culminando con el navegador **pintando** la pantalla actualizada.
    - [State as a Snapshot](https://react.dev/learn/state-as-a-snapshot "State as a Snapshot") 
	    - En React, el estado no se comporta como una variable común, sino como una **instantánea (“snapshot”) en el tiempo**. Cuando se llama a `setState`, React **no actualiza el estado de inmediato**, sino que **programa una nueva renderización**, y cada render recibe su propio conjunto de valores de estado, eventos y props. Esto significa que los **manejadores de eventos acceden al estado tal como era en el momento del render** en que fueron creados, lo que evita errores relacionados con el tiempo y asincronía. Aunque se actualice el estado varias veces en un mismo render, todos los `setState` dentro de ese ciclo usarán el mismo valor antiguo. React mantiene este enfoque para que el estado sea predecible y consistente, incluso en operaciones asincrónicas como `setTimeout`, donde se sigue accediendo a la versión anterior del estado.



