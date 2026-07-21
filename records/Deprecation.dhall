-- Deprecation.dhall
-- Guidance for consumers of a deprecated project or package
let DeprecationType = { alternative : Optional Text, details : Optional Text }

let DeprecationInput = {}

let deprecationDefault = { alternative = None Text, details = None Text }

let mkDeprecation =
      \(input : DeprecationInput) ->
        deprecationDefault // input : DeprecationType

in  { Type = DeprecationType
    , Input = DeprecationInput
    , default = deprecationDefault
    , mk = mkDeprecation
    }
