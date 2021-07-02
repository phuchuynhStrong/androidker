enum AppPage {
  home,
  blog,
  showcase,
  notFound,
}

extension AppPageName on AppPage {
  String get name {
    switch (this) {
      case AppPage.home:
        return '';
      case AppPage.blog:
      case AppPage.showcase:
        return toString().split('.').last;
      default:
        return '404';
    }
  }
}

bool isPageNotFound(String? page) =>
    AppPage.values.every((s) => s.name != page);
