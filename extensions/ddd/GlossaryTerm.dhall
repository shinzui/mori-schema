-- GlossaryTerm.dhall
-- A ubiquitous-language glossary term.

let GlossaryTermType =
      { term : Text
      , definition : Text
      , context : Optional Text
      , aliases : List Text
      }

let GlossaryTermInput = { term : Text, definition : Text }

let glossaryTermDefault = { context = None Text, aliases = [] : List Text }

let mkGlossaryTerm =
      \(input : GlossaryTermInput) ->
        ((glossaryTermDefault // input) : GlossaryTermType)

in  { Type = GlossaryTermType
    , Input = GlossaryTermInput
    , default = glossaryTermDefault
    , mk = mkGlossaryTerm
    }
