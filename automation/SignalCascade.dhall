-- SignalCascade.dhall
-- Explicit authorization and traversal policy for a dependency cascade.

let DependencyScope = ../types/DependencyScope.dhall

let SignalCascadeType =
      { scopes : List DependencyScope, maxDepth : Natural }

let SignalCascadeInput = {} : Type

let signalCascadeDefault =
      { scopes = [ DependencyScope.Regular ], maxDepth = 32 }

let mkSignalCascade =
      \(input : SignalCascadeInput) ->
        ((signalCascadeDefault // input) : SignalCascadeType)

in  { Type = SignalCascadeType
    , Input = SignalCascadeInput
    , default = signalCascadeDefault
    , mk = mkSignalCascade
    }
