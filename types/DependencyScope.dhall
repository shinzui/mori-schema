-- DependencyScope.dhall
-- When a dependency is needed: at runtime, only during development,
-- only by tests, or only at build time.

< Regular  -- Required at runtime
| Dev      -- Development tooling only (linters, formatters, REPL helpers)
| Test     -- Test framework or test fixture
| Build    -- Build-time only (codegen, build scripts, compilers invoked at build)
>
