// Abstract base text style class
import 'package:flutter/material.dart';
import 'package:test_band/core/enums/enums.dart';
import 'package:test_band/core/utils/app_extensions.dart';

abstract class BaseTextStyle {
  Color? get color => null;
  Color? get backgroundColor => null;
  double? get fontSize => null;
  AppFontWeight? get fontWeight => null;
  FontStyle? get fontStyle => null;
  double? get letterSpacing => null;
  double? get wordSpacing => null;
  TextBaseline? get textBaseline => null;
  double? get height => null;
  Locale? get locale => null;
  Paint? get foreground => null;
  Paint? get background => null;
  List<Shadow>? get shadows => null;
  List<FontFeature>? get fontFeatures => null;
  List<FontVariation>? get fontVariations => null;
  TextDecoration? get decoration => null;
  Color? get decorationColor => null;
  TextDecorationStyle? get decorationStyle => null;
  double? get decorationThickness => null;
  String? get debugLabel => null;
  String? get fontFamily => null;
  List<String>? get fontFamilyFallback => null;
  String? get package => null;
  TextOverflow? get overflow => null;

  // Convert to Flutter TextStyle
  TextStyle toTextStyle() {
    return TextStyle(
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight?.value,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      fontVariations: fontVariations,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      package: package,
      overflow: overflow,
    );
  }
}

class AppTextStyle extends BaseTextStyle {
  @override
  String? get fontFamily => 'Almarai';
  
  @override
  AppFontWeight? get fontWeight => AppFontWeight.regular;
  
  @override
  double? get fontSize => 16;
  
  @override
  double? get height => 1.4;
  
  @override
  Color? get color => Colors.black87;
}

class ThinTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.thin;
}

class ExtraLightTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.extraLight;
}

class LightTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.light;
}

class RegularTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.regular;
}

class MediumTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.medium;
}

class SemiBoldTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.semiBold;
}

class BoldTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.bold;
}

class ExtraBoldTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.extraBold;
}

class BlackTextStyle extends AppTextStyle {
  @override
  AppFontWeight? get fontWeight => AppFontWeight.black;
}

class AppTextStyles {
  static final thin = ThinTextStyle();
  static final extraLight = ExtraLightTextStyle();
  static final light = LightTextStyle();
  static final regular = RegularTextStyle();
  static final medium = MediumTextStyle();
  static final semiBold = SemiBoldTextStyle();
  static final bold = BoldTextStyle();
  static final extraBold = ExtraBoldTextStyle();
  static final black = BlackTextStyle();
}
