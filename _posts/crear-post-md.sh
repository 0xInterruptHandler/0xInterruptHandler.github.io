#!/bin/bash

# ─────────────────────────────────────────────
# Script para crear plantilla Markdown tipo blog
# con Front Matter YAML y nombre automático.
# ─────────────────────────────────────────────

# Función para convertir a formato camel-case
to_camel_case() {
    echo "$1" | awk '{
        for (i=1;i<=NF;i++) {
            $i = (i==1 ? tolower(substr($i,1,1)) substr($i,2) : toupper(substr($i,1,1)) substr($i,2))
        }
        print
    }'
}

# Solicitar datos
read -p "Título del post: " title
read -p "Categorías (separadas por coma, ej: Programming,Dev): " categories
read -p "Tags (separados por coma, ej: electronics,bitwise): " tags

# Obtener fecha actual
date_now=$(date "+%Y-%m-%d %H:%M:%S")
date_file=$(date "+%Y-%m-%d")

# Generar slug para el archivo (camelCase)
title_slug=$(to_camel_case "$title" | tr -d '[:space:]')

# Nombre de archivo
filename="${date_file}-${title_slug}.md"

# Convertir categorías y tags en formato array
categories_array=$(echo "$categories" | sed 's/, */, /g')
tags_array=$(echo "$tags" | sed 's/, */, /g')

# Crear archivo Markdown
cat > "$filename" <<EOF
---
title: $title
date: '$date_now'
comments: true
categories: [${categories_array}]
tags: [${tags_array}]
---

## Introducción

...

EOF

echo "✅ Archivo creado: $filename"

