-- SeihouTemplate.dhall
-- A seihou module (template/scaffold) shipped by this project.
-- Seihou is the user's preferred templating system and the only
-- first-class engine Mori currently models. A SeihouTemplate is a
-- projection of the fields of seihou's Module.dhall that the Mori
-- registry needs to catalog, filter, and render. See seihou's own
-- schema/Module.dhall for the authoritative module shape.

let SeihouTemplateType =
      { name : Text
        -- Seihou module name; matches [a-z][a-z0-9-]*

      , description : Optional Text
        -- One-line description (mirrors the module's description field)

      , version : Optional Text
        -- Semantic version pinned in module.dhall

      , modulePath : Text
        -- Path to the module directory, relative to the repo root.
        -- "." for a single-module repository (module.dhall at root).
        -- e.g. "nix-flake" for a multi-module registry entry.

      , tags : List Text
        -- Free-form tags for filtering, e.g. [ "haskell", "cabal" ]

      , dependencies : List Text
        -- Names of other seihou modules this template composes.

      , requiredVars : List Text
        -- Names of variables the user must supply to instantiate the
        -- template. Exposed for listing — the authoritative variable
        -- schema (types, defaults, validations) lives in the module's
        -- own module.dhall.
      }

let SeihouTemplateInput = { name : Text, modulePath : Text }

let seihouTemplateDefault =
      { description = None Text
      , version = None Text
      , tags = [] : List Text
      , dependencies = [] : List Text
      , requiredVars = [] : List Text
      }

let mkSeihouTemplate =
      \(input : SeihouTemplateInput) ->
        ((seihouTemplateDefault // input) : SeihouTemplateType)

in  { Type = SeihouTemplateType
    , Input = SeihouTemplateInput
    , default = seihouTemplateDefault
    , mk = mkSeihouTemplate
    }
