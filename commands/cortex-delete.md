---
name: cortex-delete
id: cortex-delete
category: CortexFS Core
description: Eliminar conocimiento de CortexFS.
---

# cortex-delete - Eliminar Conocimiento

Elimina una entrada específica del conocimiento en CortexFS.

---

## Uso

cortex delete <category> <id>

---

## Parámetros

- category → Tipo de conocimiento (agent, skill, project, config, memory)
- id → Identificador único de la entrada a eliminar

---

## Ejemplos

cortex-delete agent cortex-builder

cortex-delete skill old-skill

cortex delete agent cortex-builder

cortex delete skill old-skill

---

## Reglas

- La entrada debe existir previamente
- La acción es permanente e irreversible
- Se recomienda verificar con cortex-read antes de eliminar
