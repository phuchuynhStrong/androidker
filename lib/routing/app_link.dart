import 'dart:convert';

import 'package:androiker/routing/app_pages.dart';
import 'package:equatable/equatable.dart';

// Inspired from flutter-folio
// ignore: must_be_immutable
class AppLink extends Equatable {
  static const String kArticleParam = "article";
  static const String kPageParam = "page";
  // TODO: What does fuse do ?
  static final Codec<String, String> _stringToBase64 = utf8.fuse(base64);

  AppLink({this.pageId, this.articleId});
  String? pageId;
  String? articleId;
  AppPage? appPage;

  bool isInvalid() {
    return pageId == null && articleId == null;
  }

  AppPage getAppPageEnum() {
    appPage ??= AppPage.values.firstWhere((item) => item.name == pageId,
        orElse: () => AppPage.notFound);
    return appPage!;
  }

  static AppLink initial() {
    return AppLink(pageId: AppPage.splash.name);
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
    final urlSuffixes = location.replaceAll("//", "").split("/")..removeAt(0);
    String? pageId = '';
    String? articleId;
    if (urlSuffixes.isNotEmpty) {
      pageId = urlSuffixes.first;
      if (urlSuffixes.length > 1) {
        articleId = urlSuffixes[1];
      }
    }
    return AppLink(
      pageId: pageId,
      articleId: articleId,
    );
  }

  String toRawLocation() {
    String addKeyValPair({
      required String key,
      String? value,
      bool hideKey = false,
      bool appendAlt = true,
    }) =>
        value == null ? "" : "/$value";
    String loc = "";
    loc += addKeyValPair(
        key: kPageParam,
        value: pageId,
        hideKey: true,
        appendAlt: articleId != null);
    loc += addKeyValPair(key: kArticleParam, value: articleId);

    return Uri.encodeFull(loc);
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
      bool hideKey = false,
      bool appendAlt = true,
    }) =>
        (value == null || value.isEmpty) ? "" : "/$value";
    String loc = "";
    if (!_shouldHidePath(pageId)) {
      loc += addKeyValPair(
          key: kPageParam,
          value: pageId,
          hideKey: true,
          appendAlt: articleId != null);
    }
    loc += addKeyValPair(key: kArticleParam, value: articleId);

    return Uri.encodeFull(loc);
  }

  /// Hide the path ([pageId]) when it's home page because [SplashPage]
  /// already have the empty path id.
  static bool _shouldHidePath(String? pageId) {
    return pageId == AppPage.home.name;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        pageId,
        articleId,
      ];
}
