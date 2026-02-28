---
name: cortex-config
id: cortex-config
category: CortexFS Core
description: Configurar el directorio raíz del brain en CortexFS.
execution_type: bash_command
---

# cortex-config - Configurar Brain Root

> **TIPO DE EJECUCIÓN: COMANDO BASH/SHELL**
> Este comando debe ejecutarse en la terminal del sistema operativo.

Establece el directorio raíz donde CortexFS almacenará todo el conocimiento.

---

## Comando Bash

```bash
cortex config <path>
```

---

## Cómo Ejecutar (para Agentes de IA)

Usa tu herramienta de Shell/Terminal para ejecutar el comando:

```bash
# Sintaxis
cortex config "/ruta/absoluta/al/brain"

# Ejemplo real
cortex config "/Users/usuario/cortex-brain"
```

---

## Parámetros

| Parámetro | Tipo   | Descripción                                |
|-----------|--------|--------------------------------------------|
| path      | string | Ruta absoluta al directorio brain root     |

---

## Ejemplos de Ejecución

```bash
# Configurar brain en home del usuario
cortex config "/Users/usuario/cortex-brain"

# Configurar brain en workspace del proyecto
cortex config "/workspace/my-project/brain"

# Configurar brain en directorio compartido
cortex config "/shared/team-brain"
```

---

## Salida Esperada

El comando retorna JSON con la configuración:

```json
{
  "success": true,
  "brainRoot": "/Users/usuario/cortex-brain"
}
```

---

## Comportamiento

- La ruta DEBE ser absoluta (comenzar con `/`)
- El directorio será creado automáticamente si no existe
- Solo necesita configurarse una vez por instalación
- La configuración persiste entre sesiones

---

## Cuándo Usar

1. **Primera instalación**: Configurar dónde guardar el conocimiento
2. **Cambio de ubicación**: Mover el brain a otro directorio
3. **Múltiples proyectos**: Configurar brains separados por proyecto

---

## Verificar Configuración

Para ver la configuración actual, puedes revisar:
```bash
cortex config
```
Sin argumentos muestra la configuración actual.
