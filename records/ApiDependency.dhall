-- ApiDependency.dhall
-- A package's relationship to an API

let ApiDependencyRole = ../types/ApiDependencyRole.dhall

in  { package : Text
      -- Name of the package

    , role : ApiDependencyRole
      -- Client or Consumer
    }
