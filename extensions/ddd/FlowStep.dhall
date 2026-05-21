-- FlowStep.dhall
-- A single ordered step in a message flow.

let MessageKind = ./MessageKind.dhall

let FlowStepType =
      { order : Natural
      , message : Text
      , kind : MessageKind
      , from : Text
      , to : Text
      , contents : Optional Text
      }

let FlowStepInput =
      { order : Natural
      , message : Text
      , kind : MessageKind
      , from : Text
      , to : Text
      }

let flowStepDefault = { contents = None Text }

let mkFlowStep =
      \(input : FlowStepInput) -> ((flowStepDefault // input) : FlowStepType)

in  { Type = FlowStepType
    , Input = FlowStepInput
    , default = flowStepDefault
    , mk = mkFlowStep
    }
