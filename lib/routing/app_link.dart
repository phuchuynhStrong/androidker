import 'dart:convert';

import 'package:androiker/views/home_page/home_page.dart';

// Inspired from flutter-folio
class AppLink {
  static const String kArticleParam = "article";
  static const String kPageParam = "page";
  // TODO: What does fuse do ?
  static final Codec<String, String> _stringToBase64 = utf8.fuse(base64);

  AppLink({this.pageId, this.articleId});
  String? pageId;
  String? articleId;

  bool isInvalid() {
    return pageId == null && articleId == null;
  }

  static AppLink initial() {
    return AppLink(pageId: kHomePageId);
  }

  static String? encode(String? s) {
    if (s == null) return null;
    return _stringToBase64.encode(s);
  }

  static String? decode(String? s) {
    if (s == null) return null;
    return _stringToBase64.decode(s);
  }

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? "");
    Map<String, String> params = Uri.parse(location).queryParameters;
    // Handle paths
    final paths = location.split('/')..removeWhere((path) => path.isEmpty);
    // Shared function to inject keys if they are not null
    void trySet(String key, void Function(String) setter) {
      if (params.containsKey(key)) setter.call(params[key]!);
    }

    // Create the applink, inject any params we've found
    AppLink link = AppLink();
    trySet(AppLink.kArticleParam, (s) => link.articleId = s);
    if (paths.isNotEmpty) {
      link.pageId = paths.first;
    }
    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
      bool hideKey = false,
      bool appendAlt = true,
    }) =>
        value == null
            ? ""
            : "${hideKey ? "" : '=$key'}$value${appendAlt ? '&' : ''}";
    String loc = "/";
    loc += addKeyValPair(key: kArticleParam, value: articleId);
    loc += addKeyValPair(
        key: kPageParam, value: pageId, hideKey: true, appendAlt: false);
    return Uri.encodeFull(loc);
  }
}
