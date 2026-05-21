-- BoundedContext.dhall
-- A bounded context: a boundary within which a model is consistent.

let BoundedContextType =
      { key : Text
      , name : Text
      , purpose : Optional Text
      , subdomain : Optional Text
      }

let BoundedContextInput = { key : Text, name : Text }

let boundedContextDefault =
      { purpose = None Text, subdomain = None Text }

let mkBoundedContext =
      \(input : BoundedContextInput) ->
        ((boundedContextDefault // input) : BoundedContextType)

in  { Type = BoundedContextType
    , Input = BoundedContextInput
    , default = boundedContextDefault
    , mk = mkBoundedContext
    }
