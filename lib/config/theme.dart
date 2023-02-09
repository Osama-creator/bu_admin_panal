import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queen/queen.dart';

class AppThemeConfig extends ThemeConfig {
  @override
  List<QTheme> get themes => [
        QTheme(
          id: 'light',
          name: 'light'.tr,
          theme: buildlighttheme(),
        ),
      ];
}

ThemeData buildlighttheme() {
  return ThemeData.light().copyWith(
    primaryColor: const Color.fromARGB(255, 0, 32, 65),
    scaffoldBackgroundColor: const Color.fromARGB(255, 230, 230, 230),
    textTheme: GoogleFonts.tajawalTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2C3E50),
      centerTitle: true,
      elevation: 0,
    ),
  );
}
