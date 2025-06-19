---
title: Diagramas UML
date: '2023-06-15 11:17:32'
comments: true
categories: [Software Engineering]
tags:  [uml, diagramas, modelado, diseño]
---
 


Mecanismos generales de UML para agregar informacion adicional
- Adornos : agregan semanticas al elemento
- Notas : ya que  no todo se puede definir con UML y puede ser colocado en cualquier lugar del diagrama
- Estereotipos : mecanismos para extender el lenguaje UML y agregar info extra a los elementos del diagraa.
Diagramas : es una proyeccion de un sistema, son utilizados para representar distintas perspectivas de un sistema. 
 

*Diseño orientado a objetos con UML* :  
1. Vistas: 
- logica
- componentes
- despliegue



#  De clases
Terminos clave:
- Expertos en el dominio del problema
- Clases
- objetos
- propiedades
- comportamiento

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031125445.png)

Es consideratdo estatico, debido a que su estructura siempre es valida en cualquier punto del ciclo de vida del sistema.
Cubren la vista de diseño estatica la cual soporta principalmente los req funcionales de un sistema.
normalmente se usaran en 3 formas:
1. Para modelar el vocabulario de un sistema : para saber que cae dentro o fuera de los limites del sistema.
2. Para modelar un esquema logico de una BD


Se puede definir una clase como la descripcion de un tipo de objeto, siendo estos ultimos la instancia que se origina a partir de una clase. La clase define propiedades y comportamientos de los objetos. 
Las clases deberian ser identificadas por Expertos en el dominio del problema, sin embargo existen interrogantes que favorecen en facilitar la identificacion :
1. Existe informacion que deba ser almacenada o analizada? en cualquiera de esos casos, es posible candidata para una clase
2. Existen sistemas externos al que estamos modelando? 
3. Existen clases de bibliotecas, componentes o modelos externos que seran utilizados por el sistema a modelar? 
4. Cual es el papel de los actores dentro del sistema? En algunos casos, el papel podria ser visto como una clase, al hablar de papel, me refiero a "usuario" o "operador" o "clientes", entre otros mas

Se puede dar otro caso, uno no tiene idea del sistema, pero cuenta con un texto, en tal caso, se debe buscar y analizar los sustantivos presentes en el texto, se busca obtener ideas iniciales como consecuencia de ello.
Respecto a los terminos "extraer" o "coger" el autor sugiere omitirlos, ya que no realizamos eso;  coger los requisitos y clases necesarias como si existieran y estuvieran ocultas de cierta forma, en cambio recomienda utilizar el termino "deducir" con el sentido de descubrir y describir. Respecto a las clases, decidimos las que el sistema debe contener para que asi satisfaga las necesidades y si no cumplen los requisitos, entonces las modificamos para que lo hagan.
El autor tambien sugiere que es un proceso creativo, refiriendose a creativo con un proceso creativo metodico e incluso cientifico. 

Recomienda realizar la identificacion por medio de los requisitos, asi mismo, las relaciones entre estos. "Los datos son el corazon del sistema" 

Paquetes: Clases agrupadas por caracteristicas similares


https://introduccionalacomputacion.wordpress.com/92-2/ 

RELACIONES
- Generalizacion : 
- Especialización : una clase es una especialización de otra clase 
- Dependencia : (una clase depende o utiliza otra clase)
- Asociacion :  navegabilidad(bi/unidireccional)
	- Asociacion normal: linea continua, flecha, nombre, multiplicidad, verbo en voz pasiva y activa
![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031112543.png) 

- Asociacion Recursiva:  representa semanticamente la conexion entre 2 objetos
![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031112617.png) 

- Asociacion Cualificada:  el identificador se representa como la caja pequeña en el extremo de la asociacion junto a la clase donde la navegacion debe hacer. https://www.ctr.unican.es/asignaturas/mc_oo/doc/m_estructural.pdf 
![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031113020.png) 

- Asociacion Exclusiva: Line discontinua entre las asociaciones con `{o} `. es una restriccion en 2 o mas asociaciones. puede participar   

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031113308.png) 

- Asociacion ordenada: util en casos como querer que las ventanas de un sistemas tengan que ser ordenadas en la pantalla. utiliza `{ordenada}` entre las clases

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031113537.png) 

- Asociacion de clase: sirve para agregar informacion adicional a la asociacion existente.  Utilizada en las relaciones muchos a muchos

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031113646.png) 

- Asociacion terciaria : utiliza un diamante para asociar mas de 2 clases entre si.
la asociación terciaria especifica que un cliente puede
tener uno o más contratos y cada contrato contendrá una o varias reglas
contractuales. 

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031113728.png)

-  Agregacion : una de las clases es contenida por la otra. `consiste en, contiene, es parte de` son palabras para identificar este tipo de relacion. tiene 2 tipos
 ![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031113928.png)

-  Agregacion compartida:  Se dice cuando una de las clases es una parte o está contenida en la otra, pero esta parte puede estar contenida en la otra varias veces en el mismo momento.

una persona puede ser miembro de un Tiempo (equipo) o varios Tiempos en un momento dado
![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031114232.png) 


-  Agregacion de composicion : es un tipo de agregacion donde una clase que se encuentra en otra `vive` y conforma o constituye la otra. Es decir, si se destruye la clase que las contiene, las clases de `agregacion de composicion` tambien se destruiran al mismo tiempo.
![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031114058.png) 

- Las generalizaciones :  es relacion entre un elemento general y uno o mas especificos. los ultimos, contiene todas las caracteristicas del general y sus propias caracteristicas tambien. 
Tipos:
Normal
Restringida: compuesta por superposicion, disyuntiva, completa e incompleta

- Generalizacion normal : 
![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031120740.png)

- Generalizacion restringida : indica como la generalizacion se debe utilizar y ampliar en el futuro. 
- Generalizacion restringida de superposicion y disyuntiva: 
	- superposicion o solapado : significa que las subclaes que heredan de una subclase por solapamiento, puede heredar de mas de una subclase.
	- disyuntiva:  lo contrario

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031121136.png)

- Generalizacion restringida completa e incompleta : 
	- completa : significa que todas las subclaes fueron especificadas y no hay la posibilidad de otra generalizacion a partir de ese punto
	- incompleta : lo contrario

![Image](/assets/img/posts/UMLdiagramas/Pasted image 20241031121153.png)


Estereotipos: UML tiene incorporados unos, pero tambien podemos inventarnos unos.


| Estereotipo     | Aplicado a | significado                                                                                 |
| --------------- | ---------- | ------------------------------------------------------------------------------------------- |
| `<<Metaclass>>` | Clase      | las instancias de esta clase tambien son clases                                             |
| `<<Utility>>`   | Clase      | La clase es una colecion de metodos estaticos y no hace falta instanciarla por consiguiente |
| `<<Create>>`    | Operacion  | indica que la operacion es un constructor                                                   |
| `<<Destroy>>`   | Operacion  | es un destructor                                                                            |





#  De objetos



#  de actividad



#  de estados



#  de secuencia



#  de colaboracion



#  de casos de uso



#  de paquetes



#  de ejecucion



#  de componentes



#  de distribucion



#  de comportamiento



#  de comunicacion



#  de interaccion



#  de robustez o (MON Modelo objeto del negocio)






