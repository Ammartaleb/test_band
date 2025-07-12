import 'package:flutter/material.dart';
import 'package:test_band/core/enums/enums.dart';

extension BuildContextHelper on BuildContext {
  /// function to get width of the screen
  double width() => MediaQuery.of(this).size.width;

  /// function to get height of the screen
  double height() => MediaQuery.of(this).size.height;

  /// function to remove the focus from the
  /// text field when click outside of it
  unFocus() => FocusScope.of(this).unfocus();

  /// function to route to next page (normal state)
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// function to route to next page
  /// (with replace the current route with new route)
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// function to route to the next page (with remove all previous routes)
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (predicate) => false,
      arguments: arguments,
    );
  }

  /// function to back to the previous route
  void pop({Object? arguments}) => Navigator.pop(this, arguments);
}

extension AppFontWeightExtension on AppFontWeight {
  FontWeight get value {
    switch (this) {
      case AppFontWeight.thin:
        return FontWeight.w100;
      case AppFontWeight.extraLight:
        return FontWeight.w200;
      case AppFontWeight.light:
        return FontWeight.w300;
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.semiBold:
        return FontWeight.w600;
      case AppFontWeight.bold:
        return FontWeight.w700;
      case AppFontWeight.extraBold:
        return FontWeight.w800;
      case AppFontWeight.black:
        return FontWeight.w900;
    }
  }
}
