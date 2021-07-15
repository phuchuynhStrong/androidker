const _kUseVerticalLayoutPivot = 700.0;

class LayoutUtils {
  static bool useVerticalLayout(double widthPx) =>
      widthPx < _kUseVerticalLayoutPivot;
}
