-- PlanStatus.dhall
-- The publishing project's authoritative status for a plan. The agent-seihou
-- skills derive a heuristic status from the plan's Progress checklist; this
-- field lets the publisher override that heuristic for the registry view
-- (for example, to mark a plan Blocked while its checklist is mid-progress).

< NotStarted
| InProgress
| Complete
| Cancelled
| Blocked
>
