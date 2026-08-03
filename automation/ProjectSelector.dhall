-- Payload for Schema.EventSelector.ProjectSelector.
-- Empty lists are wildcards. Imported bootstrap facts require an explicit
-- `includeImported = True` opt-in and never match Added actions.
let ProjectSignalAggregate = ./ProjectSignalAggregate.dhall

let ProjectSignalFamily = ./ProjectSignalFamily.dhall

let ProjectSignalAction = ./ProjectSignalAction.dhall

let ProjectArtifactKind = ./ProjectArtifactKind.dhall

let ProjectSelectorType =
      { name : Text
      , aggregates : List ProjectSignalAggregate
      , families : List ProjectSignalFamily
      , artifactKinds : List ProjectArtifactKind
      , actions : List ProjectSignalAction
      , eventTypes : List Text
      , projectIds : List Text
      , references : List Text
      , includeImported : Bool
      }

let ProjectSelectorInput = { name : Text }

let projectSelectorDefault =
      { aggregates = [] : List ProjectSignalAggregate
      , families = [] : List ProjectSignalFamily
      , artifactKinds = [] : List ProjectArtifactKind
      , actions = [] : List ProjectSignalAction
      , eventTypes = [] : List Text
      , projectIds = [] : List Text
      , references = [] : List Text
      , includeImported = False
      }

let mkProjectSelector =
      \(input : ProjectSelectorInput) ->
        projectSelectorDefault // input : ProjectSelectorType

in  { Type = ProjectSelectorType
    , Input = ProjectSelectorInput
    , default = projectSelectorDefault
    , mk = mkProjectSelector
    }
