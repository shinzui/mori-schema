-- CookbookCatalog.dhall
-- Root type for the cookbook extension

let CookbookEntry = ./CookbookEntry.dhall

in  { entries : List CookbookEntry }
