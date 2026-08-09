-- ApiDependency.dhall
-- A package's relationship to an API

let ApiDependencyRole = ../types/ApiDependencyRole.dhall
let MoriRef = ./MoriRef.dhall

let ApiDependencyType =
      { package : Text
        -- Name of the package

      , packageRef : Optional MoriRef.Type
        -- Typed companion for package

      , role : ApiDependencyRole
        -- Client or Consumer
      }

let ApiDependencyInput = { package : Text, role : ApiDependencyRole }

let apiDependencyDefault = { packageRef = None MoriRef.Type }

let mkApiDependency =
      \(input : ApiDependencyInput) ->
        ((apiDependencyDefault // input) : ApiDependencyType)

in  { Type = ApiDependencyType
    , Input = ApiDependencyInput
    , default = apiDependencyDefault
    , mk = mkApiDependency
    }
