name: cortexfs
version: 0.3.0
display_name: CortexFS Memory Skill
description: |
  Persistent cognitive memory layer backed by CortexFS CLI.
  Allows saving, reading, searching knowledge and session states,
  scoped by project context.

  ⚠️ IMPORTANTE PARA AGENTES DE IA:
  Todos los comandos definidos en este skill son comandos BASH/CLI
  que deben ejecutarse en la TERMINAL/SHELL del sistema operativo.
  
  Para ejecutar cualquier comando de CortexFS:
  1. Usa la herramienta de shell/terminal disponible
  2. Ejecuta el comando exactamente como se especifica en "run"
  3. Captura y procesa la salida del comando

# ============================================================
# 🧠 COMPORTAMIENTO AUTOMÁTICO DEL AGENTE
# ============================================================
# Este skill actúa como la MEMORIA PERSISTENTE del proyecto.
# El agente DEBE seguir estas reglas de comportamiento:

agent_behavior:
  
  # ─────────────────────────────────────────────────────────
  # 🔍 REGLA 1: BUSCAR PRIMERO (Search-First)
  # ─────────────────────────────────────────────────────────
  search_first:
    when: |
      SIEMPRE que el usuario pregunte algo sobre el proyecto,
      ANTES de responder o buscar en el código:
    action: |
      1. Ejecutar: cortex search "<términos relevantes de la pregunta>"
      2. Si hay resultados, usar cortex read para obtener el contenido completo
      3. Usar ese conocimiento para responder o complementar la respuesta
    examples:
      - question: "¿Cómo funciona la autenticación?"
        do_first: "cortex search 'autenticación auth login'"
      - question: "¿Cuáles son las convenciones de código?"
        do_first: "cortex search 'convenciones código estilo'"
      - question: "¿Qué decisiones de arquitectura tomamos?"
        do_first: "cortex search 'arquitectura decisiones'"
    why: |
      CortexFS contiene conocimiento curado y decisiones previas.
      Buscar aquí PRIMERO evita repetir trabajo o contradecir decisiones.

  # ─────────────────────────────────────────────────────────
  # 💾 REGLA 2: GUARDAR CONOCIMIENTO IMPORTANTE (Auto-Save)
  # ─────────────────────────────────────────────────────────
  auto_save:
    when: |
      Guardar AUTOMÁTICAMENTE cuando se descubra o defina:
    triggers:
      - "Decisiones de arquitectura o diseño"
      - "Convenciones de código acordadas"
      - "Patrones o soluciones reutilizables"
      - "Configuraciones importantes del proyecto"
      - "APIs o endpoints documentados"
      - "Bugs importantes y sus soluciones"
      - "Dependencias clave y su propósito"
      - "Flujos de negocio o lógica compleja"
      - "Información que el usuario pide recordar"
      - "Contexto importante que se perdería entre sesiones"
    action: |
      1. Identificar la categoría apropiada
      2. Crear un ID semántico descriptivo
      3. Estructurar el contenido en JSON
      4. Ejecutar: cortex save "<category>" "<id>" "<contenido JSON>"
    categories:
      arquitectura: "Decisiones de diseño, patrones, estructura"
      convenciones: "Reglas de código, estilo, naming"
      config: "Configuraciones, variables de entorno, settings"
      api: "Endpoints, contratos, schemas"
      bugs: "Problemas encontrados y soluciones"
      flujos: "Lógica de negocio, workflows, procesos"
      dependencias: "Librerías importantes y su uso"
      memoria: "Información general que recordar"

  # ─────────────────────────────────────────────────────────
  # 🔄 REGLA 3: INICIO DE SESIÓN (Session Start)
  # ─────────────────────────────────────────────────────────
  session_start:
    when: "Al inicio de una nueva conversación o sesión"
    action: |
      1. Ejecutar: cortex load-state
      2. Revisar el estado anterior para contexto
      3. Ejecutar: cortex list
      4. Conocer qué conocimiento está disponible
    why: "Retomar contexto sin que el usuario tenga que repetir información"

  # ─────────────────────────────────────────────────────────
  # 🏁 REGLA 4: FIN DE SESIÓN (Session End)
  # ─────────────────────────────────────────────────────────
  session_end:
    when: |
      - El usuario indica que termina la sesión
      - Se completó una tarea importante
      - Hubo cambios significativos en el proyecto
    action: |
      Ejecutar: cortex save-state con JSON estructurado incluyendo:
      - task: qué se estaba haciendo
      - status: estado actual
      - progress: completado/pendiente
      - next_steps: siguientes acciones

execution:
  type: shell
  shell: bash
  note: |
    Todos los comandos `cortex` son ejecutables CLI.
    Deben correrse usando la herramienta Shell/Bash del agente.
    NO son funciones internas - son comandos del sistema.

auth:
  type: none

prerequisites:
  - name: cortexFS CLI instalado
    check: "which cortex || cortex --version"
    install: "npm install -g cortexfs-cli"

inputs:
  cortex_root:
    description: "The root directory where CortexFS is configured."
    type: string

commands:

  cortex_save:
    description: "Save structured knowledge. SIEMPRE estructurar el contenido en JSON o Markdown."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        category:
          type: string
          description: "Knowledge category (e.g. arquitectura, convenciones)"
        id:
          type: string
          description: "Semantic identifier"
        content:
          type: string
          description: "Knowledge content - DEBE ser JSON estructurado o Markdown organizado"
    output_schema:
      type: object
      properties:
        success:
          type: boolean
        path:
          type: string
    run: |
      cortex save "{{category}}" "{{id}}" "{{content}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      IMPORTANTE: El contenido DEBE estar bien estructurado (JSON o Markdown).
      Ejemplo JSON: Shell("cortex save 'agent' 'mi-agente' '{\"name\":\"mi-agente\",\"role\":\"asistente\",\"capabilities\":[\"buscar\",\"analizar\"]}'")
      Ejemplo Markdown: Shell("cortex save 'project' 'readme' '# Proyecto\\n\\n## Descripción\\nTexto aquí...'")

  cortex_read:
    description: "Read persisted knowledge."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        category:
          type: string
        id:
          type: string
    output_schema:
      type: object
      properties:
        data:
          type: string
    run: |
      cortex read "{{category}}" "{{id}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex read 'agent' 'mi-agente'")

  cortex_search:
    description: "Search knowledge by query."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        query:
          type: string
    output_schema:
      type: object
      properties:
        results:
          type: array
          items:
            type: object
            properties:
              id:
                type: string
              snippet:
                type: string
    run: |
      cortex search "{{query}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex search 'mi búsqueda'")

  cortex_save_state:
    description: "Save session state summary. SIEMPRE usar formato estructurado para facilitar handoff."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        summary:
          type: string
          description: "Estado de la sesión - DEBE ser JSON estructurado con task, status, progress, context, next_steps"
    output_schema:
      type: object
      properties:
        success:
          type: boolean
    run: |
      cortex save-state "{{summary}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      IMPORTANTE: Guardar estado ESTRUCTURADO para que otro agente pueda retomar.
      Formato recomendado JSON:
      {
        "task": "descripción",
        "status": "in_progress|blocked|review",
        "progress": {"completed":[], "pending":[], "blocked":[]},
        "context": {"files_modified":[], "branch":""},
        "next_steps": []
      }
      Ejemplo: Shell("cortex save-state '{\"task\":\"Implementar auth\",\"status\":\"in_progress\",\"progress\":{\"completed\":[\"login\"],\"pending\":[\"logout\"]},\"next_steps\":[\"agregar tests\"]}'")
      Alternativa compacta: Shell("cortex save-state 'TASK: Auth OAuth2 | STATUS: in_progress | DONE: login | PENDING: logout | NEXT: tests'")

  cortex_load_state:
    description: "Load the most recent session state."
    execution_type: bash_command
    output_schema:
      type: object
      properties:
        state:
          type: string
    run: |
      cortex load-state
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex load-state")

  cortex_config:
    description: "Set the brain root directory for CortexFS."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        path:
          type: string
          description: "Absolute path to the brain root directory"
    output_schema:
      type: object
      properties:
        success:
          type: boolean
        brainRoot:
          type: string
    run: |
      cortex config "{{path}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex config '/ruta/al/brain'")

  cortex_update:
    description: "Update existing knowledge in CortexFS."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        category:
          type: string
          description: "Knowledge category"
        id:
          type: string
          description: "Semantic identifier"
        content:
          type: string
          description: "New content to replace existing"
    output_schema:
      type: object
      properties:
        success:
          type: boolean
        path:
          type: string
    run: |
      cortex update "{{category}}" "{{id}}" "{{content}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex update 'agent' 'mi-agente' 'nuevo contenido'")

  cortex_delete:
    description: "Delete knowledge from CortexFS."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        category:
          type: string
          description: "Knowledge category"
        id:
          type: string
          description: "Semantic identifier to delete"
    output_schema:
      type: object
      properties:
        success:
          type: boolean
    run: |
      cortex delete "{{category}}" "{{id}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex delete 'agent' 'mi-agente'")

  cortex_list:
    description: "List knowledge in CortexFS, optionally filtered by category."
    execution_type: bash_command
    input_schema:
      type: object
      properties:
        category:
          type: string
          description: "Optional category to list (lists all if not provided)"
          default: ""
    output_schema:
      type: object
      properties:
        items:
          type: array
          items:
            type: string
    run: |
      cortex list "{{category}}"
    run_instructions: |
      Ejecutar este comando BASH en la terminal del sistema.
      Ejemplo: Shell("cortex list") o Shell("cortex list 'agent'")

outputs:
  generic_result:
    description: "Generic result output common for commands."
    type: object

agent_usage_guide: |
  ## Guía para Agentes de IA

  Este skill proporciona comandos CLI que DEBEN ejecutarse en la terminal.
  CortexFS es tu MEMORIA PERSISTENTE - úsala activamente.
  
  ### ⚡ FLUJO DE TRABAJO OBLIGATORIO
  
  ```
  ┌─────────────────────────────────────────────────────────┐
  │  INICIO DE SESIÓN                                       │
  │  1. cortex load-state    → Recuperar contexto anterior  │
  │  2. cortex list          → Ver conocimiento disponible  │
  └─────────────────────────────────────────────────────────┘
                            ↓
  ┌─────────────────────────────────────────────────────────┐
  │  CUANDO EL USUARIO PREGUNTE ALGO                        │
  │  1. cortex search "..."  → BUSCAR PRIMERO en memoria    │
  │  2. cortex read "..." "..."  → Leer detalles si existe  │
  │  3. Luego buscar en código si es necesario              │
  └─────────────────────────────────────────────────────────┘
                            ↓
  ┌─────────────────────────────────────────────────────────┐
  │  CUANDO DESCUBRAS/DEFINAS ALGO IMPORTANTE               │
  │  → cortex save "categoria" "id" "{...JSON...}"          │
  │                                                         │
  │  Guardar: decisiones, convenciones, configs, APIs,      │
  │           bugs+soluciones, patrones, flujos de negocio  │
  └─────────────────────────────────────────────────────────┘
                            ↓
  ┌─────────────────────────────────────────────────────────┐
  │  FIN DE SESIÓN / TAREA COMPLETADA                       │
  │  → cortex save-state "{...estado estructurado...}"      │
  └─────────────────────────────────────────────────────────┘
  ```
  
  ### 🔍 Ejemplo: Usuario pregunta algo
  
  Usuario: "¿Cómo manejamos los errores en la API?"
  
  ```bash
  # PASO 1: Buscar primero en CortexFS
  cortex search "errores API manejo error handling"
  
  # PASO 2: Si encuentra resultados, leer el contenido
  cortex read "convenciones" "error-handling"
  
  # PASO 3: Responder usando ese conocimiento + código si necesario
  ```
  
  ### 💾 Ejemplo: Guardar conocimiento importante
  
  Después de definir cómo manejar errores:
  
  ```bash
  cortex save "convenciones" "error-handling" '{
    "topic": "Manejo de errores en API",
    "rules": [
      "Usar AppError para errores controlados",
      "Logging con nivel según severidad",
      "Respuestas estandarizadas con code y message"
    ],
    "example": "throw new AppError(400, \"VALIDATION_ERROR\", \"Campo requerido\")",
    "decided_on": "2024-01-15",
    "reason": "Consistencia en respuestas de error"
  }'
  ```
  
  ### 📂 Categorías Recomendadas
  
  | Categoría      | Usar para                                    |
  |----------------|----------------------------------------------|
  | arquitectura   | Decisiones de diseño, patrones, estructura   |
  | convenciones   | Reglas de código, estilo, naming             |
  | config         | Configuraciones, env vars, settings          |
  | api            | Endpoints, contratos, schemas                |
  | bugs           | Problemas encontrados y soluciones           |
  | flujos         | Lógica de negocio, workflows                 |
  | dependencias   | Librerías importantes y su uso               |
  | memoria        | Información general a recordar               |
  
  ### ⚠️ Recordatorios Críticos
  
  - **BUSCAR ANTES DE RESPONDER** - CortexFS tiene conocimiento curado
  - **GUARDAR PROACTIVAMENTE** - Si es importante, persistirlo
  - **ESTRUCTURAR EN JSON** - Facilita búsqueda y lectura futura
  - Los comandos `cortex` son ejecutables BASH del sistema
  - Requieren permisos de escritura fuera del workspace (usar "all")
