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
        body: FutureBuilder(
            future: TwitterExtractor.extract(
                "https://twitter.com/mspoweruser/status/1453107912314871810/photo/1"),
            builder: (context, AsyncSnapshot<Twitter> snapshot) {
              if (snapshot.hasData) {
                Twitter tweet = snapshot.data!;
                return Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      child: Image.network(tweet.videos.first.thumb),
                    ),
                    Text(tweet.videos.first.text),
                  ],
                ));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
