-- ProjectIdentity.dhall
-- Identity block embedded inside Project.project.
--
-- Extracted from the bare inline record on Project so consumers can
-- write `Schema.ProjectIdentity::{ … }` and omit fields that have
-- sensible defaults (description, domains, owners, origin).

let Language = ../types/Language.dhall
let PackageType = ../types/PackageType.dhall
let Lifecycle = ../types/Lifecycle.dhall
let Origin = ../types/Origin.dhall

let ProjectIdentityType =
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

let ProjectIdentityInput =
      { name : Text
      , namespace : Text
      , type : PackageType
      , language : Language
      , lifecycle : Lifecycle
      }

let projectIdentityDefault =
      { description = None Text
      , domains = [] : List Text
      , owners = [] : List Text
      , origin = Origin.Own
      }

let mkProjectIdentity =
      \(input : ProjectIdentityInput) ->
        ((projectIdentityDefault // input) : ProjectIdentityType)

in  { Type = ProjectIdentityType
    , Input = ProjectIdentityInput
    , default = projectIdentityDefault
    , mk = mkProjectIdentity
    }
