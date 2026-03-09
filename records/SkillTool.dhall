-- SkillTool.dhall
-- A tool used by a skill, with language annotations

let Language = ../types/Language.dhall

in  { name : Text
      -- Tool identifier (e.g., "eslint-runner", "security-scanner")

    , description : Optional Text
      -- What this tool does

    , languages : List Language
      -- Programming languages the tool's scripts are written in
    }
