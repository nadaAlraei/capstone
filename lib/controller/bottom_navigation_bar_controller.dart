
import 'package:capstone/view/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationBarController extends ChangeNotifier{
  int selectIndex = 0;
  Widget selectWidget = HomeScreen();

  changeIndex({required int index}){
    selectIndex = index;
    notifyListeners();
  }

  changeWidget({required Widget widget}){
    selectWidget = widget;
    notifyListeners();
  }
}