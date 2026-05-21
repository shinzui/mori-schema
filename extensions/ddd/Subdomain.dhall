-- Subdomain.dhall
-- A subdomain of the business domain (strategic design).

let SubdomainKind = ./SubdomainKind.dhall

let WardleyStage = ./WardleyStage.dhall

let SubdomainType =
      { key : Text
      , name : Text
      , kind : SubdomainKind
      , description : Optional Text
      , evolution : Optional WardleyStage
      }

let SubdomainInput =
      { key : Text, name : Text, kind : SubdomainKind }

let subdomainDefault =
      { description = None Text, evolution = None WardleyStage }

let mkSubdomain =
      \(input : SubdomainInput) -> ((subdomainDefault // input) : SubdomainType)

in  { Type = SubdomainType
    , Input = SubdomainInput
    , default = subdomainDefault
    , mk = mkSubdomain
    }
