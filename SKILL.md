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

outputs:
  generic_result:
    description: "Generic result output common for commands."
    type: object