-- JoinLeg.dhall
-- One named signal predicate contributing to a fan-in join.
let SignalPayloadPredicate = ./SignalPayloadPredicate.dhall

let JoinLegType =
      { name : Text
      , signalType : Text
      , payloadPredicates : List SignalPayloadPredicate.Type
      }

let JoinLegInput = { name : Text, signalType : Text }

let joinLegDefault =
      { payloadPredicates = [] : List SignalPayloadPredicate.Type }

let mkJoinLeg = \(input : JoinLegInput) -> joinLegDefault // input : JoinLegType

in  { Type = JoinLegType
    , Input = JoinLegInput
    , default = joinLegDefault
    , mk = mkJoinLeg
    }
