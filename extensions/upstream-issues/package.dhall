-- package.dhall
-- Re-exports for convenient imports
--
-- Usage in a mori/upstream-issues.dhall:
--   let UpstreamIssues =
--         https://raw.githubusercontent.com/.../extensions/upstream-issues/package.dhall
--   in  UpstreamIssues.UpstreamIssuesCatalog::{
--         entries =
--           [ UpstreamIssues.UpstreamIssue::{ … }
--           ]
--         }

let IssueStatus = ./IssueStatus.dhall

let UpstreamIssue = ./UpstreamIssue.dhall

let UpstreamIssuesCatalog = ./UpstreamIssuesCatalog.dhall

in  { IssueStatus, UpstreamIssue, UpstreamIssuesCatalog }
