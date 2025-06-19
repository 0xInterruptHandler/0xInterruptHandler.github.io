---
title: Tablas con Latex
date: '2023-06-15 11:17:32'
comments: true
categories: [Technical Writing]
tags:  [latex, documentación, tablas]
---


Es necesario instalar: 
- Texmaker
- Miktex Console
 
 
# Tabla 1

![Image](/assets/img/posts/Latex/Pasted image 20240909155610.png)

```latex
\documentclass{article}

\usepackage{longtable} % Para usar tablas largas si es necesario

\usepackage{array} % Para personalización de columnas

\usepackage{caption} % Para las leyendas de tablas

\usepackage{tabularx} % Para tablas con ancho ajustable

\usepackage{geometry} % Para ajustar márgenes generales

\usepackage{adjustbox} % Para ajustar contenido dentro del entorno

  

\geometry{margin=1in} % Ajusta los márgenes generales del documento

  

\begin{document}

  

\begin{table}[ht]

    \centering

    \begin{tabular}{|c|}

        \hline

        \begin{minipage}[t]{\linewidth}

            \centering

            \vspace{1pt} % Espacio vertical arriba

            % Tabla en la parte superior con ancho ajustable y márgenes internos

            \begin{adjustbox}{valign=t, margin=1pt} % Ajusta el margen interno

                \begin{tabularx}{\textwidth}{|X|X|X|X|}

                    \hline

                    Columna 1 & Columna 2 & Columna 3 & Columna 4 \\

                    \hline

                    Fila 1 & Dato 1 & Dato 4 & Dato 7 \\

                    \hline

                    Fila 2 & Dato 2 & Dato 5 & Dato 8 \\

                    \hline

                    Fila 3 & Dato 3 & Dato 6 & Dato 9 \\

                    \hline

                \end{tabularx}

            \end{adjustbox}

            \vspace{1pt} % Espacio vertical abajo

        \end{minipage} \\

        \hline

        % Parte inferior de una sola línea sin líneas verticales

        \begin{minipage}[b]{\linewidth}

            \centering

            \begin{tabular}{c}

                Línea única \\

            \end{tabular}

        \end{minipage} \\

        \hline

    \end{tabular}

    \caption{Ejemplo de tabla dividida horizontalmente con cuatro columnas}

\end{table}

  

\end{document}
```

# Tabla 2


![Image](/assets/img/posts/Latex/Pasted image 20240909160017.png)
```latex
\documentclass{article}

\usepackage{longtable} % Para usar tablas largas si es necesario

\usepackage{array} % Para personalización de columnas

\usepackage{caption} % Para las leyendas de tablas

\usepackage{tabularx} % Para tablas con ancho ajustable

\usepackage{geometry} % Para ajustar márgenes generales

\usepackage{adjustbox} % Para ajustar contenido dentro del entorno

  

\geometry{margin=1in} % Ajusta los márgenes generales del documento

  

\begin{document}

  

\begin{table}[ht]

    \centering

    \begin{tabular}{|c|}

        \hline

        \begin{minipage}[t]{\linewidth}

            \centering

            \vspace{1pt} % Espacio vertical arriba

            \textbf{Una clase esta compuesta por atributos y metodos y un nombre de la clase.

un atributo hace uso de los "data types"

los  "data types" pueden ser int, string, boolean, double (en la mayoria de casos) o tambien usar otra Clase como un "data type" 

- los atributos usan la siguiente "regla" a veces

	- sustantivo : String nombre, apellido, codigo

	- verbo ser : boolean EstaCaminando, boolean EstaEnElSuelo

- Los atributos de la misma clasepueden ser referenciados en la misma clase la mayoria de veces usando el keyword `this.name` primero `this` hace una referencia general y despues del punto hace una mas especifica } % Añade tu párrafo aquí

            \vspace{1pt} % Espacio vertical abajo

        \end{minipage} \\

        \hline

        % Parte inferior de una sola línea sin líneas verticales

        \begin{minipage}[b]{\linewidth}

            \centering

            \begin{tabular}{c}

                Línea única \\

            \end{tabular}

        \end{minipage} \\

        \hline

    \end{tabular}

    \caption{Ejemplo de tabla con un párrafo y una línea única}

\end{table}

  

\end{document}
```


	


# Bases de datos

```latex
\documentclass{article}

  

\usepackage{longtable} % Para usar tablas largas si es necesario

  

\usepackage{array} % Para personalización de columnas

  

\usepackage{caption} % Para las leyendas de tablas

  

\usepackage{tabularx} % Para tablas con ancho ajustable

  

\usepackage{geometry} % Para ajustar márgenes generales

  

\usepackage{adjustbox} % Para ajustar contenido dentro del entorno

  

  

\geometry{margin=1in} % Ajusta los márgenes generales del documento

  

  

\begin{document}

  

  

\begin{table}[ht]

  

    \centering

  

    \begin{tabular}{|c|}

  

        \hline

  

        \begin{minipage}[t]{\linewidth}

  

            \centering

  

            \vspace{1pt} % Espacio vertical arriba

  

            % Tabla en la parte superior con ancho ajustable y márgenes internos

  

            \begin{adjustbox}{valign=t, margin=1pt} % Ajusta el margen interno

  

                \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|}

  

                    \hline

  

                    N.º & Campo & Tipo & Tamaño  & Nulable & Definición-Regla de negocio\\

  

                    \hline

  

                    Fila 1 & Dato 1 & Dato 4 & Dato 7 & Dato 7 & Dato 7 \\

  

                    \hline

  

                    Fila 2 & Dato 2 & Dato 5 & Dato 8  & Dato 7 & Dato 7 \\

  

                    \hline

  

                    Fila 3 & Dato 3 & Dato 6 & Dato 9 & Dato 7 & Dato 7 \\

  

                    \hline

  

                \end{tabularx}

  

            \end{adjustbox}

  

            \vspace{1pt} % Espacio vertical abajo

  

        \end{minipage} \\

  

        \hline

  

        % Parte inferior de una sola línea sin líneas verticales

  

        \begin{minipage}[b]{\linewidth}

  

            \centering

  

            \begin{tabular}{c}

  

                Línea única \\

  

            \end{tabular}

  

        \end{minipage} \\

  

        \hline

  

    \end{tabular}

  

    \caption{Ejemplo de tabla dividida horizontalmente con cuatro columnas}

  

\end{table}

  

  

\end{document}
```



















