-- SignalPayloadPredicate.dhall
-- One conjunctive predicate applied to an incoming Signal payload.
-- All fields are required; the bundle shape remains consistent with other
-- record-completion types in mori-schema.
let PredicateTest = < Equals : Text | Prefix : Text | Exists >

let SignalPayloadPredicateType = { path : Text, test : PredicateTest }

let SignalPayloadPredicateInput = SignalPayloadPredicateType

let signalPayloadPredicateDefault = {=}

let mkSignalPayloadPredicate =
      \(input : SignalPayloadPredicateInput) ->
        signalPayloadPredicateDefault // input : SignalPayloadPredicateType

in  { Type = SignalPayloadPredicateType
    , Input = SignalPayloadPredicateInput
    , default = signalPayloadPredicateDefault
    , mk = mkSignalPayloadPredicate
    , PredicateTest
    }
