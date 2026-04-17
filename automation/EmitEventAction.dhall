-- EmitEventAction.dhall
-- Payload for Schema.ReactionAction.EmitEvent.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.ReactionAction.EmitEvent Schema.EmitEventAction::{ eventType = "..." , streamName = "..." }`
-- and omit eventData.

let EmitEventActionType =
      { eventType : Text
        -- Type tag for the emitted event

      , streamName : Text
        -- Stream name the event is written to

      , eventData : List { mapKey : Text, mapValue : Text }
        -- Additional event data as key/value pairs
      }

let EmitEventActionInput = { eventType : Text, streamName : Text }

let emitEventActionDefault =
      { eventData = [] : List { mapKey : Text, mapValue : Text } }

let mkEmitEventAction =
      \(input : EmitEventActionInput) ->
        ((emitEventActionDefault // input) : EmitEventActionType)

in  { Type = EmitEventActionType
    , Input = EmitEventActionInput
    , default = emitEventActionDefault
    , mk = mkEmitEventAction
    }
