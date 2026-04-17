-- ChangesetSelector.dhall
-- Payload for Schema.EventSelector.ChangesetSelector.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.EventSelector.ChangesetSelector Schema.ChangesetSelector::{ name = "..." }`
-- and omit paths/branches/messagePatterns/trailerPatterns.

let ChangesetSelectorType =
      { name : Text
        -- Unique selector name for referencing in reactions

      , paths : List Text
        -- Glob patterns for touched file paths

      , branches : List Text
        -- Branch name patterns (empty = match all)

      , messagePatterns : List Text
        -- Commit message patterns (empty = match all)

      , trailerPatterns : List { mapKey : Text, mapValue : Text }
        -- Git trailer key/value glob patterns (empty = match all)
      }

let ChangesetSelectorInput = { name : Text }

let changesetSelectorDefault =
      { paths = [] : List Text
      , branches = [] : List Text
      , messagePatterns = [] : List Text
      , trailerPatterns = [] : List { mapKey : Text, mapValue : Text }
      }

let mkChangesetSelector =
      \(input : ChangesetSelectorInput) ->
        ((changesetSelectorDefault // input) : ChangesetSelectorType)

in  { Type = ChangesetSelectorType
    , Input = ChangesetSelectorInput
    , default = changesetSelectorDefault
    , mk = mkChangesetSelector
    }
