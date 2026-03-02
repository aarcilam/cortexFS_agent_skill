---
description: Configurar el directorio brain de CortexFS. Uso: /cortex-config [path]
agent: build
---

Configura el directorio raíz del brain de CortexFS:

```bash
cortex config "$1"
```

Parámetro:
- $1: ruta al directorio brain (default: $HOME/.cortexfs/brain)

Ejemplo:
```bash
cortex config "$HOME/.cortexfs/brain"
```
