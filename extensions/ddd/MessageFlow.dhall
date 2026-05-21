-- MessageFlow.dhall
-- A named flow of messages (commands/events/queries) across contexts.

let FlowStep = ./FlowStep.dhall

let MessageFlowType =
      { key : Text
      , name : Text
      , description : Optional Text
      , steps : List FlowStep.Type
      }

let MessageFlowInput = { key : Text, name : Text }

let messageFlowDefault =
      { description = None Text, steps = [] : List FlowStep.Type }

let mkMessageFlow =
      \(input : MessageFlowInput) ->
        ((messageFlowDefault // input) : MessageFlowType)

in  { Type = MessageFlowType
    , Input = MessageFlowInput
    , default = messageFlowDefault
    , mk = mkMessageFlow
    }
