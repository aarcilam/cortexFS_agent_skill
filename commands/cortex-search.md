---
name: cortex-search
id: cortex-search
category: CortexFS Core
description: Buscar conocimiento almacenado en CortexFS.
execution_type: bash_command
---

# cortex-search - Buscar conocimiento

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Permite buscar por texto libre dentro del almacenamiento de CortexFS.

---

## Comando Bash

```bash
cortex search <query>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex search "termino de búsqueda"

# Ejemplo real
cortex search "builder"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                     |
|-----------|--------|---------------------------------|
| query     | string | Término o frase a buscar        |

---

## Ejemplos de Ejecución

```bash
# Buscar por nombre
cortex search "easyforms"

# Buscar por funcionalidad
cortex search "login form"

# Buscar por rol
cortex search "builder"

# Buscar documentación
cortex search "API endpoints"
```

---

## Salida Esperada

El comando retorna una lista de coincidencias:

```json
{
  "results": [
    { "id": "agent/cortex-builder", "snippet": "...builder..." },
    { "id": "skill/form-builder", "snippet": "...builder de formularios..." }
  ]
}
```

---

## Comportamiento

- Busca en todas las categorías automáticamente
- Retorna coincidencias parciales
- Resultados ordenados por relevancia
- Incluye snippets del contexto encontrado
