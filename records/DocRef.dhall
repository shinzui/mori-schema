-- DocRef.dhall
-- Reference to documentation

let DocKind = ../types/DocKind.dhall
let DocLocation = ../types/DocLocation.dhall
let DocAudience = ../types/DocAudience.dhall

let DocRefType =
      { key : Text
        -- Unique identifier for this doc reference

      , kind : DocKind
        -- What type of documentation this is

      , audience : DocAudience
        -- Who this documentation is for

      , description : Optional Text
        -- Brief description of the documentation

      , location : DocLocation
        -- Where the documentation is located
      }

let DocRefInput =
      { key : Text
      , kind : DocKind
      , audience : DocAudience
      , location : DocLocation
      }

let docRefDefault = { description = None Text }

let mkDocRef =
      \(input : DocRefInput) -> ((docRefDefault // input) : DocRefType)

in  { Type = DocRefType
    , Input = DocRefInput
    , default = docRefDefault
    , mk = mkDocRef
    }
