-- ApiDependency.dhall
-- A package's relationship to an API

let ApiDependencyRole = ../types/ApiDependencyRole.dhall

let ApiDependencyType =
      { package : Text
        -- Name of the package

      , role : ApiDependencyRole
        -- Client or Consumer
      }

let ApiDependencyInput = { package : Text, role : ApiDependencyRole }

let apiDependencyDefault = {=}

let mkApiDependency =
      \(input : ApiDependencyInput) ->
        ((apiDependencyDefault // input) : ApiDependencyType)

in  { Type = ApiDependencyType
    , Input = ApiDependencyInput
    , default = apiDependencyDefault
    , mk = mkApiDependency
    }
