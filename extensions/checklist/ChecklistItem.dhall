-- ChecklistItem.dhall
-- A single step in a checklist.
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `Checklist.ChecklistItem::{ key, title, kind }` and never have to
-- touch the call site when new optional fields are added upstream.

let StepKind = ./StepKind.dhall

let ChecklistItemType =
      { key : Text
        -- Unique identifier within this checklist (stable across edits)

      , title : Text
        -- Short imperative phrase ("Install dependencies", "Verify schema is up")

      , kind : StepKind
        -- Manual, Command, Verify, Informational, or Other

      , description : Optional Text
        -- Free-form elaboration if the title alone isn't enough

      , command : Optional Text
        -- Shell command to run. Only meaningful for Command and Verify kinds.
        -- The CLI does NOT execute this; it is surfaced for agents and humans.

      , successCriteria : Optional Text
        -- What "done" looks like for this step. For Verify steps this is the
        -- expected observation; for Command steps it is the post-condition.

      , preconditions : List Text
        -- Keys of other items in this checklist that must precede this one.
        -- The loader validates that every referenced key exists and appears
        -- earlier in the list.

      , tags : List Text
        -- Freeform labels for filtering.
      }

let ChecklistItemInput =
      { key : Text, title : Text, kind : StepKind }

let checklistItemDefault =
      { description = None Text
      , command = None Text
      , successCriteria = None Text
      , preconditions = [] : List Text
      , tags = [] : List Text
      }

let mkChecklistItem =
      \(input : ChecklistItemInput) ->
        ((checklistItemDefault // input) : ChecklistItemType)

in  { Type = ChecklistItemType
    , Input = ChecklistItemInput
    , default = checklistItemDefault
    , mk = mkChecklistItem
    }
