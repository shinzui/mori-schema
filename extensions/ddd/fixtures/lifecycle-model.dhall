-- Proves lifecycle, context succession, and terminology succession authoring.
let Ddd = ../package.dhall

let MoriRef = ../../../records/MoriRef.dhall

let MoriArtifactKind = ../../../types/MoriArtifactKind.dhall

in  Ddd.DddModel::{
    , contexts =
      [ Ddd.BoundedContext::{
        , key = "fulfillment"
        , name = "Fulfillment"
        , status = Some Ddd.ContextStatus.Emerging
        , supersedes = [ "shipping" ]
        , supersedesRefs =
          [ MoriRef::{
            , namespace = "acme"
            , name = "commerce"
            , kind = Some MoriArtifactKind.DddContext
            , key = Some "shipping"
            }
          ]
        }
      ]
    , glossary =
      [ Ddd.GlossaryTerm::{
        , term = "consignment"
        , definition = "Goods prepared for fulfillment"
        , replaces = [ "shipment" ]
        }
      ]
    }
