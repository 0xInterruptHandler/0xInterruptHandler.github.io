---
title: C Sharp Basico
date: '2023-06-15 11:17:32'
comments: true
categories: [Programming]
tags: [c#, programación, dotnet]
---


C# (C sharp) es un lenguaje de programación desarrollado por Microsoft que se utiliza en una variedad de aplicaciones y plataformas. Lugares comunes donde se suele utilizar C#:

1. **Desarrollo de aplicaciones de escritorio:** C# es ampliamente utilizado para desarrollar aplicaciones de software que se ejecutan en computadoras de escritorio con Windows. Esto incluye aplicaciones empresariales, herramientas de productividad, juegos y software de consumo.

2. **Desarrollo de aplicaciones web:** Con el framework ASP.NET, C# se utiliza para construir aplicaciones web robustas y escalables. ASP.NET ofrece un entorno de desarrollo completo que permite la creación de sitios web dinámicos, servicios web y aplicaciones web de alto rendimiento.

3. **Desarrollo de aplicaciones móviles:** A través de Xamarin, C# se utiliza para desarrollar aplicaciones móviles multiplataforma para iOS y Android. Xamarin permite compartir código entre plataformas, lo que facilita el desarrollo y el mantenimiento de aplicaciones móviles nativas utilizando C#.

4. **Desarrollo de juegos:** En la industria del desarrollo de videojuegos, C# es uno de los lenguajes más populares. Se utiliza con frameworks como Unity, que es una plataforma líder para la creación de juegos en 2D y 3D. Unity utiliza C# como su lenguaje de scripting principal.

5. **Desarrollo de servicios y APIs:** C# es utilizado para desarrollar servicios web, APIs (interfaces de programación de aplicaciones) y servicios de backend en general. Esto incluye servicios RESTful, microservicios y otros tipos de servicios que son fundamentales para la comunicación entre aplicaciones y la gestión de datos.

6. **Desarrollo de aplicaciones empresariales:** Muchas empresas eligen C# para desarrollar aplicaciones empresariales debido a su soporte robusto, seguridad y facilidad de integración con otras tecnologías de Microsoft, como SQL Server y Azure.

En resumen, C# es versátil y se utiliza en una amplia gama de aplicaciones y entornos de desarrollo, desde aplicaciones de escritorio y web hasta juegos y servicios backend, especialmente en el ecosistema de Microsoft y más allá, gracias a herramientas como Xamarin y Unity.


# 0. Miscelaneo
## 0.1 Manipulacion de Strings

```csharp
string.Concat(); //Combina multiples cadenas
string.Join(); // Une (Join) elementos con un separador
str.Split(); //divide una cadena segun un limitador
str.ToUpper(); // conversion a mayusculas
str.ToLower(); // conversion a minusculas
str.Trim(); // remueve espacios en blanco de adelante y atras
str.Substring(); // permite extraer una porcion de cadena
```

## 0.2 Entrada y salida en consola

```c#
using System;

class Program
{
    static void Main()
    {
        // Obtener entrada del usuario
        Console.WriteLine("Ingrese su nombre:");
        string nombre = Console.ReadLine();

        Console.WriteLine("Ingrese su edad:");
        int edad = Convert.ToInt32(Console.ReadLine());

        // Mostrar salida por consola
        Console.WriteLine("\n¡Hola, " + nombre + "! Usted tiene " + edad + " años.");

        // Ejemplo de salida formateada con interpolación de cadenas
        Console.WriteLine($"\n¡Hola, {nombre}! Usted tiene {edad} años.");

        // Esperar a que el usuario presione una tecla para salir
        Console.WriteLine("\nPresione cualquier tecla para salir...");
        Console.ReadKey();
    }
}
```

## 0.3 interpolacion de cadenas
```c#

        // Variables para interpolación
        string nombre = "Juan";
        int edad = 30;
        double altura = 1.75;

        // Ejemplo de interpolación de cadenas
        Console.WriteLine($"Hola, mi nombre es {nombre}, tengo {edad} años y mido {altura} metros.");

        // Otra forma de interpolación con expresiones dentro de las llaves
        Console.WriteLine($"El próximo año cumpliré {edad + 1} años.");

```


## 0.4 Fecha y tiempo

```csharp
DateTime actual = DateTime.Now; // obtiene la fecha y tiempo actual
current.AddDays(1); // agrega un dia a la fecha actual
current.ToShortDateString(); //convierte la fecha a un formato corto
Console.WriteLine(actual);
```



# 1. Estructura Básica

 Cada programa en C# utiliza esta estructura fundamental. Forma el esqueleto de tu aplicación. 
 El archivo` Program.cs` es la base de la mayoría de los tipos de proyectos en C#.
```c#

using System; // 'using' permite un acceso más fácil a los tipos dentro de un espacio de nombres.

namespace TuNamespace // Los espacios de nombres organizan el código y previenen colisiones de nombres.
{
    class TuClase // Una 'clase' define el plano de los objetos.
    {
        static void Main(string[] args) // 'Main' es donde comienza la ejecución del programa.
        {
            Console.WriteLine("¡Hola, Mundo!"); // Muestra texto en la consola.
        }
    }
}

```


# 2. Tipos de datos

| Tipo de dato   | Descripción                                               |
|----------------|-----------------------------------------------------------|
| bool           | Almacena un valor booleano: true o false.                  |
| byte           | Almacena valores enteros sin signo de 8 bits.             |
| sbyte          | Almacena valores enteros con signo de 8 bits.             |
| short          | Almacena valores enteros con signo de 16 bits.            |
| ushort         | Almacena valores enteros sin signo de 16 bits.            |
| int            | Almacena valores enteros con signo de 32 bits.            |
| uint           | Almacena valores enteros sin signo de 32 bits.            |
| long           | Almacena valores enteros con signo de 64 bits.            |
| ulong          | Almacena valores enteros sin signo de 64 bits.            |
| float          | Almacena números de punto flotante de precisión simple.   |
| double         | Almacena números de punto flotante de precisión doble.    |
| decimal        | Almacena números decimales de alta precisión.             |
| char           | Almacena un solo carácter Unicode.                        |
| string         | Almacena una secuencia de caracteres Unicode.             |

# 3. Variables

- Se utiliza `var` cuando el tipo de dato es evidente a partir del valor inicial y usar `var` no compromete la legibilidad o entendimiento del código. Aquí hay algunos puntos a considerar. Aunque se recomienda no hacer uso excesivo de `var`. 
```c#
int intNumero = 9;
long longNumero = 9999999;
float floatNumero = 9.99F;
double doubleNumero = 99.999;
decimal decimalNumero = 99.9999M;
char letra = 'D';
bool @bool = true;
string sitio = "arcegonzalez.github.io";
// utilizando "var"
var numero = 999;
var cadena = "999";
var booleano = false;
```

# 4. Constantes

- Las constantes son valores que no cambian. Una vez que les asignas un valor, ese valor permanece fijo y no puede ser modificado. Esto garantiza que ciertos datos mantengan su consistencia a lo largo de su uso.

```csharp
//la siguiente variable siempre tendra el valor 20
const int NumeroConstante = 20; 
```

# 5. Condicionales

```c#
if (condición)
{
    // Se ejecuta si 'condición' es verdadera.
}
else if (otraCondición)
{
    // Condiciones adicionales si las anteriores fallan.
}
else
{
    // Se ejecuta si ninguna condición se cumple.
}

switch (variable)
{
    case valor1:
        // Código para valor1
        break; // Sale del bloque switch.
    // ... otros casos ...
    default:
        // Se ejecuta si ningún caso anterior coincide.
        break;
}

```


# 6. Bucles 

```c#
// 1 BUCLE FOR
for (int i = 0; i < 10; i++)
{
    // Se ejecuta 10 veces, incrementando 'i' en cada iteración.
}

// 2 BUCLE FOR EACH
foreach (var item in colección)
{
    // Itera sobre cada elemento en 'colección'.
}
// 3 BUCLE WHILE
while (condición)
{
    // Continúa iterando mientras 'condición' sea verdadera.
}
// 4 BUCLE DO WHILE
do
{
    // Se ejecuta al menos una vez antes de verificar 'condición'.
} while (condición);

```


# 7. Arreglos (Arrays)

```c#
char[] chars = new char[10];
chars[0] = 'a';
chars[1] = 'b';

string[] letters = {"A", "B", "C"};
int[] mylist = {100, 200};
bool[] answers = {true, false};

```

### Ejemplo : Arrays y Loops (Bucles)

```c#
using System;

class Program
{
    static void Main()
    {
        // Declaración e inicialización de un array de enteros
        int[] numeros = new int[5]; // Array de tamaño 5

        // Asignación de valores al array
        numeros[0] = 10;
        numeros[1] = 20;
        numeros[2] = 30;
        numeros[3] = 40;
        numeros[4] = 50;

        // Acceso e impresión de elementos del array
        Console.WriteLine("Elementos del array:");
        for (int i = 0; i < numeros.Length; i++)
        {
        // uso de "Cadenas de interpolacion"
        // $"" = se llama "cadena de interpolacion"
        // numeros[{i}] = interpola el interador {i}
        // {numeros[i]} = interpola el valor de la ubicacion actualde literador 
            Console.WriteLine($"numeros[{i}] = {numeros[i]}");
        }

        // Declaración e inicialización de un array de cadenas
        string[] nombres = { "Juan", "María", "Carlos", "Ana" };

        // Acceso e impresión de elementos del array de cadenas
        Console.WriteLine("\nNombres en el array:");
        foreach (var nombre in nombres)
        {
            Console.WriteLine(nombre);
        }
    }
}
```



# 8. Listas


```c#
using System.Collections.Generic;

// Declaración e inicialización de una lista de enteros
List<int> lista = new List<int>() { 1, 2, 3, 4, 5 };

// Acceso e impresión de elementos de la lista
Console.WriteLine("Elementos de la lista:");
//una lista es considerada una coleccion, por lo tanto puede ser usada en el bucle "foreach"
foreach (var numero in lista)
{
    Console.WriteLine(numero);
}
```

# 9. diccionarios

```c#
using System.Collections.Generic;

// Declaración e inicialización de un diccionario
Dictionary<string, int> dict = new Dictionary<string, int>()
{
    {"one", 1}, // "one" es la clave, 1 es su valor asociado.
    {"two", 2}
};

// Acceso e impresión de elementos del diccionario
Console.WriteLine("Elementos del diccionario:");
foreach (var kvp in dict)
{
    Console.WriteLine($"Clave: {kvp.Key}, Valor: {kvp.Value}");
}

```


# 10. Metodos 

- los metodos encapsulan logica, permiten la reusabilidad del codigo y evitan tener que repetir partes del codigo

```c#
// Definición de un método en C#
public int Sum(int a, int b)
{
    // Cuerpo del método: suma dos números enteros y devuelve el resultado
    return a + b;
}

class Program
{
    static void Main()
    {
        // Uso del método Sum
        int resultado = Sum(5, 3);
        Console.WriteLine("La suma de 5 y 3 es: " + resultado);
    }
}
```


# 11. Clases

```c#
using System;

// Definición de la clase Persona
public class Persona
{
    // Propiedades de la clase Persona
    public string Nombre { get; set; }
    public int Edad { get; set; }

    // Constructor de la clase Persona
    public Persona(string nombre, int edad)
    {
        Nombre = nombre;
        Edad = edad;
    }

    // Método de instancia para imprimir información de la persona
    public void MostrarInformacion()
    {
        Console.WriteLine($"Nombre: {Nombre}, Edad: {Edad}");
    }
}

class Program
{
    static void Main()
    {
        // Creación de objetos de la clase Persona
        Persona persona1 = new Persona("Juan", 30);
        Persona persona2 = new Persona("María", 25);

        // Acceso a las propiedades de los objetos
        Console.WriteLine("Información de la persona 1:");
        persona1.MostrarInformacion();

        Console.WriteLine("\nInformación de la persona 2:");
        persona2.MostrarInformacion();
    }
}

```

### Ejemplo con Getters y Setters
- los metodos Getters y Setters permiten la encapsulacion de los datos en las clases, el siguiente codigo es una implementacion sencilla 


```c#
using System;

// Definición de la clase Persona
public class Persona
{
    // Campos privados
    private string nombre;
    private int edad;

    // Propiedad Nombre con getter y setter
    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    // Propiedad Edad con getter y setter
    public int Edad
    {
        get { return edad; }
        set
        {
            if (value > 0 && value < 150) // Validación básica de la edad
                edad = value;
            else
                Console.WriteLine("Edad no válida.");
        }
    }

    // Constructor de la clase Persona
    public Persona(string nombre, int edad)
    {
        Nombre = nombre; // Llama al setter de la propiedad Nombre
        Edad = edad;     // Llama al setter de la propiedad Edad
    }

    // Método de instancia para imprimir información de la persona
    public void MostrarInformacion()
    {
        Console.WriteLine($"Nombre: {Nombre}, Edad: {Edad}");
    }
}

class Program
{
    static void Main()
    {
        // Creación de objetos de la clase Persona
        Persona persona1 = new Persona("Juan", 30);
        Persona persona2 = new Persona("María", 25);

        // Acceso a las propiedades utilizando getter y setter
        persona1.Edad = 31; // Utiliza el setter de Edad
        persona2.Nombre = "Ana"; // Utiliza el setter de Nombre

        // Acceso a las propiedades para mostrar información
        Console.WriteLine("Información de la persona 1:");
        persona1.MostrarInformacion();

        Console.WriteLine("\nInformación de la persona 2:");
        persona2.MostrarInformacion();
    }
}

```

La sintaxis siguiente podria resumirse asi:
```
    public string NombreAtributoClase
    {
        get { return NombreAtributoClase; }
        //opcionalmente se aplicaria logica al SET
        set { NombreAtributoClase = VALOR; }
    }
```



# 12 . Manejo de errores

```csharp
try
{
    //Aqui iria el codigo que podria mostrar una Excepcion
}
// Catch = Atrapar
// y en efecto, estsa parte "atrapa" excepciones del codigo del bloque "try"
catch (SpecificException ex) 
{
    // Aqui se manejaria el error especifico
}
finally
{
    // Se ejecuta independientemente de si se ha lanzado una excepción.
}
```

# 13. Generics

Los generics permiten escribir clases, interfaces y métodos que trabajan con tipos específicos sin especificarlos de antemano. Esto promueve la reutilización del código y aumenta la seguridad de tipos.
-  permiten crear componentes reutilizables que pueden trabajar con tipos específicos sin tener que repetir código para cada tipo diferente.

```csharp
using System;

// Definición de una clase genérica
public class MiColeccion<T>
{
    private T[] array; // Un arreglo de tipo T

    public MiColeccion(int size)
    {
        array = new T[size];
    }

    // Método para añadir elementos al arreglo
    public void AgregarElemento(int index, T value)
    {
        array[index] = value;
    }

    // Método para obtener un elemento del arreglo
    public T ObtenerElemento(int index)
    {
        return array[index];
    }
}

class Program
{
    static void Main()
    {
        // Crear una instancia de MiColeccion para enteros
        MiColeccion<int> enteros = new MiColeccion<int>(5);
        enteros.AgregarElemento(0, 10);
        enteros.AgregarElemento(1, 20);
        enteros.AgregarElemento(2, 30);

        Console.WriteLine("Elemento en el índice 1: " + enteros.ObtenerElemento(1));

        // Crear una instancia de MiColeccion para cadenas
        MiColeccion<string> cadenas = new MiColeccion<string>(3);
        cadenas.AgregarElemento(0, "Hola");
        cadenas.AgregarElemento(1, "Generics");
        cadenas.AgregarElemento(2, "en C#");

        Console.WriteLine("Elemento en el índice 2: " + cadenas.ObtenerElemento(2));

        // Ejemplo con un tipo de dato personalizado
        // Supongamos que tenemos una clase Persona
        MiColeccion<Persona> personas = new MiColeccion<Persona>(2);
        personas.AgregarElemento(0, new Persona("Juan", 30));
        personas.AgregarElemento(1, new Persona("María", 25));

        Console.WriteLine("Datos de la persona en el índice 0: " + personas.ObtenerElemento(0));

        Console.ReadLine();
    }
}

// Ejemplo de una clase Persona para el último caso
public class Persona
{
    public string Nombre { get; set; }
    public int Edad { get; set; }

    public Persona(string nombre, int edad)
    {
        Nombre = nombre;
        Edad = edad;
    }

    public override string ToString()
    {
        return $"Nombre: {Nombre}, Edad: {Edad}";
    }
}
```

### Explicación del código:

1. **Clase `MiColeccion<T>`**: Esta es una clase genérica que puede almacenar elementos de cualquier tipo `T`. Se inicializa con un arreglo de tamaño especificado y tiene métodos para agregar y obtener elementos.

2. **Métodos `AgregarElemento` y `ObtenerElemento`**: Permiten agregar elementos a la colección y obtener elementos de la colección, respectivamente.

3. **Uso en el método `Main`**:
   - Se crean instancias de `MiColeccion` para diferentes tipos (`int`, `string` y `Persona`).
   - Se agregan elementos específicos a cada instancia.
   - Se muestra cómo obtener y usar estos elementos de la colección genérica.

4. **Clase `Persona`**: Es un ejemplo de un tipo de dato personalizado que puede ser utilizado con la clase genérica `MiColeccion`.

# 14. Interfaces

 Las interfaces permiten definir un conjunto de métodos y propiedades que una clase debe implementar si quiere cumplir con esa interfaz. Esto promueve la abstracción y el diseño orientado a interfaces en el código.

SINTAXIS:
```
//crear interfaz
Acceso interface Inombre{
	tipo Nombre();
	...
}
//implementar interfaz en una clase
class NombreClase : InombreInterfaz{ 
... metodos de la interfaz implementados... }

```


```csharp
using System;

// Definición de una interfaz
public interface IVehiculo
{
    void Arrancar();
    void Detener();
    double ObtenerVelocidad();
}

// Clase que implementa la interfaz IVehiculo
public class Coche : IVehiculo
{
    private double velocidad;

    public void Arrancar()
    {
        Console.WriteLine("El coche ha arrancado.");
        velocidad = 0;
    }

    public void Detener()
    {
        Console.WriteLine("El coche se ha detenido.");
        velocidad = 0;
    }

    public double ObtenerVelocidad()
    {
        return velocidad;
    }

    public void Acelerar(double incremento)
    {
        velocidad += incremento;
        Console.WriteLine($"Acelerando. Velocidad actual: {velocidad} km/h");
    }
}

class Program
{
    static void Main()
    {
        // Crear una instancia de Coche
        Coche miCoche = new Coche();

        // Utilizar métodos de la interfaz IVehiculo
        miCoche.Arrancar();
        miCoche.Acelerar(50);
        Console.WriteLine("Velocidad actual: " + miCoche.ObtenerVelocidad() + " km/h");
        miCoche.Detener();

        Console.ReadLine();
    }
}
```

### Explicación del código:

1. **Interfaz `IVehiculo`**:
   - Define métodos que cualquier vehículo debe implementar: `Arrancar`, `Detener` y `ObtenerVelocidad`.

2. **Clase `Coche`**:
   - Implementa la interfaz `IVehiculo`, asegurándose de que implementa todos los métodos definidos en la interfaz.
   - Tiene un campo `velocidad` para mantener el estado actual del coche.
   - Además de los métodos requeridos por la interfaz, tiene un método adicional `Acelerar` que no es parte de la interfaz pero que extiende el comportamiento de la clase.

3. **Uso en el método `Main`**:
   - Se crea una instancia de `Coche`.
   - Se invocan los métodos de la interfaz (`Arrancar`, `Acelerar`, `ObtenerVelocidad`, `Detener`) para demostrar cómo funciona la implementación de la interfaz en la clase `Coche`.

### Importancia de las interfaces en C#:

- Las interfaces permiten la implementación de la abstracción y el polimorfismo, ya que una clase puede implementar múltiples interfaces.
- Facilitan la interoperabilidad y la reutilización del código, ya que las clases que implementan la misma interfaz pueden ser tratadas de manera similar sin importar la implementación subyacente.
- Son fundamentales en el desarrollo orientado a objetos y son una herramienta clave para la separación de preocupaciones y el diseño modular.

En resumen, las interfaces en C# son una herramienta poderosa para definir contratos que las clases deben cumplir, promoviendo un código más mantenible y flexible.





# Otros  recursos utiles
- https://github.com/LabinatorSolutions/csharp-cheat-sheet?tab=readme-ov-file#c-data-types 
- https://zerotomastery.io/cheatsheets/csharp-cheat-sheet/ 
- https://quickref.me/cs.html
