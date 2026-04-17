-- package.dhall
-- Re-exports for convenient imports
--
-- Usage in a mori/cookbook.dhall:
--   let Cookbook = https://raw.githubusercontent.com/.../extensions/cookbook/package.dhall
--   in Cookbook.CookbookCatalog::{
--        entries =
--          [ Cookbook.CookbookEntry::{ … }
--          ]
--        }

let CookbookEntry = ./CookbookEntry.dhall

let CookbookCatalog = ./CookbookCatalog.dhall

let ContentType = ./ContentType.dhall

let Topic = ./Topic.dhall

in  { CookbookEntry, CookbookCatalog, ContentType, Topic }
