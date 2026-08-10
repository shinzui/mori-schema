-- ExtensionSchemaPin.dhall
-- Local, hash-pinned schema imported by an installed declarative extension.
let ExtensionSchemaPinType =
      { url : Text, hash : Text, rootType : Text, entryRecord : Optional Text }

let ExtensionSchemaPinInput = { url : Text, hash : Text, rootType : Text }

let extensionSchemaPinDefault = { entryRecord = None Text }

let mkExtensionSchemaPin =
      \(input : ExtensionSchemaPinInput) ->
        extensionSchemaPinDefault // input : ExtensionSchemaPinType

in  { Type = ExtensionSchemaPinType
    , Input = ExtensionSchemaPinInput
    , default = extensionSchemaPinDefault
    , mk = mkExtensionSchemaPin
    }
