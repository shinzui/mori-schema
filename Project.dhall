-- Project.dhall
-- Root type for mori.dhall project manifests
--
-- This is the main schema for Mori project identity.
-- Every Mori-aware project has a mori.dhall that conforms to this type.
--
-- Exported as the { Input, Type, default, mk } bundle so consumers can
-- write `Schema.Project::{ project = Schema.ProjectIdentity::{ … } }`
-- and omit every list-valued field that is empty by default.

let Repo = ./records/Repo.dhall
let Package = ./records/Package.dhall
let PackageBundle = ./records/PackageBundle.dhall
let Api = ./records/Api.dhall
let AgentHint = ./records/AgentHint.dhall
let Skill = ./records/Skill.dhall
let Subagent = ./records/Subagent.dhall
let DocRef = ./records/DocRef.dhall
let SeihouTemplate = ./records/SeihouTemplate.dhall
let OkfBundle = ./records/OkfBundle.dhall
let OkfProfile = ./records/OkfProfile.dhall
let ProjectIdentity = ./records/ProjectIdentity.dhall
let MoriRef = ./records/MoriRef.dhall

let ProjectType =
      { project : ProjectIdentity.Type

      , repos : List Repo.Type
        -- Repository references

      , packages : List Package.Type
        -- Packages in this project

      , bundles : List PackageBundle.Type
        -- Package bundles (for wrapper projects)

      , dependencies : List Text
        -- Project-level dependencies, resolved by name via the local registry.
        -- For fine-grained control (augmentation, path overrides), declare
        -- dependencies at the Package level using the Dependency union type.

      , dependencyRefs : List MoriRef.Type
        -- Typed companions for dependencies. The untyped sibling remains for
        -- compatibility and bare-name dependency resolution.

      , apis : List Api.Type
        -- APIs defined by this project

      , agents : List AgentHint.Type
        -- Hints for AI coding agents

      , skills : List Skill.Type
        -- Agent skills provided by this project

      , subagents : List Subagent.Type
        -- Subagent definitions

      , standards : List Text
        -- Names of standard projects this project follows

      , standardRefs : List MoriRef.Type
        -- Typed companions for standards. The untyped sibling remains for
        -- compatibility.

      , docs : List DocRef.Type
        -- Project-level documentation

      , templates : List SeihouTemplate.Type
        -- Seihou templates (scaffold modules) this project ships for
        -- other consumers. See records/SeihouTemplate.dhall.

      , okfBundles : List OkfBundle.Type
        -- OKF knowledge bundles owned by this project. Distinct from
        -- `bundles` (PackageBundle): these are Markdown knowledge bundles.

      , profiles : List OkfProfile.Type
        -- OKF profiles published by this project and addressable through
        -- mori://<namespace>/<name>/profiles/<profile-name>.
      }

let ProjectInput = { project : ProjectIdentity.Type }

let projectDefault =
      { repos = [] : List Repo.Type
      , packages = [] : List Package.Type
      , bundles = [] : List PackageBundle.Type
      , dependencies = [] : List Text
      , dependencyRefs = [] : List MoriRef.Type
      , apis = [] : List Api.Type
      , agents = [] : List AgentHint.Type
      , skills = [] : List Skill.Type
      , subagents = [] : List Subagent.Type
      , standards = [] : List Text
      , standardRefs = [] : List MoriRef.Type
      , docs = [] : List DocRef.Type
      , templates = [] : List SeihouTemplate.Type
      , okfBundles = [] : List OkfBundle.Type
      , profiles = [] : List OkfProfile.Type
      }

let mkProject =
      \(input : ProjectInput) -> ((projectDefault // input) : ProjectType)

in  { Type = ProjectType
    , Input = ProjectInput
    , default = projectDefault
    , mk = mkProject
    }
