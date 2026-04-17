-- SignalAction.dhall
-- Payload for Schema.ReactionAction.Signal.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.ReactionAction.Signal Schema.SignalAction::{ signalType = "..." }`
-- and omit targets/payload.

let SignalActionType =
      { signalType : Text
        -- Signal type tag dispatched to downstream projects

      , targets : List Text
        -- Target project names (empty = broadcast)

      , payload : List { mapKey : Text, mapValue : Text }
        -- Signal payload as key/value pairs
      }

let SignalActionInput = { signalType : Text }

let signalActionDefault =
      { targets = [] : List Text
      , payload = [] : List { mapKey : Text, mapValue : Text }
      }

let mkSignalAction =
      \(input : SignalActionInput) ->
        ((signalActionDefault // input) : SignalActionType)

in  { Type = SignalActionType
    , Input = SignalActionInput
    , default = signalActionDefault
    , mk = mkSignalAction
    }
