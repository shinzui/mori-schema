-- CookbookEntry.dhall
-- A single cookbook entry with structured metadata

let Language = ../../types/Language.dhall

let DocLocation = ../../types/DocLocation.dhall

let DocAudience = ../../types/DocAudience.dhall

let ContentType = ./ContentType.dhall

let Topic = ./Topic.dhall

in  { key : Text
      -- Unique identifier for this cookbook entry

    , title : Text
      -- Human-readable title, ideally task-oriented ("How to X" or verb-first)

    , contentType : ContentType
      -- What form the content takes (sample code, instructions, pattern, etc.)

    , topics : List Topic
      -- Domain areas this cookbook covers (can be multiple)

    , packages : List Text
      -- Related libraries or tools this cookbook uses (e.g., ["hasql", "hasql-pool"])

    , language : Language
      -- Target language or tool

    , audience : DocAudience
      -- Who this cookbook is for

    , location : DocLocation
      -- Where the cookbook file lives

    , description : Optional Text
      -- Brief summary of the cookbook's purpose
    }
