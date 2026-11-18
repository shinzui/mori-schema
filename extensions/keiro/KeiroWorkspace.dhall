-- KeiroWorkspace.dhall
-- One keiro service whose topology a project commits. The topology is the
-- JSON document `keiro-dsl topology` generates; keiro owns its format
-- (mori://shinzui/keiro/okf/user-documentation/concepts/DOC-35).
--
-- service     must equal the `service` field inside the topology document.
-- topology    the document's path relative to the project root, for example
--             "domain/mori.service-topology.json".
-- workspace   the project-relative path of the source the document was
--             generated from: the .keiro-workspace manifest, or the single
--             .keiro file. Member paths resolve against its directory. When
--             absent, the source is expected beside the topology document.
let KeiroWorkspaceType =
      { service : Text
      , topology : Text
      , workspace : Optional Text
      , description : Optional Text
      }

let KeiroWorkspaceInput = { service : Text, topology : Text }

let keiroWorkspaceDefault = { workspace = None Text, description = None Text }

let mkKeiroWorkspace =
      \(input : KeiroWorkspaceInput) ->
        keiroWorkspaceDefault // input : KeiroWorkspaceType

in  { Type = KeiroWorkspaceType
    , Input = KeiroWorkspaceInput
    , default = keiroWorkspaceDefault
    , mk = mkKeiroWorkspace
    }
