name: cortexfs
version: 0.2.0
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
  
  ### Patrón de Uso
  
  1. **Identificar el comando** necesario de la lista de commands
  2. **Construir el comando bash** reemplazando los placeholders {{...}}
  3. **Ejecutar en terminal** usando tu herramienta Shell/Bash
  4. **Procesar la salida** del comando
  
  ### Ejemplo Completo
  
  Para guardar conocimiento:
  ```bash
  cortex save "agent" "mi-agente" "{ \"rol\": \"asistente\" }"
  ```
  
  Para leer conocimiento:
  ```bash
  cortex read "agent" "mi-agente"
  ```
  
  ### Importante
  
  - Los comandos `cortex` son ejecutables del sistema
  - Requieren que el CLI esté instalado globalmente
  - La salida es texto/JSON que debe parsearse
