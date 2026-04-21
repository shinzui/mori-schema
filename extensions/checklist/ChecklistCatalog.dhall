-- ChecklistCatalog.dhall
-- Root type for the checklist extension (list of checklists).
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `Checklist.ChecklistCatalog::{ entries = [ … ] }` or even
-- `Checklist.ChecklistCatalog::{=}` for an empty catalog.

let Checklist = ./Checklist.dhall

let ChecklistCatalogType = { entries : List Checklist.Type }

let ChecklistCatalogInput = {}

let checklistCatalogDefault = { entries = [] : List Checklist.Type }

let mkChecklistCatalog =
      \(input : ChecklistCatalogInput) ->
        ((checklistCatalogDefault // input) : ChecklistCatalogType)

in  { Type = ChecklistCatalogType
    , Input = ChecklistCatalogInput
    , default = checklistCatalogDefault
    , mk = mkChecklistCatalog
    }
