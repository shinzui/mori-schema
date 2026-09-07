-- RefSelector.dhall
-- Payload for Schema.EventSelector.RefSelector.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.EventSelector.RefSelector Schema.RefSelector::{ name = "..." }`
-- and omit refPatterns/kinds.

let RefSelectorType =
      { name : Text
        -- Unique selector name for referencing in reactions

      , refRegexes : List Text
        -- Whole-input POSIX extended regex alternatives (empty = unrestricted)

      , refPatterns : List Text
        -- Ref name patterns (e.g., "main", "release/*")

      , kinds : List Text
        -- Ref kinds to match: "branch", "tag" (empty = match all)
      }

let RefSelectorInput = { name : Text }

let refSelectorDefault =
      { refRegexes = [] : List Text
      , refPatterns = [] : List Text, kinds = [] : List Text }

let mkRefSelector =
      \(input : RefSelectorInput) -> ((refSelectorDefault // input) : RefSelectorType)

in  { Type = RefSelectorType
    , Input = RefSelectorInput
    , default = refSelectorDefault
    , mk = mkRefSelector
    }
