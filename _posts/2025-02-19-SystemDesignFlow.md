---
title:  Flujo de Diseño del Sistema
date: '2025-02-18 11:17:32'
comments: true
categories: [Software Engineering]
tags:  [diseño-sistemas, arquitectura]
---

 
# 1 Flujo de Diseño del Sistema

1. **Entender el problema y el alcance**:
    - Definir los casos de uso, con la ayuda del entrevistador: _especificar lo que se espera del sistema_
    - Sugerir características adicionales: _proponer mejoras o funcionalidades que podrían ser útiles_
    - Eliminar elementos que el entrevistador considere fuera de alcance: _focalizarse en lo relevante para la solución_
    - Suponer que se requiere alta disponibilidad, agregarlo como caso de uso: _asegurar que el sistema funcione sin interrupciones_

# 2 Pensar en las restricciones:

- Preguntar cuántas solicitudes por mes: _entender la magnitud del tráfico_
- Preguntar cuántas solicitudes por segundo (pueden dar la cifra o hacerte calcularlo): _determinar la carga por segundo para dimensionar el sistema_
- Estimar porcentaje de lecturas vs. escrituras: _tener claro si el sistema tiene más operaciones de lectura o escritura_
- Mantener en mente la regla 80/20: _la mayoría de las operaciones suelen ser lecturas_
- Cuánto dato se escribe por segundo: _dimensionar el volumen de datos escritos_
- Almacenamiento total requerido en 5 años: _planificar la capacidad de almacenamiento a largo plazo_
- Cuánto dato se lee por segundo: _dimensionar el volumen de datos leídos_

# 3 Diseño abstracto:

- Capas (servicio, datos, caché): _definir cómo se organizarán los componentes del sistema_
- Infraestructura: balanceo de carga, mensajería: _cómo se distribuirán las peticiones y se manejarán los mensajes entre servicios_
- Visión general de cualquier algoritmo clave que impulse el servicio: _especificar la lógica fundamental del sistema_
- Considerar cuellos de botella y determinar solución: _prever posibles puntos débiles y cómo solucionarlos_

# Recomenaciones
- Puedo consultar libros para realizar un diagrama en especifico o quizas la documentacion si se trata por ejemplo de UML
- puedes utilizar un template de Ingenieria de software en caso necesite estructurar el desarrollo de un software
- Los modelos no deben establecer a pie de la letra el desarrollo el sistema. 
- En definitiva, lo importante es cumplir los requerimientos del cliente