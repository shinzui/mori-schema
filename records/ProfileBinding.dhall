-- ProfileBinding.dhall
-- How an OKF bundle obtains the profile that governs it.

let PinnedImport = ./PinnedImport.dhall

in  < Local : Text | Published : PinnedImport.Type >
