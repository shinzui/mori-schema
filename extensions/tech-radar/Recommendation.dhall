-- Recommendation.dhall
-- A single technology recommendation for a (language, category) pair.
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `TechRadar.Recommendation::{ language, category, package, level }`
-- and never have to touch the call site when new optional fields are added
-- upstream.

let Language = ../../types/Language.dhall

let AdoptionLevel = ./AdoptionLevel.dhall

let Category = ./Category.dhall

let RecommendationType =
      { language : Language
      , category : Category
      , package : Text
      , level : AdoptionLevel
      , reason : Optional Text
      , alternatives : List Text
      }

let RecommendationInput =
      { language : Language
      , category : Category
      , package : Text
      , level : AdoptionLevel
      }

let recommendationDefault =
      { reason = None Text, alternatives = [] : List Text }

let mkRecommendation =
      \(input : RecommendationInput) ->
        ((recommendationDefault // input) : RecommendationType)

in  { Type = RecommendationType
    , Input = RecommendationInput
    , default = recommendationDefault
    , mk = mkRecommendation
    }
