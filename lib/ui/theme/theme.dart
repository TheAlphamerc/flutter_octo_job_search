import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/ui/theme/text_theme.dart';
part 'extentions.dart';
part 'colors/light_color.dart';
part 'colors/dark_colors.dart';

enum ThemeType { LIGHT, DARK }

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: KLightColors.primary,
        primaryColorLight: KLightColors.primaryLight,
        buttonColor: KLightColors.primary,
        backgroundColor: KLightColors.background,
        cardColor: KLightColors.cardColor,
        cardTheme: CardTheme(color: KLightColors.cardColor,elevation:0),
        iconTheme: IconThemeData(color: KLightColors.gray),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
            surface: KLightColors.surfaceColor,
            onSurface: KLightColors.onSurfaceDarkColor,
            onPrimary: KLightColors.onPrimary,
            onSecondary: KLightColors.onPrimary,
            onBackground: KLightColors.onSurfaceLightColor),
        textTheme: TextThemes.lightTextTheme,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: KLightColors.primary,
          elevation: 1,
          textTheme: TextTheme(
            headline6: TextStyle(color: KDarkColors.white, fontSize: 20,fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(
            color: KLightColors.white,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        brightness: Brightness.light,
        primaryColor: KDarkColors.primary,
        primaryColorLight: KDarkColors.primaryLight,
        buttonColor: KDarkColors.primary,
        backgroundColor: KDarkColors.background,
        cardColor: KDarkColors.cardColor,
        cardTheme: CardTheme(color: KDarkColors.cardColor,elevation:0),
        iconTheme: IconThemeData(color: KDarkColors.iconColor),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
            surface: KDarkColors.surfaceColor,
            onSurface: KDarkColors.onSurfaceDarkColor,
            onPrimary: KDarkColors.onPrimary,
            onSecondary: KDarkColors.onPrimary,
            onBackground: KDarkColors.onSurfaceLightColor),
        textTheme: TextThemes.darkTextTheme,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: KDarkColors.primary,
          elevation: 1,
          textTheme: TextTheme(
           headline6: TextStyle(color: KDarkColors.white, fontSize: 20,fontWeight: FontWeight.bold),
          ),
          // iconTheme: IconThemeData(
          //   color: KDarkColors.iconColor,
          // ),
        ),
      );
  static BoxDecoration outline(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
      );
  static BoxDecoration outlinePrimary(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
      );
  static BoxDecoration outlineError(context) => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).errorColor, width: 2),
      );

  static BoxDecoration decoration(context) => BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Theme.of(context).colorScheme.onPrimary,
      boxShadow: <BoxShadow>[BoxShadow(color: Color(0xffeaeaea), blurRadius: 10, offset: Offset(4, 4))]);

  // Return a scaling factor between 0.0 and 1.0 for screens heights ranging
  // from a fixed short to tall range.
  double contentScale(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    const tall = 896.0;
    const short = 480.0;
    return ((height - short) / (tall - short)).clamp(0.0, 1.0);
  }

  // Return a value between low and high for screens heights ranging
  // from a fixed short to tall range.
  double contentScaleFrom(BuildContext context, double low, double high) {
    return low + contentScale(context) * (high - low);
  }

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static ThemeData getThemeFromKey(ThemeType themeKey) {
    switch (themeKey) {
      case ThemeType.LIGHT:
        return lightTheme;
      case ThemeType.DARK:
        return lightTheme;
      default:
        return lightTheme;
    }
  }
}
