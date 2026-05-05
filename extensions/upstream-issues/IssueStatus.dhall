-- IssueStatus.dhall
-- Status of an upstream issue tracked in the catalog.
--
-- - Active:     upstream is broken and we are currently affected;
--               no local workaround has been applied
-- - Workaround: we have a local workaround in place
-- - Resolved:   upstream has merged a fix; we can delete this
--               entry on the next sweep
-- - Stale:      we no longer use the dependency; entry kept for
--               historical reference only
-- - Other:      free-form escape valve (Haskell side uses
--               `OtherIssueStatus` for naming-disambiguation)

< Active
| Workaround
| Resolved
| Stale
| Other : Text
>
