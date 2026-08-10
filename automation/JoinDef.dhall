-- JoinDef.dhall
-- A target-side fan-in rule over two or more signal legs.
let JoinLeg = ./JoinLeg.dhall

let SignalAction = ./SignalAction.dhall

let JoinDefType =
      { name : Text
      , legs : List JoinLeg.Type
      , correlationKey : Text
      , windowSeconds : Optional Natural
      , reaction : Text
      , onExpiry : Optional SignalAction.Type
      }

let JoinDefInput =
      { name : Text
      , legs : List JoinLeg.Type
      , correlationKey : Text
      , reaction : Text
      }

let joinDefDefault =
      { windowSeconds = None Natural, onExpiry = None SignalAction.Type }

let mkJoinDef = \(input : JoinDefInput) -> joinDefDefault // input : JoinDefType

in  { Type = JoinDefType
    , Input = JoinDefInput
    , default = joinDefDefault
    , mk = mkJoinDef
    }
