-- DddModel.dhall
-- Root type for the ddd extension. Every concern is an optional or
-- empty-defaulting list, so a team records only what it cares about:
-- `Ddd.DddModel::{=}` is a valid empty model.

let Subdomain = ./Subdomain.dhall

let BoundedContext = ./BoundedContext.dhall

let Aggregate = ./Aggregate.dhall

let ContextMapping = ./ContextMapping.dhall

let MessageFlow = ./MessageFlow.dhall

let GlossaryTerm = ./GlossaryTerm.dhall

let Verification = ./Verification.dhall

let Collaborator = ./Collaborator.dhall

let DddModelType =
      { domain : Optional Text
      , subdomains : List Subdomain.Type
      , contexts : List BoundedContext.Type
      , aggregates : List Aggregate.Type
      , mappings : List ContextMapping.Type
      , flows : List MessageFlow.Type
      , glossary : List GlossaryTerm.Type
      , verification : Optional Verification.Type
      , collaborators : List Collaborator.Type
      }

let DddModelInput = {}

let dddModelDefault =
      { domain = None Text
      , subdomains = [] : List Subdomain.Type
      , contexts = [] : List BoundedContext.Type
      , aggregates = [] : List Aggregate.Type
      , mappings = [] : List ContextMapping.Type
      , flows = [] : List MessageFlow.Type
      , glossary = [] : List GlossaryTerm.Type
      , verification = None Verification.Type
      , collaborators = [] : List Collaborator.Type
      }

let mkDddModel =
      \(input : DddModelInput) -> ((dddModelDefault // input) : DddModelType)

in  { Type = DddModelType
    , Input = DddModelInput
    , default = dddModelDefault
    , mk = mkDddModel
    }
