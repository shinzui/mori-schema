-- Automation.dhall
-- Root type for mori.automation.dhall automation configuration.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.Automation::{=}` for a trivial (all-defaulted) automation
-- config or `Schema.Automation::{ reactions = [ … ] }` to override
-- just one field.

let EventSelector = ./EventSelector.dhall

let Reaction = ./Reaction.dhall

let ExecutionPolicy = ./ExecutionPolicy.dhall

let SignalConsent = ./SignalConsent.dhall

let SignalBounds = ./SignalBounds.dhall

let AutomationType =
      { events : List EventSelector
        -- Event selectors that define which events to watch

      , reactions : List Reaction.Type
        -- Reactions that fire when selectors match

      , execution : ExecutionPolicy.Type
        -- Controls how actions are executed

      , queued : Bool
        -- When True, every reaction this automation triggers (immediate and
        -- scheduled) is placed on the `queued_reactions` FIFO pgmq queue and
        -- executed in strict trigger order, one at a time, grouped by
        -- "<repoId>:<automationName>". Defaults to False (unchanged behavior).

      , consent : Optional SignalConsent.Type
        -- Optional source-project allowlist for incoming signals

      , signalBounds : Optional SignalBounds.Type
        -- Optional fan-out and chain-depth limits for emitted signals
      }

let AutomationInput = {}

let automationDefault =
      { events = [] : List EventSelector
      , reactions = [] : List Reaction.Type
      , execution = ExecutionPolicy.default
      , queued = False
      , consent = None SignalConsent.Type
      , signalBounds = None SignalBounds.Type
      }

let mkAutomation =
      \(input : AutomationInput) ->
        ((automationDefault // input) : AutomationType)

in  { Type = AutomationType
    , Input = AutomationInput
    , default = automationDefault
    , mk = mkAutomation
    }
