-- CookbookEntry.dhall
-- A single cookbook entry with structured metadata.
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- omit the optional description field and never have to touch the call
-- site when new optional fields are added upstream.

let Language = ../../types/Language.dhall

let DocLocation = ../../types/DocLocation.dhall

let DocAudience = ../../types/DocAudience.dhall

let ContentType = ./ContentType.dhall

let Topic = ./Topic.dhall

let CookbookEntryType =
      { key : Text
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

      , tags : List Text
        -- Freeform tags for this cookbook entry, complementing the closed
        -- Topic union. Useful for one-off labels that don't warrant adding
        -- a new Topic constructor.
      }

let CookbookEntryInput =
      { key : Text
      , title : Text
      , contentType : ContentType
      , topics : List Topic
      , packages : List Text
      , language : Language
      , audience : DocAudience
      , location : DocLocation
      }

let cookbookEntryDefault =
      { description = None Text, tags = [] : List Text }

let mkCookbookEntry =
      \(input : CookbookEntryInput) ->
        ((cookbookEntryDefault // input) : CookbookEntryType)

in  { Type = CookbookEntryType
    , Input = CookbookEntryInput
    , default = cookbookEntryDefault
    , mk = mkCookbookEntry
    }
