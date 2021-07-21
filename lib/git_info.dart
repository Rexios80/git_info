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
    final _head = await rootBundle.loadString('.git/HEAD');
    final hash = await rootBundle.loadString('.git/ORIG_HEAD');

    final branch = _head.split('/').last;

    return GitInformation(branch: branch, hash: hash);
  }
}
