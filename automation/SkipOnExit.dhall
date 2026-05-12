-- SkipOnExit.dhall
-- Polarity for an IdempotencyCheck: which exit-code class causes the
-- worker to skip the scheduled reaction.
--
--   Zero    — skip when the check command exits 0 (succeeds).
--   NonZero — skip when the check command exits non-zero (fails).
--
-- This is a sealed union: there is no `Other : Text` arm because exit-code
-- polarity has exactly two meaningful values.

let SkipOnExit
    : Type
    = < Zero | NonZero >

in  SkipOnExit
