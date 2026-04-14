-- Subagent.dhall
-- A subagent definition (specialized AI assistant)

let PermissionMode = ../types/PermissionMode.dhall

let SubagentType =
      { name : Text
        -- Unique identifier (lowercase + hyphens)

      , description : Text
        -- When to delegate to this subagent

      , provider : Optional Text
        -- Agent platform (e.g., "claude-code", "chatgpt", "gemini-cli")

      , model : Optional Text
        -- Model name as plain text (e.g., "sonnet", "gpt-4o", "gemini-2.0-flash")

      , tools : List Text
        -- Tool allowlist (e.g., ["Read", "Grep", "Bash"])

      , disallowedTools : List Text
        -- Tools to deny

      , permissionMode : Optional PermissionMode
        -- How the subagent handles permission prompts

      , skills : List Text
        -- Skill names to preload into the subagent's context

      , background : Bool
        -- Whether to always run in background

      , isolation : Optional Text
        -- Isolation mode (e.g., "worktree")
      }

let SubagentInput = { name : Text, description : Text }

let subagentDefault =
      { provider = None Text
      , model = None Text
      , tools = [] : List Text
      , disallowedTools = [] : List Text
      , permissionMode = None PermissionMode
      , skills = [] : List Text
      , background = False
      , isolation = None Text
      }

let mkSubagent =
      \(input : SubagentInput) -> ((subagentDefault // input) : SubagentType)

in  { Type = SubagentType
    , Input = SubagentInput
    , default = subagentDefault
    , mk = mkSubagent
    }
