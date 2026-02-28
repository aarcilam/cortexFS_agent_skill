name: cortexfs
version: 0.1.0
display_name: CortexFS Memory Skill
description: |
  Persistent cognitive memory layer backed by CortexFS CLI.
  Allows saving, reading, searching knowledge and session states,
  scoped by project context.

auth:
  type: none

inputs:
  cortex_root:
    description: "The root directory where CortexFS is configured."
    type: string

commands:

  cortex_save:
    description: "Save structured knowledge."
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
          description: "Knowledge content"
    output_schema:
      type: object
      properties:
        success:
          type: boolean
        path:
          type: string
    run: |
      cortex save "{{category}}" "{{id}}" "{{content}}"

  cortex_read:
    description: "Read persisted knowledge."
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

  cortex_search:
    description: "Search knowledge by query."
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

  cortex_save_state:
    description: "Save session state summary."
    input_schema:
      type: object
      properties:
        summary:
          type: string
    output_schema:
      type: object
      properties:
        success:
          type: boolean
    run: |
      cortex save-state "{{summary}}"

  cortex_load_state:
    description: "Load the most recent session state."
    output_schema:
      type: object
      properties:
        state:
          type: string
    run: |
      cortex load-state

  cortex_config:
    description: "Set the brain root directory for CortexFS."
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

  cortex_update:
    description: "Update existing knowledge in CortexFS."
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

  cortex_delete:
    description: "Delete knowledge from CortexFS."
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

  cortex_list:
    description: "List knowledge in CortexFS, optionally filtered by category."
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

outputs:
  generic_result:
    description: "Generic result output common for commands."
    type: object