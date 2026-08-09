-- DocLocation.dhall
-- Where documentation is located.
--
-- The Canonical arm stores a mori:// URI that points at another
-- registered project's doc. The mori CLI parses and resolves it
-- through the local registry at projection time and at read time.
-- CanonicalRef carries a project or non-nested artifact as a typed
-- record. Nested references (OKF concepts, checklist steps, and DDD
-- flow steps) still use Canonical because MoriRef has no sub-key field.
-- This types/ file can import records/MoriRef.dhall without a cycle:
-- MoriRef imports only types/MoriArtifactKind.dhall.

let MoriRef = ../records/MoriRef.dhall

in  < LocalFile : Text         -- Path to a file relative to project root
    | LocalDir : Text          -- Path to a directory relative to project root
    | RepoPath : Text          -- Path within a repo (for wrapper projects)
    | Url : Text               -- External URL
    | Canonical : Text         -- mori:// canonical artifact reference
    | CanonicalRef : MoriRef.Type -- Typed canonical artifact reference
    >
