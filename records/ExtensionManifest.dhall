-- ExtensionManifest.dhall
-- Declarative metadata and URI grammar for a locally installed extension.
let ExtensionKindDecl = ./ExtensionKindDecl.dhall

let ExtensionSchemaPin = ./ExtensionSchemaPin.dhall

let ExtensionManifestType =
      { name : Text
      , version : Text
      , description : Text
      , filePath : Text
      , schema : ExtensionSchemaPin.Type
      , kinds : List ExtensionKindDecl.Type
      , edges : List Text
      , collectCanonicalRefs : Bool
      }

let ExtensionManifestInput =
      { name : Text
      , version : Text
      , description : Text
      , schema : ExtensionSchemaPin.Type
      }

let extensionManifestDefault =
      { filePath = ""
      , kinds = [] : List ExtensionKindDecl.Type
      , edges = [] : List Text
      , collectCanonicalRefs = True
      }

let mkExtensionManifest =
      \(input : ExtensionManifestInput) ->
        extensionManifestDefault // input : ExtensionManifestType

in  { Type = ExtensionManifestType
    , Input = ExtensionManifestInput
    , default = extensionManifestDefault
    , mk = mkExtensionManifest
    }
