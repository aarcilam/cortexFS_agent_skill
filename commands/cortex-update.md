---
name: cortex-update
id: cortex-update
category: CortexFS Core
description: Actualizar conocimiento existente en CortexFS.
execution_type: bash_command
---

# cortex-update - Actualizar Conocimiento

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Actualiza el contenido de una entrada existente en CortexFS.

---

## Comando Bash

```bash
cortex update <category> <id> <content>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex update "categoria" "identificador" "nuevo contenido"

# Ejemplo real
cortex update "agent" "cortex-builder" "{ \"role\": \"builder\", \"version\": \"2.0\" }"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                                           |
|-----------|--------|-------------------------------------------------------|
| category  | string | Tipo de conocimiento (agent, skill, project, config, memory) |
| id        | string | Identificador único de la entrada a actualizar        |
| content   | string | Nuevo contenido que reemplazará al existente          |

---

## Ejemplos de Ejecución

```bash
# Actualizar versión de un agente
cortex update "agent" "cortex-builder" "{ \"role\": \"builder\", \"version\": \"2.0\" }"

# Actualizar URL de configuración
cortex update "config" "api-url" "https://api.example.com/v2"

# Actualizar documentación
cortex update "project" "readme" "# Proyecto Actualizado\n\nNueva documentación..."
```

---

## Salida Esperada

El comando retorna JSON con el resultado:

```json
{
  "success": true,
  "path": "/brain/agent/cortex-builder.json"
}
```

---

## Comportamiento

- La entrada DEBE existir previamente (usar `cortex read` para verificar)
- Se mantiene el campo `createdAt` original
- Se añade/actualiza campo `updatedAt` automáticamente
- Retorna error si la entrada no existe

---

## Diferencia con cortex-save

| cortex save | cortex update |
|-------------|---------------|
| Crea nuevas entradas | Modifica entradas existentes |
| Falla si ya existe | Falla si NO existe |
| Para datos nuevos | Para cambios en datos |
