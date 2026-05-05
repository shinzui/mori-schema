-- UpstreamIssue.dhall
-- A single tracked upstream defect with optional local workaround.
--
-- Exports the { Type, Input, default, mk } record bundle so consumers
-- can omit optional fields and never have to touch the call site when
-- new optional fields are added upstream.

let IssueStatus = ./IssueStatus.dhall

let UpstreamIssueType =
      { key : Text
      , dependency : Text
      , summary : Text
      , status : IssueStatus
      , revisitTrigger : Optional Text
      , workaroundPath : Optional Text
      , upstreamUrl : Optional Text
      , tags : List Text
      }

-- Input lists ONLY the identity-bearing fields. Everything else lives in
-- the default record so that:
--   (a) callers can write `UpstreamIssue::{ key = ..., dependency = ...,
--       summary = ... }` and accept defaults for the rest;
--   (b) we can grow the Type with new fields without rewriting any call
--       site (the new field MUST land in default, not Input);
--   (c) `mori schema migrate --apply` strips lines that match the default.
let UpstreamIssueInput = { key : Text, dependency : Text, summary : Text }

let upstreamIssueDefault =
      { status = IssueStatus.Active
      , revisitTrigger = None Text
      , workaroundPath = None Text
      , upstreamUrl = None Text
      , tags = [] : List Text
      }

let mkUpstreamIssue =
      \(input : UpstreamIssueInput) ->
        ((upstreamIssueDefault // input) : UpstreamIssueType)

in  { Type = UpstreamIssueType
    , Input = UpstreamIssueInput
    , default = upstreamIssueDefault
    , mk = mkUpstreamIssue
    }
