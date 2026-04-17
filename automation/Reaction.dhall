-- Reaction.dhall
-- A reaction definition binding event selectors to actions.
--
-- Exports { Input, Type, default, mk }. All three fields are required:
-- a reaction with `on = []` never fires and one with `actions = []` is
-- a no-op — both silent failures are caught better at parse time.

let ReactionAction = ./ReactionAction.dhall

let ReactionType =
      { name : Text
        -- Unique reaction name

      , on : List Text
        -- Names of event selectors that trigger this reaction

      , actions : List ReactionAction
        -- Actions to execute when triggered
      }

let ReactionInput =
      { name : Text, on : List Text, actions : List ReactionAction }

let reactionDefault = {=}

let mkReaction =
      \(input : ReactionInput) -> ((reactionDefault // input) : ReactionType)

in  { Type = ReactionType
    , Input = ReactionInput
    , default = reactionDefault
    , mk = mkReaction
    }
