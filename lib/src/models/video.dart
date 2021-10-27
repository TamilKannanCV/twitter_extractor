class Video {
  final String source, text, thumb, type, url;
  final int bitrate, duration, size;

  const Video(
    this.source,
    this.text,
    this.thumb,
    this.type,
    this.url,
    this.bitrate,
    this.duration,
    this.size,
  );

  factory Video.fromJson(Map<String, dynamic> data) {
    final source = data["source"];
    final text = data["text"];
    final thumb = data["thumb"];
    final type = data["type"];
    final url = data["url"];
    final bitrate = data["bitrate"];
    final duration = data["duration"];
    final size = data["size"];
    return Video(source, text, thumb, type, url, bitrate, duration, size);
  }
}
