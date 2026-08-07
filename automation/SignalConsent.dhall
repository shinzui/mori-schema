-- SignalConsent.dhall
-- Target-owned allowlist for incoming Signals. An explicitly empty list
-- denies every source; an absent Automation.consent preserves default-allow.
let SignalConsentType = { allowSignalsFrom : List Text }

let SignalConsentInput = {} : Type

let signalConsentDefault = { allowSignalsFrom = [] : List Text }

let mkSignalConsent =
      \(_ : SignalConsentInput) ->
        signalConsentDefault // {=} : SignalConsentType

in  { Type = SignalConsentType
    , Input = SignalConsentInput
    , default = signalConsentDefault
    , mk = mkSignalConsent
    }
