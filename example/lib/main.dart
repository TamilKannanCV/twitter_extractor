import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:twitter_extractor/twitter_extractor.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () async {
                  final twitter = await TwitterExtractor.extract(
                      "https://twitter.com/mspoweruser/status/1453107912314871810/photo/1");
                      log(twitter.videos.first.url);
                },
                child: const Text("Click me!"))));
  }
}
