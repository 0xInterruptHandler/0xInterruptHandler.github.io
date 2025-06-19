---
title: Guide to create a site using jekyll on Ubuntu
date: '2024-06-16 18:49:24'
comments: true
categories: [Tutorials]
tags: [jekyll, ruby, blog, desarrollo-web]
---
 

# Guide to create a site using jekyll on Ubuntu


### Official docs from github
- https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll 
- https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll

### Other useful resources that i found 
- https://im-hass.oopy.io/a7d2c16a-67cc-4f5d-a173-d664da039b55 
- https://stackoverflow.com/questions/63335953/jekyll-error-building-page-related-to-kramdown-parser

### important to know first
- gem : RubyGems is a package manager for Ruby
- bundler :  bundle - Ruby Dependency Management
	- Webrick (the most important to know if you are not familiar with ruby) : is a Ruby library providing simple HTTP web servers. so if you don't have it installed, you will probably encounter errors during the installation on your local computer. ruby 3.0 or more doesn't have it, so your have to execute : bundle add webrick


### Troubleshooting

```bash
#in case you encounter an error that is related to bundler version
$ gem list  | grep bundler
# first i identified my current bundler version
$ bundler -v
# i deleted the bundler versions that caused me an error using
gem uninstall bundle # by using this it will appear an menu

# then execute
bundle add webrick 
bundle exec jekyll serve

```


# Chirpy : step by step guide 
- https://github.com/cotes2020/jekyll-theme-chirpy 

1. make a git clone to the repo
2. configure the files

Note:
everytime you are gonna create a post, use the following syntax for the markdown files:
yyyy-mm-dd-NameOfThePost.md
otherwise it won't appear on the page

 
 ---

 # Windows 


Para ejecutar el comando `bundle` en Windows 10, necesitas asegurarte de tener Ruby y Bundler instalados en tu sistema. Aquí te dejo los pasos para hacerlo:

### Paso 1: Instalar Ruby

1. Dirígete a la página oficial de Ruby: [https://rubyinstaller.org/](https://rubyinstaller.org/).
2. Descarga el instalador de Ruby para Windows (elige la versión recomendada).
3. Ejecuta el instalador y sigue las instrucciones, asegurándote de marcar la opción "Add Ruby to PATH" durante la instalación.

### Paso 2: Instalar Bundler

Una vez que Ruby esté instalado, puedes instalar Bundler. Abre una terminal (CMD o PowerShell) y ejecuta el siguiente comando:

```sh
gem install bundler
```

### Paso 3: Ejecutar el comando `bundle`

Si tienes un archivo `Gemfile` en tu proyecto, puedes ejecutar el comando `bundle` para instalar las dependencias definidas en ese archivo. Para hacerlo, abre una terminal en la carpeta de tu proyecto y ejecuta:

```sh
bundle install
```

Este comando instalará todas las gemas (dependencias) que estén listadas en tu `Gemfile`.

Si todo está configurado correctamente, Bundler debería comenzar a instalar las dependencias necesarias.

### Verificación

Para verificar que Bundler está instalado correctamente, puedes ejecutar:

```sh
bundle -v
```

Esto debería mostrarte la versión instalada de Bundler.

Si encuentras algún problema durante la instalación o ejecución, avísame y te ayudaré a solucionarlo.

---

Recomendacion final: eliminar el archivo dentro de plugins si no utilizar git