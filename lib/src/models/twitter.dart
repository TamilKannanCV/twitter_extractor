import 'package:twitter_extractor/src/models/video.dart';

class Twitter {
  final List<Video> videos;
  const Twitter(this.videos);

  factory Twitter.fromJson(Map<String, dynamic> data) {
    final List<Video> videos = List.empty(growable: true);
    for (var e in (data["videos"] as List<dynamic>)) {
      videos.add(Video.fromJson(e));
    }
    return Twitter(videos);
  }
}
