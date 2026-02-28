---
name: cortex-read
id: cortex-read
category: CortexFS Core
description: Recuperar conocimiento almacenado en CortexFS.
execution_type: bash_command
---

# cortex-read - Leer conocimiento

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Obtiene información previamente almacenada en CortexFS.

---

## Comando Bash

```bash
cortex read <category> <id>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex read "categoria" "identificador"

# Ejemplo real
cortex read "agent" "cortex-builder"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                                           |
|-----------|--------|-------------------------------------------------------|
| category  | string | Tipo de conocimiento (agent, skill, project, config, memory) |
| id        | string | Identificador único de la entrada                     |

---

## Ejemplos de Ejecución

```bash
# Leer un agente
cortex read "agent" "cortex-builder"

# Leer un skill
cortex read "skill" "add-form"

# Leer documentación de proyecto
cortex read "project" "api-docs"
```

---

## Salida Esperada

El comando retorna el contenido almacenado:

```json
{
  "data": "{ \"role\": \"builder\", \"version\": \"1.0\" }"
}
```

---

## Comportamiento

- Retorna el contenido completo de la entrada
- Operación de solo lectura (no modifica estado)
- Retorna error si el ID no existe en la categoría especificada
