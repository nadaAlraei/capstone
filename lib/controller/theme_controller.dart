import 'package:capstone/controller/shared_preferences_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isDark = false;
  ThemeData themeData;

  ThemeController() : themeData = ThemeData.light() {
    _initializeTheme();
  }

  final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.amber,
      surface: Colors.grey[900]!,
      onSurface: Colors.white,
    ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.white, fontSize: 22),
    //   bodyMedium: TextStyle(color: Colors.white, fontSize: 28),
    //   bodySmall: TextStyle(color: Colors.white, fontSize: 15),
    //   labelLarge: TextStyle(color: Colors.white, fontSize: 25),
    // ),
  );

  final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.amber,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.black, fontSize: 22),
    //   bodyMedium: TextStyle(color: Colors.black, fontSize: 28),
    //   bodySmall: TextStyle(color: Colors.black, fontSize: 15),
    //   labelLarge: TextStyle(color: Colors.black, fontSize: 25),
    // ),
  );

  Future<void> _initializeTheme() async {
    isDark = await SharedPreferencesHelper().getPrefBool(
        key: 'isDark',
        defaultValue: false
    );
    themeData = isDark ? dark : light;
    notifyListeners();
  }

  Future<void> changeTheme() async {
    isDark = !isDark;
    themeData = isDark ? dark : light;
    await SharedPreferencesHelper().savePrefBool(
        key: 'isDark',
        value: isDark
    );
    notifyListeners();
  }
}