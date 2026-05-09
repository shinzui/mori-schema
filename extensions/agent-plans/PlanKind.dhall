-- PlanKind.dhall
-- Distinguishes a MasterPlan (an initiative-level decomposition document)
-- from an ExecPlan (a single self-contained execution plan that delivers
-- working behavior). The two kinds correspond to the two skill types
-- under agents/skills/{master-plan,exec-plan}/ in agent-seihou consumers.

< MasterPlan
| ExecPlan
>
