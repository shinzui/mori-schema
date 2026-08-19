-- WorkflowExternalWait.dhall
-- A durable wait resumed by a callback from outside the workflow runtime.
let WorkflowExternalWaitType =
      { key : Text
      , name : Text
      , description : Optional Text
      , callbackIdentity : Text
      , wakeSource : Text
      }

let WorkflowExternalWaitInput =
      { key : Text, name : Text, callbackIdentity : Text, wakeSource : Text }

let workflowExternalWaitDefault = { description = None Text }

let mkWorkflowExternalWait =
      \(input : WorkflowExternalWaitInput) ->
        workflowExternalWaitDefault // input : WorkflowExternalWaitType

in  { Type = WorkflowExternalWaitType
    , Input = WorkflowExternalWaitInput
    , default = workflowExternalWaitDefault
    , mk = mkWorkflowExternalWait
    }
