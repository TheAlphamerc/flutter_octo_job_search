import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemes {
  static TextTheme get darkTextTheme => TextTheme(
        headline1: GoogleFonts.roboto(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffe5e3e6),
          letterSpacing: -1.5
        ),
        headline2: GoogleFonts.roboto(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffe5e3e6),
          letterSpacing: -.5
        ),
        headline3: GoogleFonts.roboto(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Color(0xffe5e3e6),
          letterSpacing: 0
        ),
        headline4: GoogleFonts.roboto(
          fontSize: 30.0,
          fontWeight: FontWeight.normal,
          color: Color(0xffe5e3e6),
          letterSpacing: .25
        ),
        headline5: GoogleFonts.roboto(
          fontSize: 24.0,
          fontWeight: FontWeight.normal,
          color: Color(0xffe5e3e6),
          letterSpacing: .0
        ),
        headline6: GoogleFonts.roboto(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Color(0xffe5e3e6),
          letterSpacing: .15
        ),
        subtitle1: GoogleFonts.roboto(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: KLightColors.subtitleColor,
        ),
        subtitle2: GoogleFonts.roboto(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: KLightColors.subtitleColor,
          letterSpacing: .5
        ),
        bodyText1: GoogleFonts.roboto(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Color(0xffe5e3e6),
          letterSpacing: .5
        ),
        bodyText2: GoogleFonts.roboto(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: Color(0xffe5e3e6),
          letterSpacing: .25
        ),
        caption: GoogleFonts.roboto(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Color(0xffe5e3e6),
          letterSpacing: .4
        ),
        overline: GoogleFonts.roboto(
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
          color: Color(0xffe5e3e6),
          letterSpacing: 1.5
        ),
      
        button: GoogleFonts.roboto(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Color(0xffe5e3e6),
          letterSpacing: 1.2
        ),
      );
   static TextTheme get lightTextTheme => TextTheme(
        headline1: GoogleFonts.roboto(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: KLightColors.black,
          letterSpacing: -1.5
        ),
        headline2: GoogleFonts.roboto(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          color: KLightColors.black,
          letterSpacing: -.5
        ),
        headline3: GoogleFonts.roboto(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: KLightColors.black,
          letterSpacing: 0
        ),
        headline4: GoogleFonts.roboto(
          fontSize: 30.0,
          fontWeight: FontWeight.normal,
          color: KLightColors.black,
          letterSpacing: .25
        ),
        headline5: GoogleFonts.roboto(
          fontSize: 24.0,
          fontWeight: FontWeight.normal,
          color: KLightColors.black,
          letterSpacing: .0
        ),
        headline6: GoogleFonts.roboto(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: KLightColors.black,
          letterSpacing: .15
        ),
        subtitle1: GoogleFonts.roboto(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: KDarkColors.subtitleColor,
        ),
        subtitle2: GoogleFonts.roboto(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: KDarkColors.subtitleColor,
          letterSpacing: .5
        ),
        bodyText1: GoogleFonts.roboto(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: KLightColors.black,
          letterSpacing: .5
        ),
        bodyText2: GoogleFonts.roboto(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: KLightColors.black,
          letterSpacing: .25
        ),
        caption: GoogleFonts.roboto(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: KLightColors.black,
          letterSpacing: .4
        ),
        overline: GoogleFonts.roboto(
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
          color: KLightColors.black,
          letterSpacing: 1.5
        ),
      
        button: GoogleFonts.roboto(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: KLightColors.black,
          letterSpacing: 1.2
        ),
      );
}
