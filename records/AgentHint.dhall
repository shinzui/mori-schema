-- AgentHint.dhall
-- Hints for AI coding agents

let AgentHintType =
      { role : Text
        -- Agent role identifier (e.g., "backend-refactor", "api-design")

      , description : Optional Text
        -- What this agent role is for

      , includePaths : List Text
        -- Paths the agent should focus on

      , excludePaths : List Text
        -- Paths the agent should ignore

      , relatedPackages : List Text
        -- Package names relevant to this role
      }

let AgentHintInput = { role : Text }

let agentHintDefault =
      { description = None Text
      , includePaths = [] : List Text
      , excludePaths = [] : List Text
      , relatedPackages = [] : List Text
      }

let mkAgentHint =
      \(input : AgentHintInput) ->
        ((agentHintDefault // input) : AgentHintType)

in  { Type = AgentHintType
    , Input = AgentHintInput
    , default = agentHintDefault
    , mk = mkAgentHint
    }
