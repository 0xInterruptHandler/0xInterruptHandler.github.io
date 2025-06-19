---
title: EnterPriseArchitect Guia y trucos adicionales
date: '2024-07-16 11:17:32'
comments: true
categories: [Software Engineering]
tags:  [arquitectura, diseño-software]
---

 
# Enterprise Architect
## Diagrama de componentes
LOS ESTEREOTIPOS SON OPCIONALES
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240702103212.png)
## Diagrama de despliegue
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240702103220.png)

## Creacion de "Pantalla" con EA
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240702103601.png)


 # 1 DIAGRAMA de casos de uso en enterprise architect

## CUN Y MON objetos de negocio
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121842.png)    

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121910.png)

### DIAGRAMA MON 
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706122005.png)
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706122206.png)

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706122247.png)
Ejemplo hecho en clase:
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706122311.png)
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706122320.png)

# 2 DIAGRAMA DE ACTIVIDAD

1. no se utilizan preguntas en los rombos de decisiones, sino se utilizan las respuestas a dicha decisión encima de las flechas que salen de dicho rombo
    1. ejemplo:
        1. flecha 1 : esta listo
        2. flecha 2 : no esta listo
        3. lo anterior estaría encima de cada linea que sale del rombo, y no se utilizarán preguntas nunca según la sintaxis correcta de UML
2. de una actividad solo puede salir una flecha y a una actividad solo le puede llegar una sola flecha, para ello se usa una barra de sincronización con el fin de que solo le llegue una flecha

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706122456.png)


# 3 DIAGRAMA  de clases en enterprise architect
```
Los adornos son opcionales y dependen del disenador

el adorno de rol o funcion se pone unicamente cuando hay duda, no hay una regla de leer izquierda oderecha, sino por el que tiene sentido logico.
```

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121404.png)

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121457.png)

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121509.png)

### diagrama de ejemplo:
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121520.png)


# Diagrama de caso de uso hacia diagrama de secuencia
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706120743.png)

![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121020.png)
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121029.png)


### ejemplos
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121046.png)
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240706121144.png)





# Trucos EA
## Dark mode
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240709230418.png)


## Mostrar nombre del parametro en un diagrama de clases
https://stackoverflow.com/questions/3276399/enterprise-architect-sparx-systems-add-parameter-name-and-type-in-parameter 
```
diagram -> properties -> features -> show parameter detail -> (full)
```
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240710090658.png)

## Flecha navegable y multiplicidad
en el mismo recuadro de "Roles" tambien puedes configurar la multiplicidad de ambos extremos de la asociacion
![Image](/assets/img/posts/ENTERPRISEarchitect/Pasted image 20240710092047.png)




















