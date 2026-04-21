-- package.dhall
-- Re-exports for convenient imports
--
-- Usage in a mori/checklist.dhall:
--   let Checklist = https://raw.githubusercontent.com/.../extensions/checklist/package.dhall
--   in Checklist.ChecklistCatalog::{
--        entries =
--          [ Checklist.Checklist::{ … }
--          ]
--        }

let ChecklistItem = ./ChecklistItem.dhall

let Checklist = ./Checklist.dhall

let ChecklistCatalog = ./ChecklistCatalog.dhall

let StepKind = ./StepKind.dhall

let Category = ./Category.dhall

in  { ChecklistItem, Checklist, ChecklistCatalog, StepKind, Category }
