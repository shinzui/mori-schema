-- UserConfig.dhall
-- Root type for user-level mori configuration (~/.config/mori/config.dhall)
--
-- This configures CLI behavior across all projects.
-- Place at ~/.config/mori/config.dhall or set $MORI_CONFIG.
--
-- Example:
--   { aliases = toMap { reg = "registry list", sh = "show --full" } }

{ aliases : List { mapKey : Text, mapValue : Text }
  -- Command aliases: short names that expand to full commands.
  -- Use Dhall's `toMap` to define them ergonomically.
  -- Only the first CLI argument is checked for alias expansion.
  -- Built-in commands cannot be shadowed.
}
