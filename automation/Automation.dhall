-- Automation.dhall
-- Root type for mori.automation.dhall automation configuration

let EventSelector = ./EventSelector.dhall
let Reaction = ./Reaction.dhall
let ExecutionPolicy = ./ExecutionPolicy.dhall

in  { events : List EventSelector
      -- Event selectors that define which events to watch

    , reactions : List Reaction
      -- Reactions that fire when selectors match

    , execution : ExecutionPolicy
      -- Controls how actions are executed
    }
