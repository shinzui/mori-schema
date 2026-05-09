-- package.dhall
-- Re-exports for convenient imports
--
-- Usage in a mori/agent-plans.dhall:
--   let AgentPlans = https://raw.githubusercontent.com/.../extensions/agent-plans/package.dhall
--   in AgentPlans.AgentPlansCatalog::{
--        plans =
--          [ AgentPlans.ExposedPlan::{ … }
--          ]
--        }

let AgentPlansCatalog = ./AgentPlansCatalog.dhall

let ExposedPlan = ./ExposedPlan.dhall

let PlanKind = ./PlanKind.dhall

let PlanStatus = ./PlanStatus.dhall

let PlanDependency = ./PlanDependency.dhall

let DependencyKind = ./DependencyKind.dhall

in  { AgentPlansCatalog
    , ExposedPlan
    , PlanKind
    , PlanStatus
    , PlanDependency
    , DependencyKind
    }
