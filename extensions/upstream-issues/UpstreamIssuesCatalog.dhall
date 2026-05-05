-- UpstreamIssuesCatalog.dhall
-- Root type for the upstream-issues extension (list of upstream-issue entries).
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `UpstreamIssues.UpstreamIssuesCatalog::{ entries = [ … ] }` or even
-- `UpstreamIssues.UpstreamIssuesCatalog::{=}` for an empty catalog.

let UpstreamIssue = ./UpstreamIssue.dhall

let UpstreamIssuesCatalogType = { entries : List UpstreamIssue.Type }

let UpstreamIssuesCatalogInput = {}

let upstreamIssuesCatalogDefault =
      { entries = [] : List UpstreamIssue.Type }

let mkUpstreamIssuesCatalog =
      \(input : UpstreamIssuesCatalogInput) ->
        ((upstreamIssuesCatalogDefault // input) : UpstreamIssuesCatalogType)

in  { Type = UpstreamIssuesCatalogType
    , Input = UpstreamIssuesCatalogInput
    , default = upstreamIssuesCatalogDefault
    , mk = mkUpstreamIssuesCatalog
    }
