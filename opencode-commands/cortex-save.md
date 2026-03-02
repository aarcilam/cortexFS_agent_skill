---
description: Guardar conocimiento estructurado en CortexFS. Uso: /cortex-save [category] [id] [contenido]
agent: build
---

Guarda información estructurada en CortexFS usando el comando:

```bash
cortex save "$1" "$2" "$3"
```

Parámetros:
- $1: categoría (agent, skill, project, config, memory, arquitectura, convenciones, etc.)
- $2: identificador único
- $3: contenido en JSON o Markdown

Ejemplo:
```bash
cortex save "arquitectura" "auth-system" '{"patrón":"JWT","proveedor":"Auth0"}'
```

Si el usuario no proporciona los parámetros, pregunta qué quiere guardar.
