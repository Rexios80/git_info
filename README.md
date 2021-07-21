# git_info

Reads information about the local git repository to show in app

## Getting Started

pubspec.yaml:
```
assets:
  - .git/HEAD
  - .git/refs/heads/
  - .git/refs/heads/feature/
  # Include any other branch paths used in your project
  - .git/refs/tags/
  # Include any other tag paths used in your project
```

Unfortunately Flutter does not allow wild card asset definitions so you must specify all branch paths that could be used by your project
