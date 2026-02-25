-- Dependency.dhall
-- Registry-first dependency declaration
--
-- In a multi-repo microservices architecture, dependencies are resolved
-- by name via the local registry. This avoids duplicating paths across services.
--
-- Simple form: just reference by name
--   dependencies = [ "streamly", "effectful", "hasql" ]
--
-- Extended form: when you need to augment with local docs
--   dependencies = [ "streamly", Dependency.WithAugmentation { name = "hasql", ... } ]

let DocRef = ./DocRef.dhall

in  < ByName : Text
      -- Simple case: just the dependency name, resolved via registry

    | WithAugmentation :
        { name : Text
          -- Dependency name for registry lookup

        , extraDocs : List DocRef
          -- Additional docs specific to how THIS project uses the dependency

        , localPathOverride : Optional Text
          -- Fallback: explicit path for unregistered dependencies (rare)
        }
    >
