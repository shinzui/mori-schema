-- CookbookCatalog.dhall
-- Root type for the cookbook extension (list of cookbook entries).
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `Cookbook.CookbookCatalog::{ entries = [ … ] }` or even
-- `Cookbook.CookbookCatalog::{=}` for an empty catalog.

let CookbookEntry = ./CookbookEntry.dhall

let CookbookCatalogType = { entries : List CookbookEntry.Type }

let CookbookCatalogInput = {}

let cookbookCatalogDefault = { entries = [] : List CookbookEntry.Type }

let mkCookbookCatalog =
      \(input : CookbookCatalogInput) ->
        ((cookbookCatalogDefault // input) : CookbookCatalogType)

in  { Type = CookbookCatalogType
    , Input = CookbookCatalogInput
    , default = cookbookCatalogDefault
    , mk = mkCookbookCatalog
    }
