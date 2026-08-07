-- DecisionAction.dhall
-- Payload for Schema.ReactionAction.Decision: run a decision producer,
-- validate its mori-decision/1 result envelope, checkpoint it, and route
-- declared outcomes to signals.
let DecisionRoute = ./DecisionRoute.dhall

let DecisionActionType =
      { command : Text
      , args : List Text
      , workingDir : Optional Text
      , timeout : Optional Natural
      , env : List { mapKey : Text, mapValue : Text }
      , resultFile : Optional Text
      , maxResultBytes : Optional Natural
      , routes : List DecisionRoute.Type
      }

let DecisionActionInput = { command : Text }

let decisionActionDefault =
      { args = [] : List Text
      , workingDir = None Text
      , timeout = None Natural
      , env = [] : List { mapKey : Text, mapValue : Text }
      , resultFile = None Text
      , maxResultBytes = None Natural
      , routes = [] : List DecisionRoute.Type
      }

let mkDecisionAction =
      \(input : DecisionActionInput) ->
        decisionActionDefault // input : DecisionActionType

in  { Type = DecisionActionType
    , Input = DecisionActionInput
    , default = decisionActionDefault
    , mk = mkDecisionAction
    }
