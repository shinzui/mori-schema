-- Repo.dhall
-- Repository reference

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
