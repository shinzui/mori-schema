-- Reaction.dhall
-- A reaction definition binding event selectors to actions

let ReactionAction = ./ReactionAction.dhall

in  { name : Text
      -- Unique reaction name

    , on : List Text
      -- Names of event selectors that trigger this reaction

    , actions : List ReactionAction
      -- Actions to execute when triggered
    }
