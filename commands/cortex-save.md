---
name: cortex-save
id: cortex-save
category: CortexFS Core
description: Persistir conocimiento estructurado dentro de CortexFS.
---

# cortex-save - Persistir conocimiento

Guarda información estructurada dentro del sistema CortexFS.

---

## Uso

cortex save <category> <id> <content>

---

## Parámetros

- category → Tipo de conocimiento (agent, skill, project, config, memory)
- id → Identificador único
- content → Contenido estructurado (JSON, markdown o texto)

---

## Ejemplos

cortex-save agent cortex-builder "{ role: 'builder', version: '1.0' }"

cortex-save skill add-form "{ description: 'Crear formularios con EasyForms' }"

cortex-save project api-docs "# API Documentation"

cortex save agent cortex-builder "{ role: 'builder', version: '1.0' }"

cortex save skill add-form "{ description: 'Crear formularios con EasyForms' }"

cortex save project api-docs "# API Documentation"

---

## Reglas

- No sobrescribir sin intención explícita
- Mantener estructura consistente por categoría
- Preferir JSON estructurado cuando sea posible