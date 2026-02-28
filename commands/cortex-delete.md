---
name: cortex-delete
id: cortex-delete
category: CortexFS Core
description: Eliminar conocimiento de CortexFS.
execution_type: bash_command
---

# cortex-delete - Eliminar Conocimiento

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Elimina una entrada específica del conocimiento en CortexFS.

---

## Comando Bash

```bash
cortex delete <category> <id>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex delete "categoria" "identificador"

# Ejemplo real
cortex delete "agent" "old-agent"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                                           |
|-----------|--------|-------------------------------------------------------|
| category  | string | Tipo de conocimiento (agent, skill, project, config, memory) |
| id        | string | Identificador único de la entrada a eliminar          |

---

## Ejemplos de Ejecución

```bash
# Eliminar un agente
cortex delete "agent" "cortex-builder"

# Eliminar un skill obsoleto
cortex delete "skill" "old-skill"

# Eliminar configuración
cortex delete "config" "deprecated-setting"
```

---

## Salida Esperada

El comando retorna JSON con el resultado:

```json
{
  "success": true
}
```

---

## Comportamiento

- La entrada DEBE existir previamente
- La acción es **permanente e irreversible**
- Se recomienda verificar con `cortex read` antes de eliminar
- Retorna error si la entrada no existe

---

## Precauciones

1. **Verificar antes de eliminar**: `cortex read "category" "id"`
2. **Considerar backup**: Guardar el contenido antes de borrar
3. **No hay papelera**: Una vez eliminado, no se puede recuperar
