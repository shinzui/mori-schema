-- Aggregate.dhall
-- An aggregate: a cluster of entities with a consistency boundary
-- (tactical design).

let AggregateType =
      { key : Text
      , name : Text
      , context : Optional Text
      , description : Optional Text
      , commands : List Text
      , events : List Text
      , invariants : List Text
      }

let AggregateInput = { key : Text, name : Text }

let aggregateDefault =
      { context = None Text
      , description = None Text
      , commands = [] : List Text
      , events = [] : List Text
      , invariants = [] : List Text
      }

let mkAggregate =
      \(input : AggregateInput) -> ((aggregateDefault // input) : AggregateType)

in  { Type = AggregateType
    , Input = AggregateInput
    , default = aggregateDefault
    , mk = mkAggregate
    }
