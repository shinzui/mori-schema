-- Proves that a pre-lifecycle DDD model still typechecks through completion defaults.
let Ddd = ../package.dhall

in  Ddd.DddModel::{
    , contexts = [ Ddd.BoundedContext::{ key = "orders", name = "Orders" } ]
    , glossary =
      [ Ddd.GlossaryTerm::{
        , term = "order"
        , definition = "A request to purchase goods"
        }
      ]
    }
