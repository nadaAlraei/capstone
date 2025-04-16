
import 'package:capstone/view/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationBarController extends ChangeNotifier{
  int selectIndex = 0;
  Widget selectWidget = HomeScreen();
  bool isVisible = true; // checkout
  bool isVisible2 = true; // map
  bool isVisible3 = true; // profile
  bool isVisible4 = true; // card

  changeIndex({required int index}){
    selectIndex = index;
    if(selectIndex == -1){
      isVisible =false;
      isVisible2 = true;
      isVisible3 =true;
    }else if(selectIndex == -2){
      isVisible2 =false;
      isVisible = true;
      isVisible3 = true;
      isVisible4 =true;
    }else if(selectIndex == -5){
      isVisible2 =true;
      isVisible = true;
      isVisible3 =false;
      isVisible4 =true;
    }
    else if(selectIndex == -3){
      isVisible2 =true;
      isVisible = true;
      isVisible3 =true;
      isVisible4 =false;
    }else{
      isVisible = true;
      isVisible2 =true;
      isVisible3 = true;
      isVisible4 =true;
    }
    notifyListeners();
  }

  changeWidget({required Widget widget}){
    selectWidget = widget;
    notifyListeners();
  }
}