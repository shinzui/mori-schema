-- StandardScope.dhall
-- Scope at which a standard applies

< Organization  -- Applies across the entire org
| Domain        -- Applies to a business domain
| Platform      -- Applies to a platform/infrastructure layer
| Language      -- Applies to projects in a specific language
| Team          -- Applies to a specific team's projects
| Other : Text
>
