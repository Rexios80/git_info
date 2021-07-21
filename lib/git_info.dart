library git_info;

import 'package:flutter/services.dart';

/// Information about the local git repository
class GitInformation {
  /// The current checked out branch
  final String branch;

  /// The current git hash
  final String hash;

  /// Construct a [GitInformation] from a [branch] and [hash]
  GitInformation({required this.branch, required this.hash});
}

/// Class to hold the get method
class GitInfo {
  /// Get the [GitInformation] for the local git repository
  static Future<GitInformation> get() async {
    final head = await rootBundle.loadString('.git/HEAD');
    // Trim the ref since it has a newline character apparently
    final ref = head.replaceAll('ref: ', '').trim();

    final refSplit = ref.split('/');
    final branch = refSplit
        // Skip the first two since those are folder names
        .skip(2)
        .reduce((value, element) => value += '/$element');

    final hash = await rootBundle.loadString('.git/$ref');

    return GitInformation(branch: branch, hash: hash);
  }
}
