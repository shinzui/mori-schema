-- Category.dhall
-- High-level category of a checklist.
--
-- The `Other : Text` escape hatch lets authors add new categories without
-- waiting on a schema bump, matching the pattern used by cookbook Topic and
-- tech-radar Category.

< Installation
| Deployment
| Monitoring
| Onboarding
| Release
| Incident
| Other : Text
>
