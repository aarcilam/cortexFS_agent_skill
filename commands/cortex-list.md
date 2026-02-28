---
name: cortex-list
id: cortex-list
category: CortexFS Core
description: Listar conocimiento en CortexFS.
---

# cortex-list - Listar Conocimiento

Lista todas las entradas de conocimiento en CortexFS, opcionalmente filtradas por categoría.

---

## Uso

cortex list [category]

---

## Parámetros

- category (opcional) → Tipo de conocimiento a listar. Si se omite, lista todo.

---

## Ejemplos

cortex-list

cortex-list agent

cortex-list skill

---

## Reglas

- Sin categoría: lista todas las categorías disponibles
- Con categoría: lista todos los IDs en esa categoría
- Útil para explorar qué conocimiento está disponible
