---
title: Recomendaciones y trucos formularios en netbeans (Apuntes)
date: '2023-10-19 11:17:32'
comments: true
categories: [Java Development]
tags:  [java, netbeans, forms, gui, desarrollo]
mermaid: true
---

 

# Recomendaciones y trucos formularios en netbeans
 
# Mini cheatshet

### mostrar mensaje GUI
```java
import javax.swing.JOptionPane;

JOptionPane.showMessageDialog(null, "Error");
```

### combo box y text fields
```java
// obtener infomracion de un text fields
String cod = txtCodigo.getText();
// obtener infomracion de un combo box
double sueldo = Double.parseDouble(txtSueldoBase.getText());
```

### funciones comunes para el metodo constructor del formulario JFRAME
```java
   //este vendria a ser el constructor
    public FrmEjemploOPP() {
        initComponents();
        // que aparesca en el centro de la pantaa
        setLocationRelativeTo(null);
        // logica de la aplicacion adicional (opcional)
        if (count == 0) {
                txtArea1.append("Bienvenido, aqui aparecera \n informacion del empleado \n siempre y cuando \n instancies un objeto");
        }
        // no se puede ajustar la pantalla
        this.setResizable(false);
      }
```

### codigo para boton para salir
```java
import javax.swing.JOptionPane;

JOptionPane.showMessageDialog(null, "Gracias por usar el programa");
 System.exit(0);
```

### CERRAR formulario usando label que actua como boton

```java
//usa esto en un evento de un label actuando como boton
dispose();
```
### FECHAS y TIEMPO
interacciones entre Clases
- Date
- SimpleDateFormat
- txtLael
    - `.setText();`   recibe como parametro un objeto SimpleDateFormat con el parametro `.format`  y este recibe el parametro
Por ultimo, para usarlo, lo llamas en el metodo de inicializacion, que cada formulario tiene 

```java
public void sDate() {
        Date d = new Date();
        SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy");
        jLabel2.setText(s.format(d));

    }
```

```java
public void sTime() {

        new Timer(0, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Date d = new Date();
                SimpleDateFormat s = new SimpleDateFormat("hh:mm:ss a");
                jLabel3.setText(s.format(d));
            }
        }
        ).start();
    }
```

### Colocar en el medio de la pantalla un formulario
Nota importante: asegurate de colocarlo en el constructor. 

el calculo es el siguiente, 

- obtener la dimension de la pantalla
- utilizar el metodo `.setLocation(X,Y);`
    - Siendo X : `size.width / 2 - getWidth() / 2`
    - y Y: `size.height/2 - getHeight()/2`

```java
import java.awt.Dimension;
import java.awt.Toolkit;

Toolkit toolkit = getToolkit();
Dimension size = toolkit.getScreenSize();
setLocation(size.width / 2 - getWidth() / 2, size.height / 2 - getHeight() / 2);
```

Alternativa:
```java
setLocationRelativeTo(null);
```

 

# Formularios JAVA
### Requisitos para Colocar Imagenes y GIF’s
Para conseguir un buen diseño UI en java usando formularios lo que se necesita es:

- Imagenes con el tamano correcto
- Labels : las imagenes o gif se colocan en la propiedad llamada `icon`
- GIF’s con el tamano correcto
	- buenas paginas:
		- https://giphy.com/
		- 

###  Lo que se puede lograr:
- colocar el logo de alguna empresa usando labels
- presentaciones con GIFs usando labels
- botones con diseños fuera de los comunes usando labels

###  opcion icon : colocar label como imagen o gif
![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled%201.png)

###  agregar un pequeno icono al costado de un texto. ejemplo:
colocas un label y no quitas el texto, simplemente lo deja s y lueg oagregas el icono
![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled%202.png)

### Convertir Labels en botones agregandole Eventos

Para conseguir ello se necesita agregar eventos utilizando la tabla de la izquierda haciendo clicks necesarios

![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled%203.png)

### Conseguir un efecto animado cada al estar encima del boton

para conseguir un efecto hover en un label que actua como boton necesitas:

- Un evento de tipo
    - mouseEntered: activamos el gif
    - mouseExisted : desactivamos el gif haciendo un cambio de recurso, cambiandolo por un png
- una imagen y un gif que coincidan en dimensiones para asi dar el efecto de animacion

interaciones entre clases

- label
    - `.setIcon()`  : metodo de label
- `new javax.swing.ImageIcon();`  recibira como parametro el icono o gif
- `getClass().getResource("ubicacionPNGoGIF")`  : va como parametro a ImageIcon

```java
private void jLabel2MouseExited(java.awt.event.MouseEvent evt) {                                    
        // TODO add your handling code here:
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/guest_btn_s.png")));
    }                                   

    private void jLabel2MouseEntered(java.awt.event.MouseEvent evt) {                                     
        // TODO add your handling code here:
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/gif-login-gue.gif")));
	   //opcional : jLabel2.setForeground(Color.black); 
	 }
```

![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled%204.png)

 
 

## Check Boxes

Interacciones:

- Methodo para usar un if
    - `.isSelected()`
- Metodo para convertir las passwords en visibles o no:
    - Visible = `txtpassword.setEchoChar((char)0);`
    - No visible (*) = `txtpassword.setEchocHAR('*');`

```java
private void jCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:
        if(jCheckBox1.isSelected()){
            password.setEchoChar((char)0);

        }else{password.setEchoChar('*');}
    }
```

## Combo Boxes

- puedes agregarle fuentes a los combo box y asignarle un fondo que combine con la paleta de colores

```java
String search = jComboBox3.getSelectedItem().toString();  //obtener cadena seleccionada

```

Otro consejo es colocar un panel detras para dar el efecto de borde, y combinarlo con la paleta de colores del programa:

![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled%205.png)



## Imagenes de perfil de usuario

```java

```

## Bordes

Se puede conseguir buenos efectos con los paneles asignandoles bordes de tipo Line

![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled%206.png)

##  poner fondo de figma o cualquier otra herramienta 
Puedes poner un fondo de figma como imagen, aunque la desventaja es que el tamanio no sera responsivo




# Recomendaciones genericas:
### 1 Pensar fuera de la caja

- No hagas las cosas de forma automatica, sino adapta el conocimiento a nuevas formas de resolver algo
- por ejemplo aqui utilizan unas dimensiones distintas a las normales para hacer un loading
- o el otro ejemplo en el que no tiene un gif sin fondo, sin embargo lo adapta colocandole un fondo del mismo color

![Image](/assets/img/posts/Formularios JAVA faa9d8b2701043b8a04db99ae19fa882/Untitled.png)

### 2 generar codigos 
```java
public class CodigoGenerador {
    private int contador = 0;

    public String generarCodigo() {
        String codigo = "cod" + String.format("%03d", contador);
        contador++;
        return codigo;
    }

    public static void main(String[] args) {
        CodigoGenerador generador = new CodigoGenerador();

        // Generar algunos códigos de ejemplo
        for (int i = 0; i < 10; i++) {
            String codigo = generador.generarCodigo();
            System.out.println(codigo);
        }
    }
}

```













# Misc


# Java con Netbeans

- [https://www.formdev.com/](https://www.formdev.com/)
- [https://github.com/BrianMarquez3/Learning-Java](https://github.com/BrianMarquez3/Learning-Java)

##  SHORTCUTS de netbeans:

`CTRL+ALT+PGUP/DN` al momento de programar los FRM

`ALT+ENTER` crear clases mas rapido y tambien comentar el texto seleccionado

`Ctrl + Shift + N`  nuevo proyecto

`Ctrl + Shift + Up/Down` duplicar lineas
`Alt + Scroll` zoom al codiog
`Alt + Shift + Up/Down`  mover lineas

`CTRL+E`  borrar la linea actual

`shift + esc` ocultar esta ventana


## List
Sí, estás en lo correcto. La estructura `List<List<String>>` es una lista que almacena otras listas, y cada una de esas listas contiene elementos de tipo `String`. 

### Representación

Cuando decimos que `List<List<String>>` almacena anagramas, podemos representarlo visualmente de la siguiente manera:

- **Lista Principal**: Es la lista que contiene otras listas.
  - **Sublista 1**: `["saco", "caso"]` (anagramas entre sí)
  - **Sublista 2**: `["arresto", "rastreo"]` (también anagramas entre sí)
  - **Sublista 3**: `["programa"]` (no tiene anagramas, así que está sola)

### Ejemplo Visual

```
List<List<String>>
|
|-- Sublista 1 --> ["saco", "caso"]
|
|-- Sublista 2 --> ["arresto", "rastreo"]
|
|-- Sublista 3 --> ["programa"]
```

### Cómo Funciona

- **Acceso**: Puedes acceder a un subgrupo (sublista) usando un índice. Por ejemplo, `anagrams.get(0)` te daría `["saco", "caso"]`.
- **Iteración**: Puedes recorrer cada sublista y cada string dentro de ella. Esto te permite trabajar con todos los anagramas de manera eficiente.
- **Manipulación**: Puedes agregar, quitar o modificar las listas o los strings dentro de ellas usando los métodos proporcionados por la interfaz `List`.

### Ejemplo de Uso

Si quisieras imprimir todos los anagramas, podrías hacer algo así:

```java
for (List<String> group : anagrams) {
    System.out.println(group);
}
```

Esto imprimiría cada sublista en la consola.

### Resumen

- `List<List<String>>` es una lista que contiene otras listas de strings.
- Es útil para agrupar datos relacionados, como en este caso, anagramas.
- Puedes acceder y manipular fácilmente tanto las sublistas como los elementos individuales dentro de ellas.

Si necesitas más detalles o ejemplos, ¡no dudes en preguntar!

## Map


Claro, aquí tienes una explicación sobre `Map<String, List<String>>`.

### Representación

La estructura `Map<String, List<String>>` es un mapa que asocia claves de tipo `String` con valores que son listas de tipo `List<String>`. En este contexto, la clave podría representar un "hash" o una característica común, y el valor sería una lista de strings que comparten esa clave.

### Ejemplo Visual

Imagina que tienes un mapa que agrupa anagramas. Podría verse así:

```
Map<String, List<String>>
|
|-- "aocs" --> ["saco", "caso"]
|
|-- "aerst" --> ["arresto", "rastreo"]
|
|-- "agmopr" --> ["programa"]
```

### Desglose

- **Claves**: En este caso, las claves son las representaciones de los anagramas (por ejemplo, las letras de "saco" y "caso" ordenadas alfabéticamente). Cada clave es única y sirve para identificar el grupo de anagramas.
- **Valores**: Cada clave se asocia con una lista de strings (anagramas) que comparten esa clave.

### Cómo Funciona

- **Acceso**: Puedes acceder a la lista de anagramas utilizando la clave. Por ejemplo, `anagramMap.get("aocs")` te daría `["saco", "caso"]`.
- **Iteración**: Puedes recorrer las entradas del mapa para obtener tanto las claves como las listas de anagramas. Esto es útil para procesar todos los grupos.
- **Manipulación**: Puedes agregar nuevos grupos de anagramas o modificar los existentes utilizando los métodos del mapa.

### Ejemplo de Uso

Si quisieras imprimir cada grupo de anagramas junto con su clave, podrías hacer algo así:

```java
for (Map.Entry<String, List<String>> entry : anagramMap.entrySet()) {
    System.out.println("Clave: " + entry.getKey() + " -> Anagramas: " + entry.getValue());
}
```

Esto imprimiría cada clave junto con su lista de anagramas en la consola.

### Resumen

- `Map<String, List<String>>` es una estructura que asocia claves de tipo `String` a listas de strings.
- Es útil para agrupar datos relacionados, como anagramas en este caso.
- Permite acceder, iterar y manipular los datos de manera eficiente.

Si tienes más preguntas o necesitas más ejemplos, ¡hazmelo saber!



##  Manipulacion de cadenas

En Java, hay numerosos métodos disponibles para manipulación de cadenas (`String`). A continuación, te presento una lista de algunos métodos comunes que puedes utilizar:

1. **length()**: Devuelve la longitud de la cadena.
    
    ```java
    String str = "Hola";
    int length = str.length(); // length = 4
    
    ```
    
2. **charAt(int index)**: Devuelve el carácter en la posición especificada.
    
    ```java
    char ch = str.charAt(1); // ch = 'o'
    
    ```
    
3. **substring(int beginIndex)**: Devuelve una subcadena desde el índice especificado hasta el final.
    
    ```java
    String subStr = str.substring(2); // subStr = "la"
    
    ```
    
4. **substring(int beginIndex, int endIndex)**: Devuelve una subcadena desde el índice de inicio hasta el índice de fin especificados.
    
    ```java
    String subStr = str.substring(1, 3); // subStr = "ol"
    
    ```
    
5. **concat(String str)**: Concatena la cadena actual con otra cadena.
    
    ```java
    String newStr = str.concat(" Mundo"); // newStr = "Hola Mundo"
    
    ```
    
6. **indexOf(String str)**: Devuelve la primera aparición de la subcadena especificada.
    
    ```java
    int index = str.indexOf("la"); // index = 2
    
    ```
    
7. **lastIndexOf(String str)**: Devuelve la última aparición de la subcadena especificada.
    
    ```java
    int lastIndex = str.lastIndexOf("l"); // lastIndex = 3
    
    ```
    
8. **startsWith(String prefix)**: Verifica si la cadena comienza con la subcadena especificada.
    
    ```java
    boolean startsWith = str.startsWith("Ho"); // startsWith = true
    
    ```
    
9. **endsWith(String suffix)**: Verifica si la cadena termina con la subcadena especificada.
    
    ```java
    boolean endsWith = str.endsWith("la"); // endsWith = false
    
    ```
    
10. **toLowerCase()** y **toUpperCase()**: Convierte la cadena a minúsculas o mayúsculas.
    
    ```java
    String lowerCaseStr = str.toLowerCase(); // lowerCaseStr = "hola"
    String upperCaseStr = str.toUpperCase(); // upperCaseStr = "HOLA"
    
    ```
    
11. **trim()**: Elimina los espacios en blanco al principio y al final de la cadena.
    
    ```java
    String spacedStr = "   Hola   ";
    String trimmedStr = spacedStr.trim(); // trimmedStr = "Hola"
    
    ```
    
12. **replace(char oldChar, char newChar)**: Reemplaza todas las ocurrencias del carácter especificado.
    
    ```java
    String replacedStr = str.replace('o', 'a'); // replacedStr = "Hala"
    
    ```
    
13. .getText().isEmpty() : obtener el texto y verificar si estsa vacio
14. .getText().equals() : obtener el texto y verificar si es igual al parametro de .equals()

Estos son solo algunos de los métodos disponibles en la clase `String` de Java. Puedes consultar la [documentación oficial de Java](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/String.html) para obtener información detallada sobre todos los métodos disponibles.





 