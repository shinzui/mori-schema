-- Subdomain.dhall
-- A subdomain of the business domain (strategic design).

let SubdomainKind = ./SubdomainKind.dhall

let SubdomainType =
      { key : Text
      , name : Text
      , kind : SubdomainKind
      , description : Optional Text
      }

let SubdomainInput =
      { key : Text, name : Text, kind : SubdomainKind }

let subdomainDefault = { description = None Text }

let mkSubdomain =
      \(input : SubdomainInput) -> ((subdomainDefault // input) : SubdomainType)

in  { Type = SubdomainType
    , Input = SubdomainInput
    , default = subdomainDefault
    , mk = mkSubdomain
    }
