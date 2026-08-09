-- ContextMapping.dhall
-- A relationship between two bounded contexts (a context map edge).

let RelationshipPattern = ./RelationshipPattern.dhall

let TeamRelationship = ./TeamRelationship.dhall

let MoriRef = ../../records/MoriRef.dhall

let ContextMappingType =
      { upstream : Text
      , upstreamRef : Optional MoriRef.Type
      , downstream : Text
      , downstreamRef : Optional MoriRef.Type
      , pattern : RelationshipPattern
      , teamRelationship : Optional TeamRelationship
      , notes : Optional Text
      }

let ContextMappingInput =
      { upstream : Text, downstream : Text, pattern : RelationshipPattern }

let contextMappingDefault =
      { upstreamRef = None MoriRef.Type
      , downstreamRef = None MoriRef.Type
      , teamRelationship = None TeamRelationship
      , notes = None Text
      }

let mkContextMapping =
      \(input : ContextMappingInput) ->
        ((contextMappingDefault // input) : ContextMappingType)

in  { Type = ContextMappingType
    , Input = ContextMappingInput
    , default = contextMappingDefault
    , mk = mkContextMapping
    }
