-- EventSelector.dhall
-- Union type for event selectors. Each variant's payload lives in a
-- dedicated mk-form bundle.
let ChangesetSelector = ./ChangesetSelector.dhall

let RefSelector = ./RefSelector.dhall

let SignalSelector = ./SignalSelector.dhall

let ProjectSelector = ./ProjectSelector.dhall

in  < ChangesetSelector : ChangesetSelector.Type
    | RefSelector : RefSelector.Type
    | SignalSelector : SignalSelector.Type
    | ProjectSelector : ProjectSelector.Type
    >
