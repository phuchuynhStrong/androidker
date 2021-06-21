import 'dart:convert';

// Inspired from flutter-folio
class AppLink {
  static const String kArticleParam = "article";
  static const String kPageParam = "page";
  // TODO: What does fuse do ?
  static Codec<String, String> _stringToBase64 = utf8.fuse(base64);

  AppLink({this.pageId, this.articleId});
  String? pageId;
  String? articleId;

  static String? encode(String? s) {
    if (s == null) return null;
    return _stringToBase64.encode(s);
  }

  static String? decode(String? s) {
    if (s == null) return null;
    return _stringToBase64.decode(s);
  }

  // static AppLink fromLocation(String? location) {
  //   location = Uri.decodeFull(location ?? "");
  //   Map<String, String> params = Uri.parse(location).queryParameters;
  //   // Shared function to inject keys if they are not null
  //   void trySet(String key, void Function(String) setter) {
  //     if (params.containsKey(key)) setter.call(params[key]!);
  //   }

  //   log("parse-fromLocation: $location");
  //   // Create the applink, inject any params we've found
  //   AppLink link = AppLink();
  //   trySet(AppLink.kBookParam, (s) => link.bookId = s);
  //   trySet(AppLink.kPageParam, (s) => link.pageId = s);
  //   trySet(AppLink.kUserParam, (s) => link.user = decode(s));
  //   return link;
  // }

  // String toLocation() {
  //   String addKeyValPair({required String key, String? value}) => value == null ? "" : "${key}=$value&";
  //   String loc = "/?";
  //   loc += addKeyValPair(key: kBookParam, value: bookId);
  //   loc += addKeyValPair(key: kPageParam, value: pageId);
  //   // Encode the userId just to avoid passing around plaintext user id's
  //   loc += addKeyValPair(key: kUserParam, value: encode(user));
  //   return Uri.encodeFull(loc);
  // }
}
