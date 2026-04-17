-- ReactionAction.dhall
-- Union type for automation reaction actions. Each variant's payload
-- lives in a dedicated mk-form bundle.

let RunCommandAction = ./RunCommandAction.dhall

let EmitEventAction = ./EmitEventAction.dhall

let NotifyAction = ./NotifyAction.dhall

let ScheduleAction = ./ScheduleAction.dhall

let SignalAction = ./SignalAction.dhall

in  < RunCommand : RunCommandAction.Type
    | EmitEvent : EmitEventAction.Type
    | Notify : NotifyAction.Type
    | Schedule : ScheduleAction.Type
    | Signal : SignalAction.Type
    >
