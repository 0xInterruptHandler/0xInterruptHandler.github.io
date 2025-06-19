---
title: Patrones de Diseño
date: '2025-02-18 11:17:32'
comments: true
categories: [Programming]
tags: [patrones-diseño, programación, arquitectura]
---

 
**Patrones de Diseño**

# **Patrones Estructurales**  
Ayudan a gestionar cómo se organizan las clases.

- **Comando**  
  Permite encapsular solicitudes como objetos, lo que permite parametrizar clientes con diferentes solicitudes. Se utiliza en paneles de interfaz de usuario (acciones).

- **Intérprete**  
  Define la gramática de un lenguaje y puede interpretarlo. Por ejemplo, determinar la ciudad más al sur dado un conjunto de ellas.

- **Iterador**  
  Mecanismo para acceder a elementos agregados sin exponer su representación (siguiente/tieneSiguiente/eliminar).

- **Mediador**  
  Es un objeto que encapsula cómo interactúan un conjunto de objetos. Promueve un acoplamiento débil evitando que los objetos se refieran entre sí.

- **Flyweight (Peso Ligero)**  
  Es una clase de fábrica que permite crear múltiples objetos, almacenando en caché los que ya se han creado para evitar tener que recrearlos (por ejemplo, en un mapa).

- **Proxy**  
  Proporciona un marcador de posición para controlar el acceso a un objeto. Esto es útil si no deseas modificar el objeto en sí. Por ejemplo, un método que consume mucho tiempo puede ejecutarse en un hilo del proxy.

---

# **Patrones de Comportamiento**  
Ayudan a gestionar lo que realmente hacen las clases.

- **Cadena de Responsabilidad**  
  Cada elemento de la cadena realiza una pequeña tarea y delega al siguiente.

- **Adaptador**  
  Convierte una interfaz dada en otra interfaz.

- **Puente**  
  Separa la abstracción de la implementación para que puedan variar de manera independiente.

- **Compuesto**  
  Objetos diferentes que deben ser tratados de manera similar.

- **Decorador**  
  Añade responsabilidades adicionales a un objeto de manera dinámica.

- **Fachada**  
  Una interfaz de alto nivel que agrupa un conjunto de interfaces para facilitar el trabajo del código del cliente.

- **Constructor**  
  Separa la construcción de un objeto complejo de su representación.

- **Fábrica**  
  Interfaz para crear un objeto, dejando que las subclases decidan cuál.

- **Prototipo**  
  Cuando crear nuevas instancias es costoso, puedes extender la interfaz clonable y usar una instancia única que puedas clonar.

- **Singleton (Instancia Única)**  
  Una clase que tiene una única instancia.

---

# **Patrones Creacionales**  
Facilitan la creación de otras clases.

- **Fábrica Abstracta**  
  Crea familias de objetos relacionados sin especificar clases concretas.

- **Fábrica Simple**  
  Delegar la instanciación de objetos a una clase específica, útil cuando la creación del objeto es compleja (estrategias/estados/...).

- **Objeto Nulo**  
  Implementación específica y vacía de una interfaz, que no proporciona comportamiento, utilizada para evitar tener que verificar objetos nulos reales.

- **Patrón Curiosamente Recursivo Genérico**  
  Una clase base de constructor puede mantener un tipo genérico, limitado a su tipo. Las subclases pueden pasar su tipo para que los métodos de construcción dentro de la clase base devuelvan el subtipo correcto.  

```
 Clase Builder<T extends Builder>  
  T withFoo(foo)  
  return (T) this;  
  Clase SubBuilder extiende Builder<SubBuilder> 
```

---

# **Patrones de Concurrencia**  
Facilitan el manejo de hilos.

- **Bloqueo Doble Comprobado**  
  Reduce la contención de bloqueos al probar el criterio de bloqueo sin adquirir el bloqueo, y si la prueba es exitosa, se vuelve a comprobar después de adquirir el bloqueo.

# Design Patterns VS Patrones de arquitectura

 ![Image](/assets/img/posts/DesignPatterns/Pasted image 20250219143447.png)

 ![Image](/assets/img/posts/DesignPatterns/Pasted image 20250219143508.png)

- la palabra arquitectura es una palabra muy compleja para referirse en este contexto a como se organizan los archivos
- una arquitectura es darle forma o estructura al software por como se separan sus modulos o carpetas 
- que son reglas sobre como conectar o dividir componentes (componentes = archivos, scripts, servicios, microservicios, etc que haga que el sistema funcione )
	- es por ello que se suele usar sinonimos como estructura o disenio para la palabra arquitectura

(Arquitectura de software -> Estructura y Diseno)

- ejemplos de arquitecturas: clean y hexagonal
	- no dejan de ser reglas sobre como organizar las carpetas dentro de un proyecto 
- Ejemplo sin usar ninguna de las 2 arq mencionadas anteriormente:
	- se realizara una aplicacino sobre X cosa, lo primero que se deberia definir son las reglas de negocio las cuales no tienen que ver con nada tecnico ("reglas de negocio" =  son la identidad de la aplicacion, "son las que hacen que mi app sea mi app" por asi decirlo, "definen el rumbo de la aplicacion")
 
```
Aplicacion sobre X:
|_> Reglas de negocio:
|__> Regla 1
|__> Regla N

```
- luego de contar con reglas del negocio, el siguiente paso seria dividir la aplicacion en componentes, como se ve en la siguiente imagen (cada componente deberia solucionar una de las reglas del negocio)
- luego de definir los componentes anteriores, es necesario definir las relaciones logicas entre los componentes.
	- Ejemplo de como seria en este caso dado de ejemplo : el modulo para "validar curso" depende del modulo "subir curso" y este a su vez de "validar usuarios" que a su vez necesitaria del modulo "registrar"

### Ejemplo

Aplicación sobre una **plataforma de aprendizaje en línea**:

```
Aplicación sobre plataforma de aprendizaje:
|_> Reglas de negocio:
|__> Los cursos deben ser validados antes de ser publicados.
|__> Los usuarios deben registrarse para acceder al contenido.
|__> Los cursos deben permitir interacción entre estudiantes y tutores.

```

### División de componentes:
1. **Módulo de registro de usuario**: Gestiona el proceso de creación de cuentas.
2. **Módulo de subida de cursos**: Permite a los tutores subir contenido de los cursos.
3. **Módulo de validación de cursos**: Revisa si el contenido cumple con los requisitos antes de ser publicado.
4. **Módulo de interacción**: Facilita la comunicación entre estudiantes y tutores.

### Relaciones lógicas entre componentes:
- **Módulo de validación de curso** depende del **módulo de subir curso**.
- **Módulo de subir curso** depende del **módulo de validación de usuarios**.
- **Módulo de validación de usuarios** depende del **módulo de registro**.



# Resumen

1. **Arquitectura de Software:**
    - Se enfoca en la estructura general del sistema a un nivel alto.
    - Define cómo están organizados y conectados los componentes del sistema.
    - Ejemplo: En un centro comercial, la arquitectura sería la disposición física de las tiendas, los baños, los accesos, etc.
2. **Diseño de Software:**
    - Se concentra en cómo funcionan internamente los componentes del sistema.
    - Define cómo interactúan los módulos y cómo se implementan las funcionalidades específicas.
    - Ejemplo: En un centro comercial, el diseño sería cómo funciona el sistema de aire acondicionado, la gestión de accesos de seguridad, etc.
3. **Relación entre ambos:**
    - La arquitectura es más abstracta y define la estructura y las capas del sistema.
    - El diseño es más detallado y se centra en cómo se implementan las funcionalidades y las interacciones entre los componentes.
4. **Uso de patrones de diseño:**
    - El diseño de software incluye el uso de patrones de diseño como estrategia, que definen comportamientos específicos y estructuras de datos para implementar funcionalidades complejas.

En resumen, la arquitectura y el diseño de software son complementarios pero diferentes en su enfoque y nivel de detalle, siendo ambos fundamentales para desarrollar sistemas robustos y mantenibles.