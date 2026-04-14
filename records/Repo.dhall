-- Repo.dhall
-- Repository reference
--
-- Exports the { Input, Type, default, mk } record bundle so consumers
-- can write `Schema.Repo::{ name = "…", github = Some "…" }` and never
-- have to touch the call site when new optional fields are added
-- upstream.

let RepoType =
      { name : Text
        -- Logical name for the repository

      , github : Optional Text
        -- GitHub path (e.g., "owner/repo")

      , gitlab : Optional Text
        -- GitLab path (e.g., "namespace/project")

      , git : Optional Text
        -- Generic git URL

      , localPath : Optional Text
        -- Path on local filesystem (relative to project root)
      }

let RepoInput = { name : Text }

let repoDefault =
      { github = None Text
      , gitlab = None Text
      , git = None Text
      , localPath = None Text
      }

let mkRepo = \(input : RepoInput) -> ((repoDefault // input) : RepoType)

in  { Type = RepoType, Input = RepoInput, default = repoDefault, mk = mkRepo }
