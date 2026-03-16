let Language = ../../types/Language.dhall

let AdoptionLevel = ./AdoptionLevel.dhall

let Category = ./Category.dhall

in  { language : Language
    , category : Category
    , package : Text
    , level : AdoptionLevel
    , reason : Optional Text
    , alternatives : List Text
    }
