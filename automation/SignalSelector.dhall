-- SignalSelector.dhall
-- Payload for Schema.EventSelector.SignalSelector.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.EventSelector.SignalSelector Schema.SignalSelector::{ name = "..." }`
-- and omit signalTypes/sourceProjects.

let SignalSelectorType =
      { name : Text
        -- Unique selector name for referencing in reactions

      , signalTypes : List Text
        -- Signal types to match (empty = match all)

      , sourceProjects : List Text
        -- Source project names to match (empty = match all)
      }

let SignalSelectorInput = { name : Text }

let signalSelectorDefault =
      { signalTypes = [] : List Text, sourceProjects = [] : List Text }

let mkSignalSelector =
      \(input : SignalSelectorInput) ->
        ((signalSelectorDefault // input) : SignalSelectorType)

in  { Type = SignalSelectorType
    , Input = SignalSelectorInput
    , default = signalSelectorDefault
    , mk = mkSignalSelector
    }
