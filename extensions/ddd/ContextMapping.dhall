-- ContextMapping.dhall
-- A relationship between two bounded contexts (a context map edge).

let RelationshipPattern = ./RelationshipPattern.dhall

let TeamRelationship = ./TeamRelationship.dhall

let ContextMappingType =
      { upstream : Text
      , downstream : Text
      , pattern : RelationshipPattern
      , teamRelationship : Optional TeamRelationship
      , notes : Optional Text
      }

let ContextMappingInput =
      { upstream : Text, downstream : Text, pattern : RelationshipPattern }

let contextMappingDefault =
      { teamRelationship = None TeamRelationship, notes = None Text }

let mkContextMapping =
      \(input : ContextMappingInput) ->
        ((contextMappingDefault // input) : ContextMappingType)

in  { Type = ContextMappingType
    , Input = ContextMappingInput
    , default = contextMappingDefault
    , mk = mkContextMapping
    }
