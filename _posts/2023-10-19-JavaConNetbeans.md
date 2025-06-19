---
title: Java con netbeans
date: '2023-06-15 11:17:32'
comments: true
categories: [Java Development]
tags:  [java, netbeans, forms, gui, desarrollo]
---
 


 
> Se pueden agregar nuevos archivos a un proyecto dandole `click derecho -> new -> other`
 

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled.png)
 
 
## Code Customizer

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%202.png)

What you can configurate here is:

- Control Access : es el acceso a la variable u objeto del componente. 
	- nota: esto es util al implementar un ejemplo de MVC y quieres que el controlador acceda a  los componentes del formulario
- "Variable" : se refiere a la forma en que se crea
- Type : el tipo de variable

# The design Tab

![Image](/assets/img/posts/Java%20con%20Netbeans%20357b6a7a1f7647f0956fdc6efaf6b2e9%2FUntitled%25203.png)

- Source
- Design
- History
- Selection mode

![Image](/assets/img/posts/Java%20con%20Netbeans%20357b6a7a1f7647f0956fdc6efaf6b2e9%2FUntitled%25204.png)

- Connection mode

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%205.png)

- preview design

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%206.png)

- Align left in column

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%207.png)

- Align right in column

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%208.png)

- Center Horizontally

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%209.png)

- Align top in row

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2010.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2011.png)

- Align bottom in row

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2012.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2013.png)

- Center Vertically

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2014.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2015.png)

- Change Horizontal Resizability

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2016.png)

- Change Vertical Resizability

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2017.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2018.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2019.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2020.png)

Por ultimo, recuerda que puedes modificar el espaciado haciendo click y luego manteniendolo presionado.

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2021.png)

# Layouts

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2022.png)

### Border

- [https://www.youtube.com/watch?v=PD6pd6AMoOI](https://www.youtube.com/watch?v=PD6pd6AMoOI)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2023.png)

El **BorderLayout** es un administrador de diseño que coloca componentes en hasta cinco áreas diferentes: centro, norte, sur, este y oeste. Cada área puede contener solo un componente.

- Los componentes se distribuyen según sus tamaños preferidos.
- Los componentes en las áreas norte y sur pueden expandirse horizontalmente.
- Los componentes en las áreas este y oeste pueden expandirse verticalmente.
- El componente central puede expandirse tanto horizontal como verticalmente para llenar cualquier espacio restante.

Ejemplo: podria usarse para recibir datos otra ventana, luego podrias utilizar un layout para mostrar los datos

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2024.png)

### Box

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2025.png)

El **BoxLayout** es un administrador de diseño que coloca componentes ya sea vertical u horizontalmente, sin envolverlos. Esto significa que los componentes no se ajustarán automáticamente a nuevas líneas.

### Propiedades del administrador de diseño

Un contenedor con este administrador de diseño tiene las siguientes [propiedades del administrador de diseño](https://www.formdev.com/jformdesigner/doc/layouts/layout-properties/):

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2026.png)

| Nombre de la propiedad | Descripción |
| --- | --- |
| EJES | El eje a lo largo del cual se colocan los componentes. Valores posibles: X_AXIS, Y_AXIS, LINE_AXIS y PAGE_AXIS. |

ejemplos: podrias aplicar este layour a un panel, ya sea horizontal o vertical

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2027.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2028.png)

### Card

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2029.png)

El **CardLayout** es un administrador de diseño que trata cada componente en el contenedor como una tarjeta. Solo una tarjeta es visible a la vez y el contenedor actúa como una pila de tarjetas. El primer componente agregado a un CardLayout es el componente visible cuando se muestra el contenedor.

Para cambiar la tarjeta visible, se utiliza el método `CardLayout.show(Container, String)`, donde `Container` es el contenedor que tiene el CardLayout y `String` es el identificador de la tarjeta que se desea mostrar.

Puedes encontrar más información sobre CardLayout en la [documentación oficial de la API de Java](https://docs.oracle.com/en/java/javase/21/docs/api/java.desktop/java/awt/CardLayout.html).

El administrador de diseño CardLayout tiene las siguientes propiedades:

- **Espacio horizontal**: El espacio horizontal en los bordes izquierdo y derecho. Valor predeterminado: 0.
- **Espacio vertical**: El espacio vertical en los bordes superior e inferior. Valor predeterminado: 0.

Puedes utilizar el CardLayout cuando necesites mostrar diferentes paneles o vistas en un contenedor y quieras alternar entre ellos de forma dinámica, mostrando solo uno a la vez.

`Coloca cada componente en fila y cuando se desborda horizontalmente, lo manda abajo`

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2030.png)

**ejemplo 01:** 

aplicacion con un Jframe principal que utiliza un border layout el cual tiene 2 paneles TOP y BOTTOM, TOP contiene 3 botones correspondientes al color a cambiar abajo. En cambio el panel BOTTOM tiene configurado un card layout el cual tiene 3 paneles.

Cada boton tiene un codigo asi, .add corresponde al nombre de variable de los paneles. ademas cada panel tiene agregada la propiedad de background color desde design.

```java
private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        // TODO add your handling code here:
        ParentPanel.removeAll();
        ParentPanel.add(YELLOW);
        ParentPanel.repaint();
        ParentPanel.revalidate();
    }
```

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2031.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2032.png)

Conclusion del ejemplo: Si bien solo se utilizo para cambiar cada color, se puede utilizar ello para agregar distintos componentes. Lo clave a entender es que se utiliza para  utilizar paneles multiples. por ejemplo:

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2033.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2034.png)

 ****

---

### Flow

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2035.png)

El **FlowLayout** es un administrador de diseño que organiza los componentes en una única fila o columna de acuerdo con el flujo natural del lenguaje. Los componentes se colocan en fila y, cuando se desbordan horizontalmente, se mueven a la siguiente línea. Esto significa que los componentes se ajustarán automáticamente a nuevas líneas si no hay suficiente espacio horizontalmente.

Algunas características del FlowLayout son:

- Los componentes se colocan secuencialmente en la dirección del flujo.
- Los componentes se ajustan automáticamente a nuevas líneas si no hay suficiente espacio horizontalmente.
- Los componentes se alinean en la dirección del flujo y se centran verticalmente.
- Puede especificar un espacio horizontal y vertical entre los componentes.

El FlowLayout es útil cuando deseas que los componentes se coloquen en una sola fila o columna, y que se ajusten automáticamente a nuevas líneas si no hay suficiente espacio horizontalmente. Es especialmente adecuado para diseños simples y fluidos.

### Grid : (RED EN ESPANOL)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2036.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2037.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2038.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2039.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2040.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2041.png)
 
# PALETA Netbeans forms
 
## Panel  de configuracion de elementos de un formulario

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2043.png)

### Opciones de configuracion utiles dentro del panel:
nota: puedes presionar en cualquiera y buscar (eficiencia)
- Cursor :
    - Hand : util para mejorar el estilo visual de un boton o combo box
    - Move
    - North resize
    - Wait
    - Text
    - Default
    - Southeast Resize
    - Northwest Resize
    - West Resize
    - Crosshair
    - Southwest
    - South Resize
    - NorthWest Resize

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2044.png)

![Image](/assets/img/posts/Java con Netbeans 357b6a7a1f7647f0956fdc6efaf6b2e9/Untitled%2045.png)



