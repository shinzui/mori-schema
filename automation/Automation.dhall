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

let AutomationType =
      { events : List EventSelector
        -- Event selectors that define which events to watch

      , reactions : List Reaction.Type
        -- Reactions that fire when selectors match

      , execution : ExecutionPolicy.Type
        -- Controls how actions are executed
      }

let AutomationInput = {}

let automationDefault =
      { events = [] : List EventSelector
      , reactions = [] : List Reaction.Type
      , execution = ExecutionPolicy.default
      }

let mkAutomation =
      \(input : AutomationInput) ->
        ((automationDefault // input) : AutomationType)

in  { Type = AutomationType
    , Input = AutomationInput
    , default = automationDefault
    , mk = mkAutomation
    }
