-- AgentHint.dhall
-- Hints for AI coding agents

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
