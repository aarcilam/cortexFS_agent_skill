---
name: cortex-save-state
id: cortex-save-state
category: CortexFS Session
description: Guardar el estado actual de la sesión.
execution_type: bash_command
---

# cortex-save-state - Guardar sesión

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Persiste el estado actual del entorno o conversación para recuperarlo después.

---

## Comando Bash

```bash
cortex save-state <summary>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex save-state "resumen del estado actual"

# Ejemplo real
cortex save-state "Trabajando en feature auth, archivos modificados: auth.ts, login.tsx"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                                      |
|-----------|--------|--------------------------------------------------|
| summary   | string | Resumen descriptivo del estado actual de la sesión |

---

## Ejemplos de Ejecución

```bash
# Guardar estado de desarrollo
cortex save-state "Implementando autenticación OAuth2. Pendiente: refresh tokens"

# Guardar contexto de debugging
cortex save-state "Bug en cálculo de precios. Revisando función calculateTotal()"

# Guardar progreso de refactoring
cortex save-state "Migrando componentes a TypeScript. Completado: Header, Footer. Pendiente: Sidebar"
```

---

## Salida Esperada

El comando retorna JSON con el resultado:

```json
{
  "success": true
}
```

---

## Comportamiento

- Guarda el contexto activo de la sesión
- Incluye timestamp automáticamente
- Permite múltiples estados guardados (historial)
- Útil para pausar y retomar trabajo

---

## Estructura Recomendada del Estado

**IMPORTANTE PARA AGENTES DE IA:** El estado debe guardarse estructurado para que cualquier agente pueda retomar el trabajo fácilmente.

### Formato Recomendado (JSON)

```json
{
  "task": "Descripción breve de la tarea actual",
  "status": "in_progress|blocked|review",
  "progress": {
    "completed": ["item1", "item2"],
    "pending": ["item3", "item4"],
    "blocked": []
  },
  "context": {
    "files_modified": ["archivo1.ts", "archivo2.tsx"],
    "branch": "feature/nombre-feature",
    "related_issues": ["#123", "#456"]
  },
  "notes": "Notas adicionales importantes",
  "next_steps": ["Siguiente acción 1", "Siguiente acción 2"]
}
```

### Ejemplo Estructurado

```bash
cortex save-state '{
  "task": "Implementar autenticación OAuth2",
  "status": "in_progress",
  "progress": {
    "completed": ["Setup provider", "Login flow"],
    "pending": ["Refresh tokens", "Logout flow"],
    "blocked": []
  },
  "context": {
    "files_modified": ["auth.ts", "login.tsx", "api/oauth.ts"],
    "branch": "feature/oauth2-auth"
  },
  "next_steps": ["Implementar refresh token logic", "Agregar tests"]
}'
```

### Formato Alternativo (Texto Estructurado)

Si JSON es muy verboso, usar texto con secciones claras:

```bash
cortex save-state "TASK: Implementar OAuth2 | STATUS: in_progress | DONE: login,provider | PENDING: refresh,logout | FILES: auth.ts,login.tsx | NEXT: implementar refresh tokens"
```

---

## Casos de Uso

1. **Fin del día**: Guardar en qué estabas trabajando
2. **Cambio de contexto**: Antes de cambiar a otra tarea
3. **Breakpoints mentales**: Marcar puntos de progreso
4. **Colaboración**: Documentar estado para otro desarrollador
5. **Handoff entre agentes**: Permitir que otro agente continúe el trabajo
