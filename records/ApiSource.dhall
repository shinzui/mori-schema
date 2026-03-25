-- ApiSource.dhall
-- Declares that a package is generated from an API in another project.
--
-- This is the client-side complement to Api.dhall, which captures
-- the owner-side view. ApiSource answers "where does my schema
-- come from?" while Api answers "who are my consumers?"

{ project : Text
  -- Qualified project name (e.g., "tan/mls-service-v2")
  -- Must appear in the project-level dependencies list

, api : Optional Text
  -- API name within the source project (matches Api.name)
  -- None when the source project has a single API

, specPath : Optional Text
  -- Path to the spec file in the source project
  -- Enables automation without resolving the source project
}
