-- ScheduledAction.dhall
-- Non-recursive subset union of ReactionAction variants that can be
-- wrapped in Schedule (no Schedule-inside-Schedule).

let RunCommandAction = ./RunCommandAction.dhall

let EmitEventAction = ./EmitEventAction.dhall

let NotifyAction = ./NotifyAction.dhall

let SignalAction = ./SignalAction.dhall

in  < RunCommand : RunCommandAction.Type
    | EmitEvent : EmitEventAction.Type
    | Notify : NotifyAction.Type
    | Signal : SignalAction.Type
    >
