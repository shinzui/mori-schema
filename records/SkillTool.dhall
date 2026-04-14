-- SkillTool.dhall
-- A tool used by a skill, with language annotations

let Language = ../types/Language.dhall

let SkillToolType =
      { name : Text
        -- Tool identifier (e.g., "eslint-runner", "security-scanner")

      , description : Optional Text
        -- What this tool does

      , languages : List Language
        -- Programming languages the tool's scripts are written in
      }

let SkillToolInput = { name : Text }

let skillToolDefault =
      { description = None Text, languages = [] : List Language }

let mkSkillTool =
      \(input : SkillToolInput) ->
        ((skillToolDefault // input) : SkillToolType)

in  { Type = SkillToolType
    , Input = SkillToolInput
    , default = skillToolDefault
    , mk = mkSkillTool
    }
