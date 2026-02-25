-- DependencySource.dhall
-- Where dependencies are sourced from

< Hackage    -- Haskell package repository
| Npm        -- Node.js package repository
| PyPI       -- Python package index
| Crates     -- Rust package repository
| Maven      -- Java/JVM repository
| GitHub     -- Direct GitHub dependency
| GitLab     -- Direct GitLab dependency
| Git        -- Generic git repository
| Local      -- Local filesystem
| Other : Text
>
