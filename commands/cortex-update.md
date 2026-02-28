---
name: cortex-update
id: cortex-update
category: CortexFS Core
description: Actualizar conocimiento existente en CortexFS.
---

# cortex-update - Actualizar Conocimiento

Actualiza el contenido de una entrada existente en CortexFS.

---

## Uso

cortex update <category> <id> <content>

---

## Parámetros

- category → Tipo de conocimiento (agent, skill, project, config, memory)
- id → Identificador único de la entrada a actualizar
- content → Nuevo contenido

---

## Ejemplos

cortex-update agent cortex-builder "{ role: 'builder', version: '2.0' }"

cortex-update config api-url "https://api.example.com/v2"

cortex update agent cortex-builder "{ role: 'builder', version: '2.0' }"

cortex update config api-url "https://api.example.com/v2"

---

## Reglas

- La entrada debe existir previamente (usar cortex-read para verificar)
- Se mantiene el campo createdAt original
- Se añade campo updatedAt automáticamente
- Si la entrada no existe, retornará error
