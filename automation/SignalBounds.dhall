-- SignalBounds.dhall
-- Per-emitter bounds for concrete fan-out and recursive signal chains.
let SignalBoundsType = { maxFanOut : Natural, maxChainDepth : Natural }

let SignalBoundsInput = {} : Type

let signalBoundsDefault = { maxFanOut = 25, maxChainDepth = 8 }

let mkSignalBounds =
      \(_ : SignalBoundsInput) -> signalBoundsDefault // {=} : SignalBoundsType

in  { Type = SignalBoundsType
    , Input = SignalBoundsInput
    , default = signalBoundsDefault
    , mk = mkSignalBounds
    }
