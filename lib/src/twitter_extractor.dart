import 'dart:convert';

import 'package:twitter_extractor/src/models/twitter.dart';

import 'package:http/http.dart' as http;
import 'package:twitter_extractor/src/utils/link_utils.dart';

class TwitterExtractor {
  static const _api =
      "https://twittervideodownloaderpro.com/twittervideodownloadv2/index.php";

  ///Returns whether the given url is a valid Twitter url
  static bool isValidUrl(String url) => LinkUtils.isValidUrl(url);

  ///Returns username
  static String getUsername(String url) => LinkUtils.getUsername(url);

  ///Returns [Twitter] data
  static Future<Twitter> extract(String url) async {
    final String? id = LinkUtils.getId(url);
    if (id == null) {
      Future.error("Unable to get ID");
    }
    final http.Response response = await http.post(
      Uri.parse(_api),
      body: {"id": id},
      encoding: Encoding.getByName("utf-8"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    return Twitter.fromJson(json.decode(response.body));
  }
}
