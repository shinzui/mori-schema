-- ProcessManager.dhall
-- A stateful coordinator that correlates messages and owns durable progress.
let MoriRef = ../../records/MoriRef.dhall

let ContextStatus = ./ContextStatus.dhall

let CoordinationMessage = ./CoordinationMessage.dhall

let CoordinationTimer = ./CoordinationTimer.dhall

let ProcessManagerType =
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
      , durableState : List Text
      , correlationKeys : List Text
      , correlationRule : Text
      , transactionBoundary : Text
      , timers : List CoordinationTimer.Type
      , idempotencyStrategy : Text
      , retryPolicy : Text
      , deadLetterPolicy : Text
      , repairProcedure : Text
      , replayEvidence : Text
      }

let ProcessManagerInput =
      { key : Text
      , name : Text
      , context : Text
      , durableState : List Text
      , correlationKeys : List Text
      , correlationRule : Text
      , transactionBoundary : Text
      , idempotencyStrategy : Text
      , retryPolicy : Text
      , deadLetterPolicy : Text
      , repairProcedure : Text
      , replayEvidence : Text
      }

let processManagerDefault =
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
      , timers = [] : List CoordinationTimer.Type
      }

let mkProcessManager =
      \(input : ProcessManagerInput) ->
        processManagerDefault // input : ProcessManagerType

in  { Type = ProcessManagerType
    , Input = ProcessManagerInput
    , default = processManagerDefault
    , mk = mkProcessManager
    }
