import 'package:flutter/material.dart';
import 'package:git_info/git_info.dart';

void main() {
  runApp(const MyApp());
}

// This will not work unless you create a git repo in the example folder
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('git_info_example'),
        ),
        body: FutureBuilder<GitInformation>(
          future: GitInfo.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Branch: ${snapshot.data!.branch}'),
                    Text('Hash: ${snapshot.data!.hash}'),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
