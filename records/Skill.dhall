-- Skill.dhall
-- An agent skill definition per the Agent Skills spec (agentskills.io)

let SkillTool = ./SkillTool.dhall

let SkillType =
      { name : Text
        -- Skill identifier (matches directory name, e.g., "code-review")

      , description : Text
        -- What the skill does and when to use it

      , path : Optional Text
        -- Relative path to the skill directory (e.g., ".claude/skills/code-review")

      , tools : List SkillTool.Type
        -- Tools the skill uses, with language annotations

      , compatibility : Optional Text
        -- Environment requirements (e.g., "Requires git, docker")

      , metadata : List { mapKey : Text, mapValue : Text }
        -- Arbitrary key-value pairs (author, version, etc.)
      }

let SkillInput = { name : Text, description : Text }

let skillDefault =
      { path = None Text
      , tools = [] : List SkillTool.Type
      , compatibility = None Text
      , metadata = [] : List { mapKey : Text, mapValue : Text }
      }

let mkSkill =
      \(input : SkillInput) -> ((skillDefault // input) : SkillType)

in  { Type = SkillType, Input = SkillInput, default = skillDefault, mk = mkSkill }
