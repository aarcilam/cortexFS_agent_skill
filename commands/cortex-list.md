---
name: cortex-list
id: cortex-list
category: CortexFS Core
description: Listar conocimiento en CortexFS.
execution_type: bash_command
---

# cortex-list - Listar Conocimiento

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Lista todas las entradas de conocimiento en CortexFS, opcionalmente filtradas por categoría.

---

## Comando Bash

```bash
cortex list [category]
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Listar todo
cortex list

# Listar por categoría
cortex list "agent"
```

---

## Parámetros

| Parámetro | Tipo   | Requerido | Descripción                                    |
|-----------|--------|-----------|------------------------------------------------|
| category  | string | No        | Tipo de conocimiento a listar. Si se omite, lista todo. |

---

## Ejemplos de Ejecución

```bash
# Listar todas las categorías y entradas
cortex list

# Listar solo agentes
cortex list "agent"

# Listar solo skills
cortex list "skill"

# Listar configuraciones
cortex list "config"
```

---

## Salida Esperada

El comando retorna una lista de items:

```json
{
  "items": [
    "agent/cortex-builder",
    "agent/code-reviewer",
    "skill/add-form",
    "project/api-docs"
  ]
}
```

---

## Comportamiento

- Sin categoría: lista todas las categorías y entradas disponibles
- Con categoría: lista todos los IDs en esa categoría específica
- Útil para explorar qué conocimiento está disponible
- No retorna el contenido, solo los identificadores
