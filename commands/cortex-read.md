---
name: cortex-read
id: cortex-read
category: CortexFS Core
description: Recuperar conocimiento almacenado en CortexFS.
---

# cortex-read - Leer conocimiento

Obtiene información previamente almacenada.

---

## Uso

cortex read <category> <id>

---

## Ejemplos

cortex read agent cortex-builder

cortex read skill add-form

cortex read project api-docs

---

## Comportamiento esperado

- Retornar el contenido completo
- No modificar estado
- Error si no existe el ID