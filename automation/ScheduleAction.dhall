-- ScheduleAction.dhall
-- Payload for Schema.ReactionAction.Schedule.
--
-- Exports { Input, Type, default, mk }. Both delaySeconds and action
-- are required — a scheduled action has no meaningful default value
-- for either field.

let ScheduledAction = ./ScheduledAction.dhall

let ScheduleActionType =
      { delaySeconds : Integer
        -- How many seconds to wait before executing the action

      , action : ScheduledAction
        -- The action to execute after the delay
      }

let ScheduleActionInput =
      { delaySeconds : Integer, action : ScheduledAction }

let scheduleActionDefault = {=}

let mkScheduleAction =
      \(input : ScheduleActionInput) ->
        ((scheduleActionDefault // input) : ScheduleActionType)

in  { Type = ScheduleActionType
    , Input = ScheduleActionInput
    , default = scheduleActionDefault
    , mk = mkScheduleAction
    }
