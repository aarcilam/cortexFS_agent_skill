---
name: cortex-config
id: cortex-config
category: CortexFS Core
description: Configurar el directorio raíz del brain en CortexFS.
---

# cortex-config - Configurar Brain Root

Establece el directorio raíz donde CortexFS almacenará todo el conocimiento.

---

## Uso

cortex config <path>

---

## Parámetros

- path → Ruta absoluta al directorio brain root

---

## Ejemplos

cortex-config /Users/usuario/cortex-brain

cortex-config /workspace/my-project/brain

---

## Reglas

- La ruta debe ser absoluta
- El directorio será creado si no existe
- Solo necesita configurarse una vez por instalación
