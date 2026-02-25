-- StandardProject.dhall
-- A project that defines shared standards

let Language = ../types/Language.dhall
let PackageType = ../types/PackageType.dhall
let StandardScope = ../types/StandardScope.dhall
let DocRef = ./DocRef.dhall
let Repo = ./Repo.dhall

in  { name : Text
      -- Standard project name

    , scope : StandardScope
      -- What scope this standard applies to

    , description : Optional Text
      -- What this standard covers

    , repo : Repo
      -- Where the standard is defined

    , docs : List DocRef
      -- Documentation for the standard

    , appliesTo :
        { types : List PackageType
          -- Which project/package types this applies to
        , languages : List Language
          -- Which languages this applies to
        }
    }
