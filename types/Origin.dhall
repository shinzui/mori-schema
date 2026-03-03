-- Origin.dhall
-- Whether a project is user-owned (modifiable) or third-party (read-only)

< Own         -- User-owned, fully modifiable
| ThirdParty  -- External dependency, read-only
| Fork        -- Forked from upstream, modifiable with caveats
| Vendored    -- Vendored copy, locally modifiable
>
