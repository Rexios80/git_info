library git_info;

import 'package:flutter/services.dart';

/// Information about the local git repository
class GitInformation {
  /// The current checked out branch
  final String branch;

  /// The current commit hash
  final String? hash;

  /// Construct a [GitInformation] from a [branch] and [hash]
  GitInformation({required this.branch, required this.hash});
}

/// Class to hold the get method
class GitInfo {
  /// Get the [GitInformation] for the local git repository
  static Future<GitInformation> get() async {
    final head = await rootBundle.loadString('.git/HEAD');
    // Trim the ref since it has a newline character
    final ref = head.replaceAll('ref: ', '').trim();
    final refSplit = ref.split('/');

    final String branch;
    String? hash;
    if (refSplit.length > 1) {
      // This is a branch reference
      branch = refSplit
          // Skip the first two since those are folder names
          .skip(2)
          .reduce((value, element) => value += '/$element');

      try {
        hash = await rootBundle.loadString('.git/$ref');
      } catch (error) {
        // The file with the hash is not in the assets
      }
    } else {
      // This is a commit hash
      branch = ref;
      hash = ref;
    }

    return GitInformation(branch: branch, hash: hash);
  }
}
