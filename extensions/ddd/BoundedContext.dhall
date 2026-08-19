-- BoundedContext.dhall
-- A bounded context: a boundary within which a model is consistent.
let MoriRef = ../../records/MoriRef.dhall

let ContextStatus = ./ContextStatus.dhall

let BoundedContextType =
      { key : Text
      , name : Text
      , purpose : Optional Text
      , subdomain : Optional Text
      , subdomainRef : Optional MoriRef.Type
      , status : Optional ContextStatus
      , supersedes : List Text
      , supersedesRefs : List MoriRef.Type
      }

let BoundedContextInput = { key : Text, name : Text }

let boundedContextDefault =
      { purpose = None Text
      , subdomain = None Text
      , subdomainRef = None MoriRef.Type
      , status = None ContextStatus
      , supersedes = [] : List Text
      , supersedesRefs = [] : List MoriRef.Type
      }

let mkBoundedContext =
      \(input : BoundedContextInput) ->
        boundedContextDefault // input : BoundedContextType

in  { Type = BoundedContextType
    , Input = BoundedContextInput
    , default = boundedContextDefault
    , mk = mkBoundedContext
    }
