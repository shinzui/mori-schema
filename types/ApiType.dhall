-- ApiType.dhall
-- Type of API specification

< OpenAPI     -- OpenAPI/Swagger specification
| GraphQL     -- GraphQL schema
| GRPC        -- gRPC/Protobuf
| AsyncAPI    -- AsyncAPI for event-driven APIs
| Smithy      -- AWS Smithy
| Other : Text
>
