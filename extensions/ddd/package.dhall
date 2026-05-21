-- package.dhall
-- Re-exports for convenient imports.
--
-- Usage in a mori/ddd.dhall:
--   let Ddd = https://raw.githubusercontent.com/.../extensions/ddd/package.dhall
--   in Ddd.DddModel::{ glossary = [ Ddd.GlossaryTerm::{ … } ] }

let DddModel = ./DddModel.dhall

let Subdomain = ./Subdomain.dhall

let BoundedContext = ./BoundedContext.dhall

let Aggregate = ./Aggregate.dhall

let ContextMapping = ./ContextMapping.dhall

let MessageFlow = ./MessageFlow.dhall

let FlowStep = ./FlowStep.dhall

let GlossaryTerm = ./GlossaryTerm.dhall

let Verification = ./Verification.dhall

let Collaborator = ./Collaborator.dhall

let SubdomainKind = ./SubdomainKind.dhall

let RelationshipPattern = ./RelationshipPattern.dhall

let TeamRelationship = ./TeamRelationship.dhall

let MessageKind = ./MessageKind.dhall

let WardleyStage = ./WardleyStage.dhall

let AggregateSize = ./AggregateSize.dhall

in  { DddModel
    , Subdomain
    , BoundedContext
    , Aggregate
    , ContextMapping
    , MessageFlow
    , FlowStep
    , GlossaryTerm
    , Verification
    , Collaborator
    , SubdomainKind
    , RelationshipPattern
    , TeamRelationship
    , MessageKind
    , WardleyStage
    , AggregateSize
    }
