-- StandardProject.dhall
-- A project that defines shared standards

let Language = ../types/Language.dhall
let PackageType = ../types/PackageType.dhall
let StandardScope = ../types/StandardScope.dhall
let DocRef = ./DocRef.dhall
let Repo = ./Repo.dhall

let StandardProjectType =
      { name : Text
        -- Standard project name

      , scope : StandardScope
        -- What scope this standard applies to

      , description : Optional Text
        -- What this standard covers

      , repo : Repo.Type
        -- Where the standard is defined

      , docs : List DocRef.Type
        -- Documentation for the standard

      , appliesTo :
          { types : List PackageType
            -- Which project/package types this applies to
          , languages : List Language
            -- Which languages this applies to
          }
      }

let StandardProjectInput =
      { name : Text, scope : StandardScope, repo : Repo.Type }

let standardProjectDefault =
      { description = None Text
      , docs = [] : List DocRef.Type
      , appliesTo =
          { types = [] : List PackageType, languages = [] : List Language }
      }

let mkStandardProject =
      \(input : StandardProjectInput) ->
        ((standardProjectDefault // input) : StandardProjectType)

in  { Type = StandardProjectType
    , Input = StandardProjectInput
    , default = standardProjectDefault
    , mk = mkStandardProject
    }
