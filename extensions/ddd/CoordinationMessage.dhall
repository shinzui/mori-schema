-- CoordinationMessage.dhall
-- A message consumed or emitted by a coordination mechanism.
let MessageKind = ./MessageKind.dhall

let CoordinationMessageType = { message : Text, kind : MessageKind }

let CoordinationMessageInput = CoordinationMessageType

let coordinationMessageDefault = {=}

let mkCoordinationMessage =
      \(input : CoordinationMessageInput) ->
        coordinationMessageDefault // input : CoordinationMessageType

in  { Type = CoordinationMessageType
    , Input = CoordinationMessageInput
    , default = coordinationMessageDefault
    , mk = mkCoordinationMessage
    }
