---
name: cortex-load-state
id: cortex-load-state
category: CortexFS Session
description: Cargar el último estado de sesión guardado.
execution_type: bash_command
---

# cortex-load-state - Cargar sesión

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Restaura la última sesión persistida para retomar el trabajo donde lo dejaste.

---

## Comando Bash

```bash
cortex load-state
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Ejecutar directamente (no requiere parámetros)
cortex load-state
```

---

## Parámetros

Este comando no requiere parámetros.

---

## Ejemplos de Ejecución

```bash
# Cargar el último estado guardado
cortex load-state
```

---

## Salida Esperada

El comando retorna el estado guardado:

```json
{
  "state": "Implementando autenticación OAuth2. Pendiente: refresh tokens",
  "timestamp": "2024-01-15T14:30:00Z"
}
```

---

## Comportamiento

- Restaura el contexto de la última sesión guardada
- Retorna el resumen (summary) del estado
- Incluye timestamp de cuándo fue guardado
- No modifica ni sobrescribe conocimiento persistente

---

## Casos de Uso

1. **Inicio del día**: Recordar en qué estabas trabajando
2. **Retomar trabajo**: Después de una interrupción
3. **Nueva sesión de chat**: Recuperar contexto perdido
4. **Onboarding**: Ver el estado actual del proyecto

---

## Flujo Típico

```bash
# Al iniciar una nueva sesión
cortex load-state

# ... trabajar en el proyecto ...

# Al terminar la sesión
cortex save-state "Descripción del progreso y pendientes"
```
