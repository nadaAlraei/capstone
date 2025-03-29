
import 'package:flutter/cupertino.dart';

class BottomNavigationBarController extends ChangeNotifier{
  int selectIndex = 0;
  Widget selectWidget = Text('data git1');

  changeIndex({required int index}){
    selectIndex = index;
    notifyListeners();
  }

  changeWidget({required Widget widget}){
    selectWidget = widget;
    notifyListeners();
  }
}