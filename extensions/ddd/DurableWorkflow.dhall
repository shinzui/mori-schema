-- DurableWorkflow.dhall
-- A versioned, journaled workflow with durable continuations and recovery.
let MoriRef = ../../records/MoriRef.dhall

let ContextStatus = ./ContextStatus.dhall

let CoordinationMessage = ./CoordinationMessage.dhall

let CoordinationTimer = ./CoordinationTimer.dhall

let WorkflowJournal = ./WorkflowJournal.dhall

let DurableWorkflowStep = ./DurableWorkflowStep.dhall

let WorkflowExternalWait = ./WorkflowExternalWait.dhall

let DurableWorkflowType =
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
      , definitionId : Text
      , definitionVersion : Text
      , journal : WorkflowJournal.Type
      , steps : List DurableWorkflowStep.Type
      , externalWaits : List WorkflowExternalWait.Type
      , timers : List CoordinationTimer.Type
      , wakeSources : List Text
      , progressMechanisms : List Text
      , terminalPolicy : Text
      , versioningPolicy : Text
      , replayEvidence : Text
      , recoveryProcedure : Text
      }

let DurableWorkflowInput =
      { key : Text
      , name : Text
      , context : Text
      , definitionId : Text
      , definitionVersion : Text
      , journal : WorkflowJournal.Type
      , steps : List DurableWorkflowStep.Type
      , terminalPolicy : Text
      , versioningPolicy : Text
      , replayEvidence : Text
      , recoveryProcedure : Text
      }

let durableWorkflowDefault =
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
      , externalWaits = [] : List WorkflowExternalWait.Type
      , timers = [] : List CoordinationTimer.Type
      , wakeSources = [] : List Text
      , progressMechanisms = [] : List Text
      }

let mkDurableWorkflow =
      \(input : DurableWorkflowInput) ->
        durableWorkflowDefault // input : DurableWorkflowType

in  { Type = DurableWorkflowType
    , Input = DurableWorkflowInput
    , default = durableWorkflowDefault
    , mk = mkDurableWorkflow
    }
