-- PinnedImport.dhall
-- A hash-pinned remote Dhall import consumed from another Mori project.

let MoriRef = ./MoriRef.dhall

let PinnedImportType =
      { publisher : Text
        -- Qualified namespace/name or canonical mori:// project URI.

      , publisherRef : Optional MoriRef.Type
        -- Typed project-root companion for publisher.

      , export : Optional Text
        -- Dot path exported by the publisher's package.dhall.

      , version : Optional Text
        -- Release tag or other opaque version pinned by the consumer.

      , pin : Optional Text
        -- Dhall semantic hash, including the sha256: prefix.

      , url : Optional Text
        -- Exact import URL when it cannot be derived from publisher + version.

      , derived : Bool
        -- True when the consumer transforms the imported value.
      }

let PinnedImportInput = { publisher : Text }

let pinnedImportDefault =
      { publisherRef = None MoriRef.Type
      , export = None Text
      , version = None Text
      , pin = None Text
      , url = None Text
      , derived = False
      }

let mkPinnedImport =
      \(input : PinnedImportInput) ->
        ((pinnedImportDefault // input) : PinnedImportType)

in  { Type = PinnedImportType
    , Input = PinnedImportInput
    , default = pinnedImportDefault
    , mk = mkPinnedImport
    }
