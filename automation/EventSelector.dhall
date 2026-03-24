-- EventSelector.dhall
-- Union type for event selectors

< ChangesetSelector :
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
| RefSelector :
    { name : Text
      -- Unique selector name for referencing in reactions

    , refPatterns : List Text
      -- Ref name patterns (e.g., "main", "release/*")

    , kinds : List Text
      -- Ref kinds to match: "branch", "tag" (empty = match all)
    }
| SignalSelector :
    { name : Text
      -- Unique selector name for referencing in reactions

    , signalTypes : List Text
      -- Signal types to match (empty = match all)

    , sourceProjects : List Text
      -- Source project names to match (empty = match all)
    }
>
