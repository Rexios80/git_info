# git_info

Reads information about the local git repository to show in app. Supports parsing the current branch name and commit hash.

## Getting Started

pubspec.yaml:
```yaml
assets:
  - .git/HEAD
  - .git/refs/heads/
  - .git/refs/heads/feature/
  # Include any other branch paths used in your project
```

Unfortunately Flutter does not allow wild card asset definitions so you must specify all branch paths that could be used by your project

settings.gradle:
```kotlin
import org.apache.tools.ant.DirectoryScanner

DirectoryScanner.removeDefaultExclude('**/.git')
DirectoryScanner.removeDefaultExclude('**/.git/**')
```

Gradle excludes files in the `.git` folder by default.

analysis_options.yaml:
```yaml
analyzer:
  errors:
    asset_directory_does_not_exist: ignore
    unrecognized_error_code: ignore
```

To avoid having to change your assets every time you make a new branch, you must include branch paths that might not exist in the local repository. This causes an analysis issue that can be ignored with the above analysis options.