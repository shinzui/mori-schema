-- Reaction.dhall
-- A reaction definition binding event selectors to actions.
--
-- Exports { Input, Type, default, mk }. `name`, `on`, and `actions` are
-- required: a reaction with `on = []` never fires and one with
-- `actions = []` is a no-op — both silent failures are caught better at
-- parse time. `schedule` is optional and defaults to `None Schedule.Type`
-- so existing callers that wrote `Schema.Reaction::{ name, on, actions }`
-- continue to work unchanged.

let ReactionAction = ./ReactionAction.dhall

let Schedule = ./Schedule.dhall

let ReactionType =
      { name : Text
        -- Unique reaction name

      , on : List Text
        -- Names of event selectors that trigger this reaction

      , actions : List ReactionAction
        -- Actions to execute when triggered

      , schedule : Optional Schedule.Type
        -- Optional per-reaction scheduling. When Some, the reaction's
        -- actions are enqueued on the `scheduled_reactions` pgmq queue
        -- rather than running inline.
      }

let ReactionInput =
      { name : Text, on : List Text, actions : List ReactionAction }

let reactionDefault = { schedule = None Schedule.Type }

let mkReaction =
      \(input : ReactionInput) -> ((reactionDefault // input) : ReactionType)

in  { Type = ReactionType
    , Input = ReactionInput
    , default = reactionDefault
    , mk = mkReaction
    }
