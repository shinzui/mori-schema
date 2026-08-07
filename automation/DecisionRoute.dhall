-- DecisionRoute.dhall
-- One declared outcome-to-signal route for Schema.DecisionAction.routes.
let DecisionRouteType =
      { outcome : Text
      , signalType : Text
      , targets : List Text
      , payload : List { mapKey : Text, mapValue : Text }
      }

let DecisionRouteInput =
      { outcome : Text, signalType : Text, targets : List Text }

let decisionRouteDefault =
      { payload = [] : List { mapKey : Text, mapValue : Text } }

let mkDecisionRoute =
      \(input : DecisionRouteInput) ->
        decisionRouteDefault // input : DecisionRouteType

in  { Type = DecisionRouteType
    , Input = DecisionRouteInput
    , default = decisionRouteDefault
    , mk = mkDecisionRoute
    }
