enum AppPage {
  home,
  blog,
  showcase,
  notFound,
  splash,
  settings,
  editor,
  signIn,
}

extension AppPageName on AppPage {
  String get name {
    switch (this) {
      case AppPage.splash:
        return '';
      case AppPage.home:
      case AppPage.blog:
      case AppPage.showcase:
      case AppPage.settings:
      case AppPage.editor:
      case AppPage.signIn:
        return toString().split('.').last;
      default:
        return '404';
    }
  }
}

bool isPageNotFound(String? page) =>
    AppPage.values.every((s) => s.name != page);
