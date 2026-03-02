---
description: Leer conocimiento guardado en CortexFS. Uso: /cortex-read [category] [id]
agent: build
---

Lee información de CortexFS usando el comando:

```bash
cortex read "$1" "$2"
```

Parámetros:
- $1: categoría
- $2: identificador

Ejemplo:
```bash
cortex read "agent" "mi-agente"
```

Muestra el contenido guardado y pregunta si necesita hacer algo con esa información.
