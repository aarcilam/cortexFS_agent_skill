---
description: Guardar el estado actual de la sesión en CortexFS para continuidad
agent: build
---

Guarda el estado de la sesión actual:

```bash
cortex save-state "$1"
```

El parámetro $1 debe contener un JSON con:
- task: qué se estaba haciendo
- status: in_progress | blocked | completed
- progress: { completed: [], pending: [], blocked: [] }
- context: { files_modified: [], branch: "" }
- next_steps: []

Ejemplo de contenido para pasar como argumento:
```json
{"task":"Implementar auth","status":"in_progress","progress":{"completed":["login"],"pending":["logout"]},"next_steps":["tests"]}
```

Si no hay argumento, pregunta al usuario qué estado guardar.
