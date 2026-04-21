-- StepKind.dhall
-- What kind of step this is, at a glance.
--
-- The `command` and `successCriteria` fields of a ChecklistItem are only
-- meaningful for `Command` and `Verify` kinds; for `Manual` and
-- `Informational` they are typically omitted.

< Manual
| Command
| Verify
| Informational
| Other : Text
>
