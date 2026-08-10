-- ExtensionKindDecl.dhall
-- URI grammar and entity extraction metadata contributed by an extension.
let KeyArity = < One | Exactly : Natural | OneOr : Natural >

let NestedKind = { marker : Text, greedy : Bool }

let ExtensionKindDeclType =
      { name : Text
      , pathSegments : List Text
      , compactToken : Text
      , keyArity : KeyArity
      , nested : Optional NestedKind
      , entityPath : Text
      , keyField : Text
      , displayName : Text
      }

let ExtensionKindDeclInput = ExtensionKindDeclType

let extensionKindDeclDefault = {=}

let mkExtensionKindDecl =
      \(input : ExtensionKindDeclInput) ->
        extensionKindDeclDefault // input : ExtensionKindDeclType

in  { Type = ExtensionKindDeclType
    , Input = ExtensionKindDeclInput
    , default = extensionKindDeclDefault
    , mk = mkExtensionKindDecl
    }
