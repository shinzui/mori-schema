-- PlanDependency.dhall
-- A typed reference from one plan to another, optionally cross-project.
--
-- Exports the { Input, Type, default, mk } record bundle for consistency
-- with every other record in this extension, even though there are no
-- optional fields and `Input` therefore equals `Type`.

let DependencyKind = ./DependencyKind.dhall

let PlanDependencyType =
      { kind : DependencyKind
      , target : Text
      }

let PlanDependencyInput = PlanDependencyType

let planDependencyDefault = {=}

let mkPlanDependency =
      \(input : PlanDependencyInput) ->
        ((planDependencyDefault // input) : PlanDependencyType)

in  { Type = PlanDependencyType
    , Input = PlanDependencyInput
    , default = planDependencyDefault
    , mk = mkPlanDependency
    }
