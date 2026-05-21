-- Collaborator.dhall
-- A team or person and the bounded-context keys they own — the
-- "swimlane" of a collaborator on a strategic context map.

let CollaboratorType =
      { key : Text
      , name : Text
      , role : Optional Text
      , contexts : List Text
      }

let CollaboratorInput = { key : Text, name : Text }

let collaboratorDefault = { role = None Text, contexts = [] : List Text }

let mkCollaborator =
      \(input : CollaboratorInput) ->
        ((collaboratorDefault // input) : CollaboratorType)

in  { Type = CollaboratorType
    , Input = CollaboratorInput
    , default = collaboratorDefault
    , mk = mkCollaborator
    }
