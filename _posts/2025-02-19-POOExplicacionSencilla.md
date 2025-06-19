---
title: Explicacion de POO Facil
date: '2025-02-18 11:17:32'
comments: true
categories: [Programming]
tags: [poo, oop, programación-orientada-objetos]
---

 
### Clases en Programación Orientada a Objetos

Una **clase** es una estructura que contiene **atributos** (o propiedades), **métodos** y un **nombre**.

#### Atributos

Los atributos son variables asociadas a la clase que describen sus características. Estos atributos tienen un **tipo de dato** que puede ser uno de los tipos básicos, como `int`, `string`, `boolean`, `double`, o incluso otra clase como tipo de dato.

Los **tipos de datos** más comunes son:

- `int`: para números enteros.
- `string`: para texto.
- `boolean`: para valores de verdad (`true` o `false`).
- `double`: para números con decimales.

#### Convenciones en la Nomenclatura de Atributos

- **Sustantivos**: generalmente se asignan nombres como `String nombre`, `String apellido`, `int codigo`.
- **Verbos**: se usan para describir un estado o acción, como `boolean EstaCaminando`, `boolean EstaEnElSuelo`.

En la mayoría de los casos, los atributos de la misma clase pueden ser referenciados dentro de la propia clase usando la palabra clave `this`. Esto hace referencia a la instancia actual de la clase, y mediante el punto (`this.nombreAtributo`) se accede al atributo específico.

#### Controladores de Acceso

Los atributos y métodos de una clase pueden tener controladores de acceso que determinan su visibilidad:

- **`public`**: significa que pueden ser accedidos desde cualquier parte del programa.
- **`private`**: significa que solo pueden ser accedidos dentro de la propia clase.

#### Métodos

Los métodos son funciones dentro de una clase que realizan acciones o retornan valores. Tienen un **nombre** (generalmente un verbo) y pueden **recibir parámetros**. Ejemplos de métodos:

- `obtenerNombre()`
- `calcularPrecio()`

Los parámetros son los valores que se pasan al método dentro de los paréntesis y, al igual que los atributos, tienen un tipo de dato asociado (por ejemplo, `int`, `String`, etc.).

---

### Clases desde Otra Clase

Una clase permite crear **instancias** u **objetos**, que son representaciones concretas de esa clase. Los objetos se crean generalmente mediante un **constructor**, un método especial de la clase que inicializa los atributos del objeto.

#### El Constructor

El **constructor** es un método que se usa para inicializar los atributos de la clase usando `this.atributo`. Este método permite asociar valores a los atributos cuando se crea el objeto.

Por ejemplo, un constructor podría ser:

```java
public Persona(String nombre, int edad) {
    this.nombre = nombre;
    this.edad = edad;
}
```

Aunque no es obligatorio usar un constructor, es una práctica recomendada. Sin él, sería necesario utilizar **setters**, métodos que asignan valores a los atributos de un objeto después de su creación.

#### Setters

Los **setters** son métodos que asignan valores a los atributos de la clase. Un setter podría ser el siguiente:

```java
public void setNombre(String nombre) {
    this.nombre = nombre;
}
```

Es importante recordar que un setter no tiene que ser solo una simple asignación de valor. Puede contener **lógica adicional**, como validaciones, condicionales, bucles, etc., para decidir si se debe o no asignar un valor.

#### Almacenamiento de Objetos

Una vez que se crea un objeto, este se almacena en una **variable de tipo de clase**. Por ejemplo, si tenemos la clase `Persona`, podemos crear un objeto de tipo `Persona` y asignarlo a una variable:

```java
Persona asdf;
```

Este objeto es almacenado en la memoria heap, donde cada instancia tiene una dirección de memoria única.

---

### Métodos de Clases

Los métodos de una clase no siempre tienen que coincidir con los atributos de la misma. Es posible que un método reciba parámetros que no sean directamente los atributos de la clase, aunque es más común que lo sean, ya que facilita el acceso a los datos del objeto.

Un **método** puede aceptar como parámetros tipos de datos primitivos (`int`, `String`, `boolean`, `double`, etc.) o instancias de otras clases, lo que significa que puede trabajar con objetos como parámetros.

Ejemplo de método que recibe un objeto como parámetro:

```java
public static void imprimirDetalles(Persona persona) {
    System.out.println("Nombre: " + persona.nombre);
    System.out.println("Edad: " + persona.edad);
}
```

---

### Métodos Estáticos

A diferencia de los métodos tradicionales, los **métodos estáticos** pertenecen a la clase en sí misma y no requieren una instancia específica para ser utilizados. Esto significa que se pueden llamar sin necesidad de crear un objeto de la clase.

El código que hace uso de métodos estáticos:

```java
public static void main(String[] args) {
    Persona persona1 = new Persona("Juan", 30);
    Persona.imprimirDetalles(persona1);  // Llamada a método estático
}
```

En este ejemplo, el método `imprimirDetalles` es estático y se llama directamente a través de la clase `Persona`, sin necesidad de un objeto.

---

### Interfaces

Una **interfaz** es un conjunto de métodos que define lo que **debe hacerse**, pero no cómo debe hacerse. La implementación de estos métodos es responsabilidad de las clases que **implementan** la interfaz.

Al implementar una interfaz, una clase se compromete a proporcionar la implementación de los métodos declarados en la interfaz. Es importante aclarar que al implementar una interfaz, la clase puede definir no solo los métodos de la interfaz, sino también **métodos adicionales** propios.

# Explicaciones visuales

![Image](/assets/img/posts/OOP/Pasted image 20250219145037.png)

![Image](/assets/img/posts/OOP/Pasted image 20250219145206.png)

![Image](/assets/img/posts/OOP/Pasted image 20250219145338.png)

 