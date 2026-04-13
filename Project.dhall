-- Project.dhall
-- Root type for mori.dhall project manifests
--
-- This is the main schema for Mori project identity.
-- Every Mori-aware project has a mori.dhall that conforms to this type.

let Language = ./types/Language.dhall
let PackageType = ./types/PackageType.dhall
let Lifecycle = ./types/Lifecycle.dhall
let Origin = ./types/Origin.dhall

let Repo = ./records/Repo.dhall
let Package = ./records/Package.dhall
let PackageBundle = ./records/PackageBundle.dhall
let Api = ./records/Api.dhall
let AgentHint = ./records/AgentHint.dhall
let Skill = ./records/Skill.dhall
let Subagent = ./records/Subagent.dhall
let DocRef = ./records/DocRef.dhall
let SeihouTemplate = ./records/SeihouTemplate.dhall

in  { project :
        { name : Text
          -- Project name (unique within namespace)

        , namespace : Text
          -- Organization namespace (e.g., "acme")
          -- Used for registry identity: @namespace/name

        , type : PackageType
          -- Primary project type

        , description : Optional Text
          -- Brief description

        , language : Language
          -- Primary language

        , lifecycle : Lifecycle
          -- Project lifecycle stage

        , domains : List Text
          -- High-level domain tags (e.g., "Billing", "Platform")

        , owners : List Text
          -- Team or individual owners

        , origin : Origin
          -- Whether this project is user-owned or third-party
        }

    , repos : List Repo
      -- Repository references

    , packages : List Package
      -- Packages in this project

    , bundles : List PackageBundle
      -- Package bundles (for wrapper projects)

    , dependencies : List Text
      -- Project-level dependencies, resolved by name via the local registry.
      -- For fine-grained control (augmentation, path overrides), declare
      -- dependencies at the Package level using the Dependency union type.

    , apis : List Api
      -- APIs defined by this project

    , agents : List AgentHint
      -- Hints for AI coding agents

    , skills : List Skill
      -- Agent skills provided by this project

    , subagents : List Subagent
      -- Subagent definitions

    , standards : List Text
      -- Names of standard projects this project follows

    , docs : List DocRef
      -- Project-level documentation

    , templates : List SeihouTemplate
      -- Seihou templates (scaffold modules) this project ships for
      -- other consumers. See records/SeihouTemplate.dhall.
    }
