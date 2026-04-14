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
let RuntimeEnvironment = ../types/RuntimeEnvironment.dhall
let ApiSource = ./ApiSource.dhall

let PackageRecordType =
      { name : Text
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

      , runtime : Runtime.Type
        -- Runtime characteristics

      , runtimeEnvironment : Optional RuntimeEnvironment
        -- Execution runtime (Node, Deno, Bun, JVM, etc.). None when not applicable.

      , dependencies : List Dependency
        -- Package dependencies (registry-first)

      , docs : List DocRef.Type
        -- Package-specific documentation

      , config : List ConfigItem.Type
        -- Configuration requirements

      , apiSource : Optional ApiSource.Type
        -- For Client-type packages: which API this package is generated from
      }

let PackageRecordInput =
      { name : Text, type : PackageType, language : Language }

let packageRecordDefault =
      { path = None Text
      , description = None Text
      , lifecycle = None Lifecycle
      , visibility = Visibility.Public
      , runtime = Runtime.default
      , runtimeEnvironment = None RuntimeEnvironment
      , dependencies = [] : List Dependency
      , docs = [] : List DocRef.Type
      , config = [] : List ConfigItem.Type
      , apiSource = None ApiSource.Type
      }

let mkPackageRecord =
      \(input : PackageRecordInput) ->
        ((packageRecordDefault // input) : PackageRecordType)

in  { Type = PackageRecordType
    , Input = PackageRecordInput
    , default = packageRecordDefault
    , mk = mkPackageRecord
    }
