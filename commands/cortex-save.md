---
name: cortex-save
id: cortex-save
category: CortexFS Core
description: Persistir conocimiento estructurado dentro de CortexFS.
execution_type: bash_command
---

# cortex-save - Persistir conocimiento

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Guarda información estructurada dentro del sistema CortexFS.

---

## Comando Bash

```bash
cortex save <category> <id> <content>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex save "categoria" "identificador" "contenido"

# Ejemplo real
cortex save "agent" "cortex-builder" "{ \"role\": \"builder\", \"version\": \"1.0\" }"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                                           |
|-----------|--------|-------------------------------------------------------|
| category  | string | Tipo de conocimiento (agent, skill, project, config, memory) |
| id        | string | Identificador único semántico                         |
| content   | string | Contenido estructurado (JSON, markdown o texto)       |

---

## Ejemplos de Ejecución

```bash
# Guardar un agente
cortex save "agent" "cortex-builder" "{ \"role\": \"builder\", \"version\": \"1.0\" }"

# Guardar un skill
cortex save "skill" "add-form" "{ \"description\": \"Crear formularios con EasyForms\" }"

# Guardar documentación de proyecto
cortex save "project" "api-docs" "# API Documentation\n\nEndpoints disponibles..."
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

## Estructura Recomendada del Contenido

**IMPORTANTE PARA AGENTES DE IA:** Siempre guardar información bien estructurada para facilitar su lectura posterior.

### Para Agentes
```json
{
  "name": "nombre-del-agente",
  "role": "descripción del rol",
  "capabilities": ["cap1", "cap2"],
  "version": "1.0"
}
```

### Para Skills
```json
{
  "name": "nombre-skill",
  "description": "qué hace el skill",
  "triggers": ["cuando usar"],
  "steps": ["paso1", "paso2"]
}
```

### Para Configuraciones
```json
{
  "key": "valor",
  "environment": "dev|prod",
  "updatedBy": "quien lo cambió"
}
```

### Para Conocimiento General
```json
{
  "topic": "tema principal",
  "summary": "resumen breve",
  "details": "información detallada",
  "tags": ["tag1", "tag2"],
  "references": ["fuente1", "fuente2"]
}
```

### Para Documentación de Proyecto
```markdown
# Título

## Contexto
Descripción del contexto...

## Detalles
- Punto 1
- Punto 2

## Referencias
- Link o archivo relacionado
```

---

## Reglas

- No sobrescribir sin intención explícita
- Mantener estructura consistente por categoría
- **SIEMPRE usar JSON estructurado o Markdown organizado**
- Escapar comillas dentro del contenido
- Incluir metadata útil (tags, timestamps, referencias)
