-- Checklist.dhall
-- A named ordered sequence of steps.
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `Checklist.Checklist::{ key, title, category, items }` and skip
-- optional fields.

let ChecklistItem = ./ChecklistItem.dhall

let Category = ./Category.dhall

let DocLocation = ../../types/DocLocation.dhall

let ChecklistType =
      { key : Text
        -- Unique identifier within the catalog ("install", "deploy-prod", …)

      , title : Text
        -- Human-readable name

      , category : Category
        -- High-level classification

      , items : List ChecklistItem.Type
        -- Ordered steps. Order carries meaning; preconditions cannot refer
        -- forward.

      , description : Optional Text
        -- Brief summary of what this checklist accomplishes

      , sourceDoc : Optional DocLocation
        -- Optional pointer to a companion prose runbook

      , tags : List Text
      }

let ChecklistInput =
      { key : Text
      , title : Text
      , category : Category
      , items : List ChecklistItem.Type
      }

let checklistDefault =
      { description = None Text
      , sourceDoc = None DocLocation
      , tags = [] : List Text
      }

let mkChecklist =
      \(input : ChecklistInput) ->
        ((checklistDefault // input) : ChecklistType)

in  { Type = ChecklistType
    , Input = ChecklistInput
    , default = checklistDefault
    , mk = mkChecklist
    }
