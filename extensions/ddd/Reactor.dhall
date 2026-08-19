-- Reactor.dhall
-- A stateless, idempotent reaction to one domain event.
let MoriRef = ../../records/MoriRef.dhall

let ContextStatus = ./ContextStatus.dhall

let CoordinationMessage = ./CoordinationMessage.dhall

let ReactorType =
      { key : Text
      , name : Text
      , context : Text
      , contextRef : Optional MoriRef.Type
      , description : Optional Text
      , consumes : List CoordinationMessage.Type
      , emits : List CoordinationMessage.Type
      , participants : List Text
      , participantRefs : List MoriRef.Type
      , implementation : Optional Text
      , implementationRef : Optional MoriRef.Type
      , flows : List Text
      , flowRefs : List MoriRef.Type
      , status : Optional ContextStatus
      , trigger : CoordinationMessage.Type
      , actions : List Text
      , idempotencyStrategy : Text
      , ownsDurableState : Bool
      , ownsTimers : Bool
      }

let ReactorInput =
      { key : Text
      , name : Text
      , context : Text
      , trigger : CoordinationMessage.Type
      , actions : List Text
      , idempotencyStrategy : Text
      }

let reactorDefault =
      { contextRef = None MoriRef.Type
      , description = None Text
      , consumes = [] : List CoordinationMessage.Type
      , emits = [] : List CoordinationMessage.Type
      , participants = [] : List Text
      , participantRefs = [] : List MoriRef.Type
      , implementation = None Text
      , implementationRef = None MoriRef.Type
      , flows = [] : List Text
      , flowRefs = [] : List MoriRef.Type
      , status = None ContextStatus
      , ownsDurableState = False
      , ownsTimers = False
      }

let mkReactor = \(input : ReactorInput) -> reactorDefault // input : ReactorType

in  { Type = ReactorType
    , Input = ReactorInput
    , default = reactorDefault
    , mk = mkReactor
    }
