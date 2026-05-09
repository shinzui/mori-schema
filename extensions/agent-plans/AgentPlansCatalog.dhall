-- AgentPlansCatalog.dhall
-- Root type for the agent-plans extension (list of exposed plans).
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `AgentPlans.AgentPlansCatalog::{ plans = [ … ] }` or even
-- `AgentPlans.AgentPlansCatalog::{=}` for an empty catalog.

let ExposedPlan = ./ExposedPlan.dhall

let AgentPlansCatalogType = { plans : List ExposedPlan.Type }

let AgentPlansCatalogInput = {}

let agentPlansCatalogDefault = { plans = [] : List ExposedPlan.Type }

let mkAgentPlansCatalog =
      \(input : AgentPlansCatalogInput) ->
        ((agentPlansCatalogDefault // input) : AgentPlansCatalogType)

in  { Type = AgentPlansCatalogType
    , Input = AgentPlansCatalogInput
    , default = agentPlansCatalogDefault
    , mk = mkAgentPlansCatalog
    }
