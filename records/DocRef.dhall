-- DocRef.dhall
-- Reference to documentation

let DocKind = ../types/DocKind.dhall
let DocLocation = ../types/DocLocation.dhall
let DocAudience = ../types/DocAudience.dhall

in  { key : Text
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
