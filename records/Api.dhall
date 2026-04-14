-- Api.dhall
-- API definition

let ApiType = ../types/ApiType.dhall
let ApiDependency = ./ApiDependency.dhall
let ApiUpdatePolicy = ./ApiUpdatePolicy.dhall

let ApiRecordType =
      { name : Text
        -- API name

      , type : ApiType
        -- API specification type (OpenAPI, GraphQL, etc.)

      , specPath : Text
        -- Path to the API specification file

      , owner : Text
        -- Package name that owns this API

      , dependencies : List ApiDependency.Type
        -- Packages that depend on this API

      , updatePolicy : Optional ApiUpdatePolicy.Type
        -- Policy for propagating updates
      }

let ApiRecordInput =
      { name : Text, type : ApiType, specPath : Text, owner : Text }

let apiRecordDefault =
      { dependencies = [] : List ApiDependency.Type
      , updatePolicy = None ApiUpdatePolicy.Type
      }

let mkApiRecord =
      \(input : ApiRecordInput) ->
        ((apiRecordDefault // input) : ApiRecordType)

in  { Type = ApiRecordType
    , Input = ApiRecordInput
    , default = apiRecordDefault
    , mk = mkApiRecord
    }
