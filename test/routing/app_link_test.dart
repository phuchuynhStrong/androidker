import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AppLink", () {
    group('toRawLocation', () {
      test("Have pageId", () {
        var pageId = AppPage.signIn.name;
        var link = AppLink(
          pageId: pageId,
        );
        expect(link.toRawLocation(), "/$pageId");

        pageId = AppPage.blog.name;
        link = AppLink(
          pageId: pageId,
        );
        expect(link.toRawLocation(), "/$pageId");

        pageId = AppPage.home.name;
        link = AppLink(
          pageId: pageId,
        );
        expect(link.toRawLocation(), "/$pageId");
      });
      test('Have pageId and articleId', () {
        final pageId = AppPage.drafts.name;
        const articleId = "random";
        final link = AppLink(
          pageId: pageId,
          articleId: articleId,
        );
        expect(link.toRawLocation(), "/$pageId/$articleId");
      });
    });

    group('toLocation', () {
      test('Home page and Splash page', () {
        var pageId = AppPage.home.name;

        var appLink = AppLink(pageId: pageId);

        expect(appLink.toLocation(), "");

        pageId = AppPage.splash.name;
        appLink = AppLink(pageId: pageId);

        expect(appLink.toLocation(), "");
      });

      test("Normal router except home", () {
        var pageId = AppPage.blog.name;
        var appLink = AppLink(pageId: pageId);

        expect(appLink.toLocation(), "/$pageId");

        pageId = AppPage.settings.name;
        appLink = AppLink(pageId: pageId);

        expect(appLink.toLocation(), "/$pageId");
      });

      test("Have pageId and articleId", () {
        var pageId = AppPage.drafts.name;
        var articleId = "random";
        var appLink = AppLink(pageId: pageId, articleId: articleId);

        expect(appLink.toLocation(), "/$pageId/$articleId");
      });
    });

    group('fromLocation', () {
      test('Initial page', () {
        const baseUrl = "https://androidker.xyz";
        expect(AppLink.fromLocation(baseUrl),
            AppLink(pageId: AppPage.splash.name));
      });

      test('Other pages except initial page', () {
        var url = "https://androidker.xyz/blog";
        expect(AppLink.fromLocation(url), AppLink(pageId: AppPage.blog.name));

        url = "https://androidker.xyz/drafts/random";
        expect(AppLink.fromLocation(url),
            AppLink(pageId: AppPage.drafts.name, articleId: "random"));
      });
    });
  });
}
