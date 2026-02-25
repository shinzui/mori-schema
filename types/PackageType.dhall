-- PackageType.dhall
-- Type of a project or package (unified enum for both)

< Application   -- Deployable service or app
| Library       -- Reusable library
| Client        -- Generated API client
| Worker        -- Background processor / consumer
| Tool          -- CLI, migration, admin tool
| Other : Text  -- Escape hatch
>
