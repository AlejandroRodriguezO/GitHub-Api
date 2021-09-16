import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:git_clone/domain/data/preferences_reposiitory.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController extends GetxController{

   final PreferencesRepository _preferences = Get.find();
   
   late ThemeMode _mode;

  ThemeMode get mode => _mode;
  ThemeController() {
    _mode = _preferences.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  final _font = GoogleFonts.nunitoSansTextTheme();

final primaryLightColor = Color(0xFFfefefe);
final primaryDarkColor = Color(0xFF000000);
  TextTheme get _textTheme => _font;

  bool get isDark => _mode == ThemeMode.dark;

  ThemeData get ligthTheme => ThemeData.light().copyWith(
        appBarTheme:  AppBarTheme(
          iconTheme: IconThemeData(
            color: primaryLightColor,
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        textTheme: _textTheme,
        primaryColorLight: primaryLightColor,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          // primarySwatch: MaterialColor(
          //   primaryLightColor.value,
          //   swatch,
          // ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryLightColor.withOpacity(.5),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        appBarTheme:  AppBarTheme(
          brightness: Brightness.light,
          backgroundColor: primaryDarkColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        textTheme: _textTheme
            .merge(
              ThemeData.dark().textTheme,
            )
            .apply(
              fontFamily: _font.bodyText1!.fontFamily,
            ),
        primaryColorDark: primaryDarkColor,
        textSelectionTheme:  TextSelectionThemeData(
          cursorColor: primaryDarkColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          // primarySwatch: MaterialColor(Colors.blue, swatch),
        ),
        inputDecorationTheme:  InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryDarkColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
        ),
        scaffoldBackgroundColor: const Color(
          0xFF102027,
        ),
      );

  void toggle() {
    if (_mode == ThemeMode.light) {
      _mode = ThemeMode.dark;
      _preferences.DarkMode(true);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      _mode = ThemeMode.light;
      _preferences.DarkMode(false);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    update();
  }
}