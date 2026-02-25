-- Api.dhall
-- API definition

let ApiType = ../types/ApiType.dhall
let ApiDependency = ./ApiDependency.dhall
let ApiUpdatePolicy = ./ApiUpdatePolicy.dhall

in  { name : Text
      -- API name

    , type : ApiType
      -- API specification type (OpenAPI, GraphQL, etc.)

    , specPath : Text
      -- Path to the API specification file

    , owner : Text
      -- Package name that owns this API

    , dependencies : List ApiDependency
      -- Packages that depend on this API

    , updatePolicy : Optional ApiUpdatePolicy
      -- Policy for propagating updates
    }
