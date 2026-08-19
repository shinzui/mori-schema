-- DurableWorkflowStep.dhall
-- A named, replay-safe step in a durable workflow definition.
let DurableWorkflowStepType =
      { key : Text
      , name : Text
      , description : Optional Text
      , idempotencyStrategy : Text
      }

let DurableWorkflowStepInput =
      { key : Text, name : Text, idempotencyStrategy : Text }

let durableWorkflowStepDefault = { description = None Text }

let mkDurableWorkflowStep =
      \(input : DurableWorkflowStepInput) ->
        durableWorkflowStepDefault // input : DurableWorkflowStepType

in  { Type = DurableWorkflowStepType
    , Input = DurableWorkflowStepInput
    , default = durableWorkflowStepDefault
    , mk = mkDurableWorkflowStep
    }
