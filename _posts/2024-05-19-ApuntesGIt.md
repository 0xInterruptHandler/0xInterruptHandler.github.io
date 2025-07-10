---
title: GIT 🌳
date: '2024-06-15 11:17:32'
comments: true
categories: [Development Tools]
tags:  [git, control-versiones, desarrollo]
---

- git: es un sistema de control de versiones (como una bitacora) que crea una carpeta en el directorio de tu proyecto.
EJEMPLO CON ANALOGIA :
- imagina que al codificar, cada dia al termina de codificar, imprimes con una impresora todo tu codigo y luego lo guardas en una caja o un folder con la fecha.
- un navegador de un barco al embarcarse en un viaje tiene una bitacora (un cuaderno) en el que registra todo lo que observa, como soluciono problemas, etc. con el fin de que mostrarle a otros o ensenarles luego o recordar. Lo mismo sucede en el desarrollo de un proyecto. (nota: esa misma bitacora puede ser escrita por varios capitanes) en git para que muchos puedan escribir en la "bitacora" se necesita configurar quien escribio el mensaje para asi trabajar de forma colaborativa.

CONCEPTOS :
- VERSION : contiene nuevas caracteristicas y funcionalidades, 
- SUB-VERSION : una version puede tener sub versiones mas pequenas. como windows xp, 7, 8, 10.1, 10.2  
- COMMIT : "un punto en nuestra linea de tiempo" o como analogia : *cada registro en nuestra bitacora*
- BRANCH : es una linea de tiempo (log) que tiene nodos ("commits"). A partir de un commit puede salir otro "branch" que tendra distintos propositos. la branch principal es llamada "Master" EJEMPLO: entregas una aplicacion y luego tienes que corregir 4 errores, pero a la par agregar una nueva funcionalidad. los 4 errores los corriges en la branch master y la nueva funcionalidad la haces en una nueva branch lllamada "Dev" o por ejemplo, cada vez que soluciones uno de esos 4 errores sacas un branch llamado "Testing" para realizar las pruebas del codigo.  Es por eso que al usar la terminal aparece "master" en el prompt, lo que te indicaria que estas en la branch master
- palabra tecnica : "bifurcar" : Dicho de una cosa: Dividirse en dos ramales, brazos o puntas. "Bifurcarse un río, la rama de un árbol."  puedes usarlo para decir, "hemos bifurcado la branch master"
- merge = mezclar

```
  DEVELOP    MASTER
  	 |  	  [ ]  <- Initial production version
  	 |  	   |
	[ ] <_____/
  	 |  	   |
	[ ]\	   |
	 |  \      |
	[ ]  \_>  [ ] <- Next production release
  	 |  	   |
	[ ]   	   |
  	 |  	   |	
	[ ]\	   |
	 |  \      |
	[ ]  \__> [ ] <- Next production release
  	 |  	   
	[ ]  <- Work in progress on "New release"	   
  	 |
```

### Los 3 estados de git:
1. ESPACIO DE TRABAJO : Esta es la carpeta donde tienes el proyecto (`.git` NO es parte del espacio de trabajo).  
2. AREA DE PREPARACION o STAGED AREA :   Aqui se prepara para que sean agregados al `.git` utilizando `git commit` y para ver el estado del area de preparacion usar `git status`
	1. explicacion :   recordando la bitacora, era recomendable escribir la mayor cantidad de mensajes para asi mantener un registro a lo largo del tiempo. Por lo que no tendria sentido agarrar varios archivos y meterlos a la carpeta `.git` y decir "este ha sido mi trabajo de hoy" ya qu no entenderiamos que ha sucedido en todos esos archivos. Por lo tanto, se deberia como buena practica escribir un "registro en la bitacora (git)" y agregarle un mensaje.
		1. para lograr ello podrias usar `git add <nombredelarchivo>` en vez de `git add .` para asi agregarlos a esta area de forma singular y luego registrar los cambios con `git commit` de forma singular 
	2.  `Changes not staged for commit` se podria decir "tenemos cambios que no se encuentran en el area de preparacion para que se puedan volver en un commit" 
4. REPOSITORIO : Es el directorio `.git`

```
LOS 3 ESTADOS DE GIT
[Espacio de trabajo o "WORKING AREA"] --> [ Area de preparacion o "STAGED AREA" ] --> Repositorio(CARPETA .GIT)
```

### mini cheatsheet

```bash
# 1 configuracion de usuario y correo 
git config --global user.name "asdf"
git config --global user.email "asdf@asdf.com"

# 1.1 verificar las modificaciones
git config --list

# 2 iniciar el proyecto (se debe realizar dentro del proyecto) esto crea la carpeta oculta (dotfile) .git 

git init

# 3 mostrar el estado del "STAGED AREA" ademas te dice en que branch te encuentras
git status

# 4 actualizar lo que sea "commiteado" de forma singular
git add <nombre del archivo>  

# 4.1 actualizar lo que sea "commiteado" de forma global en el proyecto
# funciona unicamente cuando se esta en la raiz del proyecto (misma logica que usar el comodin "." en linux)
# es lo mismo que en linux: cd . (el mismo directorio) cd ../ (el anterior)
git add .


# 5 Quitar archivos del "STAGED AREA (color verde)" y moverlos al "WORK AREA" 
git restore --staged <nombre del archivo>


# 5.1 descartar los cambios en el directorio de trabajo
git restore <nombre del archivo>

# 6 editar la documentacion del proyecto 
# 6.1   te abrira un editor
git commit 
# 6.2 no te abre un editor
git commit -m "mensaje"
# hacer que solo los archivos modificados pasen al area de repositorio y no para los nuevos archivos. es decir para los archivos nuevos, siempre ejecutar git add
git commit -am "mensaje"


# 7 muestra los logs (mejor explicado abajo)
git log --oneline -n <numero limite>
 

# 7.1 tambien puedes usar git -all --graph  para mostrar todo y en forma de grafico
# exp de -all corta : imagina que estas en el branch master y tenias otra branch llamada development y en esta avanzaste, al usar git log --all veras lo que no tiene incorporado de la otra branch, tu codigo de la rama master
#  el uso de --all --graph y --decorate cobra mucho mas sentido cuando se tiene distintos branches con comits distintos (abajo pongo un ejemplo de output)
git log --oneline --graph
git log --oneline --graph --all --decorate


# 8 deshacer cambios (regresar a un punto anterior en la linea de tiempo) el workflow seria: lanzar git status, ver que modificaste, y luego el git checkout. como nota adicional: se pueden usar comodines de linux como el "."
git checkout <nombreDelArchivo>
# 8.1 hacer un git checkout forzando independientemente de lo que suceda. luego de lanzar este comando, al usar git status, aparecera "nothing to commit, working tree clean"
git checkout -f 


#ver la diferencia de cambios hechos
# explicacion: esto hace una comparacion entre el archivo actual con el que esta dentro del repositorio local, la salida del comando se puede interpretar igual que el comando diff de linux
# workflow recomendado: lanzar git diff, luego podrias usar un git commit -am (debido a que diff solo muestra los archivos modificados y commig -am solo aplica para los modificados) resulta logico utilizarlos a la par. el primero para ver los cambios y el segundo para registrarlos en la bitacora
git diff <nombreDelArchivo>

#ver la diferencia de cambios hechos unicamente como estadistica
git diff --stat <nombreDelArchivo>
git diff --numstat <nombreDelArchivo>

  
```

(explicacion de `git commit -am` )
![Image](/assets/img/posts/GIT/Pasted image 20240630115814.png)

(explicacion de git log desde otro branch)
![Image](/assets/img/posts/GIT/Pasted image 20240630153608.png)

(ejemplo de `git log --oneline --graph --all --decorate` : la linea master sigue continuando (lo representa con pipe `|` y la bifurcacion con `/` ))
![Image](/assets/img/posts/GIT/Pasted image 20240630161321.png)


## explicacion corta del log de git
```bash
# 1 listar el log de git : contiene muchas flags, la mejor es:  --oneline
git log
# 1.1 mostrar en una sola linea o mostrar los commits (log) de forma muy condensada. output : HASH abreviado + mensaje
git log --oneline 
# mostrar logs, pero limitando la cantidad por un numero fijo
git log --oneline -n <numero de lineas a mostrar>

# 2 mover la "HEAD" utilizando el hash del commit obtenido en el  git log  
# cosas que suceden al usar este codigo: 
#  a) tu codigo cambia al estado del commit al cual te trasladas 
#  b) tambien se cambian los archivos del proyecto, es decir "desaparecen algunos o aparecen algunos" 
# c) se actualiaza la HEAD y los commits que aparecne son los que estan mas detras en la linea de tiempo del head actual
# CASO DE USO: Imagina que anteriormente tenias una funcion que solucionaba un problema que enfrenta tu codigo actualmente, pero lo borraste. lo que puedes hacer es  regresar al branch anterior usando git checkout y recuperar esa pieza de codigo borrada. Es como "viajar en el tiempo de tu codigo" y tu prompt de bash cambiara cada vez que intercambias 
# 2.1 VIAJAR AL PASADO(codigo anterior):
git checkout <pegar el hash aqui >
 
# 2.2 VIAJAR AL PRESENTE(codigo actual):
git checkout master


# 3 crear una nueva branch
git checkout -b <nombre de la nueva rama>

# 4 listas branches 
git branch

# 5.cambiar de branch: cualquiera de las 2 opciones funciona
git checkout <nombre>
git switch <nombre>


# 6. FUSIONAR BRANCHES CON MERGE
# advertencias: es probable que al hacer merge, puede que hayas tocado el mismo archivo en las distintas branches, por lo que en caso de que sean iguales, esto se vuelve sencillo. pero en el caso que se modifique el archivo X.md por ejemplo en el branch master y en el branch development, entonces git no sabra a quien hacerle caso (no sabe con quien combinarlo)
#el siguiente comando lo combina al branch actual en el que te encuentres, con otro el cual puedes especificarlo
git merge <nombre del otro branch> 

# 7. luego de hacer un merge, la rama que se le dio como parametro para ser combinada, deja de tener sentido que exista, por lo que el siguiente comando es util (solo funciona cuando no estas en la rama que vas a eliminar):
 
git branch -D <nombre de la branch a eliminar>


```

![Image](/assets/img/posts/GIT/Pasted image 20240630130112.png)


(ejemplo de como se ve hacer un `git log` luego de hacer un `git merge` de la branch development desde la branch master)
![Image](/assets/img/posts/GIT/Pasted image 20240630162100.png)

 


---
## ejercicio de practica 

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Document</title>

</head>

<body>

    <h1>tienda de refrescos</h1>

    <p>

        esta tienda de refrescos

        vende refrescos con sabores de

        1. manzana

        2. pera

        3. banana

    </p>

</body>

</html>
```

```md
   
# Las funcionalidades de la pagina de la tienda de refrescos son

1. vender jugo de manzana

2. vender jugo de pera

3. vender jugo de banana

4. vender jugo de sandia
```

# 📔 Cheatsheet

### Git Commands and Their Uses

#### Basic Commands

* `git init`: Initializes a new Git repository.
* `git clone [url]`: Clones an existing repository from the given URL.
* `git add [file]`: Adds a file to the staging area.
* `git commit -m "[message]"`: Commits the staged changes with a commit message.
* `git status`: Shows the status of changes as untracked, modified, or staged.
* `git log`: Displays the commit history.

#### Branching & Merging

* `git branch`: Lists all local branches.
* `git branch [branch-name]`: Creates a new branch.
* `git checkout [branch-name]`: Switches to the specified branch.
* `git merge [branch]`: Merges the specified branch into the current branch.
* `git branch -d [branch-name]`: Deletes the specified branch.

#### Remote Repositories

* `git remote add [name] [url]`: Adds a new remote repository.
* `git fetch [name]`: Fetches the branches and their respective commits from the remote repository.
* `git pull [remote] [branch]`: Fetches and merges changes from the remote branch to your local branch.
* `git push [remote] [branch]`: Pushes your local branch commits to the remote repository branch.

#### Undo Changes

* `git checkout -- [file]`: Discards changes in the working directory.
* `git reset [file]`: Removes the file from the staging area but preserves its contents.
* `git revert [commit]`: Creates a new commit that undoes the changes made in the specified commit.
* `git reset --hard [commit]`: Resets the index and working directory to the state of the specified commit.


Enlaces relacionados:

1.- https://git-scm.com/docs/
2.- https://git-scm.com/docs/git-log
 



