-- DependencyKind.dhall
-- Strength of a cross-plan dependency.
--
-- Hard:        the target must be Complete before this plan can start.
-- Soft:        the target should ideally land first, but is not blocking.
-- Integration: the two plans share an integration surface; coordinate
--              progress, but neither blocks the other.

< Hard
| Soft
| Integration
>
