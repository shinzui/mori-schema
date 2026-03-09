-- Skill.dhall
-- An agent skill definition per the Agent Skills spec (agentskills.io)

let SkillTool = ./SkillTool.dhall

in  { name : Text
      -- Skill identifier (matches directory name, e.g., "code-review")

    , description : Text
      -- What the skill does and when to use it

    , path : Optional Text
      -- Relative path to the skill directory (e.g., ".claude/skills/code-review")

    , tools : List SkillTool
      -- Tools the skill uses, with language annotations

    , compatibility : Optional Text
      -- Environment requirements (e.g., "Requires git, docker")

    , metadata : List { mapKey : Text, mapValue : Text }
      -- Arbitrary key-value pairs (author, version, etc.)
    }
