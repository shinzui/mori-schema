-- Package.dhall
-- A buildable unit within a project

let Language = ../types/Language.dhall
let Lifecycle = ../types/Lifecycle.dhall
let PackageType = ../types/PackageType.dhall
let Visibility = ../types/Visibility.dhall
let Dependency = ./Dependency.dhall
let DocRef = ./DocRef.dhall
let ConfigItem = ./ConfigItem.dhall
let Runtime = ./Runtime.dhall

in  { name : Text
      -- Package name

    , type : PackageType
      -- What kind of package this is

    , language : Language
      -- Primary language

    , path : Optional Text
      -- Path relative to project root (if different from root)

    , description : Optional Text
      -- Brief description

    , lifecycle : Optional Lifecycle
      -- Package lifecycle stage (inherits project lifecycle when None)

    , visibility : Visibility
      -- Access scope

    , runtime : Runtime
      -- Runtime characteristics

    , dependencies : List Dependency
      -- Package dependencies (registry-first)

    , docs : List DocRef
      -- Package-specific documentation

    , config : List ConfigItem
      -- Configuration requirements
    }
