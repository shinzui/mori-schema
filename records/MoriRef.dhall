-- MoriRef.dhall
-- Canonical reference to an artifact owned by a registered project.
--
-- Canonical URI form (parsed by the mori CLI, not by Dhall):
--     mori://<namespace>/<name>/<kind-plural>/<key>[#anchor]
--
-- Compact alias form (input only, never serialized):
--     <namespace>/<name>[#<kind-singular>:<key>][#anchor]
--
-- The DepRef shorthand <namespace>/<name>:<package> remains a
-- separate grammar and is not parsed by this type.

let MoriArtifactKind = ../types/MoriArtifactKind.dhall

let MoriRefType =
      { namespace : Text
        -- The owning namespace, e.g. "shinzui".

      , name : Text
        -- The project name within the namespace, e.g. "mori".

      , kind : Optional MoriArtifactKind
        -- The kind of artifact. None means the reference points at
        -- the project root (mori://shinzui/mori).

      , key : Optional Text
        -- The artifact's stable key within the project. Required
        -- when kind is Some, ignored when kind is None.

      , anchor : Optional Text
        -- An optional fragment identifier for in-document anchors,
        -- corresponding to the URI fragment after '#'.
      }

let MoriRefInput =
      { namespace : Text
      , name : Text
      }

let moriRefDefault =
      { kind = None MoriArtifactKind
      , key = None Text
      , anchor = None Text
      }

let mkMoriRef =
      \(input : MoriRefInput) -> ((moriRefDefault // input) : MoriRefType)

in  { Type = MoriRefType
    , Input = MoriRefInput
    , default = moriRefDefault
    , mk = mkMoriRef
    }
