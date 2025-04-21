
import 'package:capstone/controller/shared_preferences_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier{
  bool isDark = false;
  ThemeData themeData = ThemeData.light();
  ThemeData dark = ThemeData(
    brightness:  Brightness.dark,

    textTheme:  TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize:  22),
      bodyMedium: TextStyle(color: Colors.white, fontSize:  28),
      bodySmall: TextStyle(color: Colors.white, fontSize:  15),
      labelLarge: TextStyle(color: Colors.white, fontSize:  25),
    ),

  );

  ThemeData light = ThemeData(
    brightness:  Brightness.light,

    textTheme:  TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize:  22),
      bodyMedium: TextStyle(color: Colors.black, fontSize:  28),
      bodySmall: TextStyle(color: Colors.black, fontSize:  15),
      labelLarge: TextStyle(color: Colors.black, fontSize:  25),
    ),

  );


  changeTheme() {
    isDark = !isDark;
    if(isDark == true){
      themeData =ThemeData.dark();
    }else{
      themeData =ThemeData.light();
    }
    SharedPreferencesHelper().savePrefBool(key: 'isDark', value: isDark);

    notifyListeners();
  }

  getTheme() async{

    bool isDark = await SharedPreferencesHelper().getPrefBool(key: 'isDark', defaultValue: false);

    notifyListeners();
  }
}