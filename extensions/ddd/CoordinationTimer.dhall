-- CoordinationTimer.dhall
-- A timer owned by a stateful coordination mechanism.
let CoordinationMessage = ./CoordinationMessage.dhall

let CoordinationTimerType =
      { key : Text
      , name : Text
      , description : Optional Text
      , deadline : Text
      , emits : CoordinationMessage.Type
      }

let CoordinationTimerInput =
      { key : Text
      , name : Text
      , deadline : Text
      , emits : CoordinationMessage.Type
      }

let coordinationTimerDefault = { description = None Text }

let mkCoordinationTimer =
      \(input : CoordinationTimerInput) ->
        coordinationTimerDefault // input : CoordinationTimerType

in  { Type = CoordinationTimerType
    , Input = CoordinationTimerInput
    , default = coordinationTimerDefault
    , mk = mkCoordinationTimer
    }
