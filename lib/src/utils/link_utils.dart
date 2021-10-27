abstract class LinkUtils {
  static final urlPattern = RegExp(
      r"(https?:\/\/twitter\.com\/(?:\!\/)?(\w+)\/status(es)?\/(?<id>\d+))");

  static bool isValidUrl(String url) {
    return urlPattern.hasMatch(url);
  }

  static String? getId(String url) {
    return (urlPattern.firstMatch(url) == null)
        ? null
        : urlPattern.firstMatch(url)!.namedGroup("id").toString();
  }
}
