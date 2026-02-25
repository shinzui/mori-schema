-- DocLocation.dhall
-- Where documentation is located

< LocalFile : Text   -- Path to a file relative to project root
| LocalDir : Text    -- Path to a directory relative to project root
| RepoPath : Text    -- Path within a repo (for wrapper projects)
| Url : Text         -- External URL
>
