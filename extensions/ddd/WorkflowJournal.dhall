-- WorkflowJournal.dhall
-- Durable event history used to reconstruct a workflow.
let WorkflowJournalType =
      { name : Text, persistence : Text, retention : Optional Text }

let WorkflowJournalInput = { name : Text, persistence : Text }

let workflowJournalDefault = { retention = None Text }

let mkWorkflowJournal =
      \(input : WorkflowJournalInput) ->
        workflowJournalDefault // input : WorkflowJournalType

in  { Type = WorkflowJournalType
    , Input = WorkflowJournalInput
    , default = workflowJournalDefault
    , mk = mkWorkflowJournal
    }
