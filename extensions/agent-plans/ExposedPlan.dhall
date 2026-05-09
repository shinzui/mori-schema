-- ExposedPlan.dhall
-- A single agent-seihou plan that the publishing project chooses to
-- expose to the mori registry. The content of the plan lives in the
-- referenced Markdown file's YAML frontmatter; this record carries
-- only the publication-policy layer (which file, declared status,
-- optional summary, cross-project deps).

let PlanKind = ./PlanKind.dhall

let PlanStatus = ./PlanStatus.dhall

let PlanDependency = ./PlanDependency.dhall

let ExposedPlanType =
      { kind : PlanKind
      , file : Text
      , status : PlanStatus
      , owner : Optional Text
      , summary : Optional Text
      , dependencies : List PlanDependency.Type
      }

let ExposedPlanInput =
      { kind : PlanKind
      , file : Text
      , status : PlanStatus
      }

let exposedPlanDefault =
      { owner = None Text
      , summary = None Text
      , dependencies = [] : List PlanDependency.Type
      }

let mkExposedPlan =
      \(input : ExposedPlanInput) ->
        ((exposedPlanDefault // input) : ExposedPlanType)

in  { Type = ExposedPlanType
    , Input = ExposedPlanInput
    , default = exposedPlanDefault
    , mk = mkExposedPlan
    }
