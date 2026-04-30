-- DocLocation.dhall
-- Where documentation is located.
--
-- The Canonical arm stores a mori:// URI that points at another
-- registered project's doc. The mori CLI parses and resolves it
-- through the local registry at projection time and at read time.

< LocalFile : Text   -- Path to a file relative to project root
| LocalDir : Text    -- Path to a directory relative to project root
| RepoPath : Text    -- Path within a repo (for wrapper projects)
| Url : Text         -- External URL
| Canonical : Text   -- mori:// canonical artifact reference
>
