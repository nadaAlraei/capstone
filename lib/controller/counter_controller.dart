import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier{
  int count = 1;

  add(){
    count = count + 1;
    notifyListeners();
  }
  minus(){
    if(count > 1){
      count = count -1 ;
    }else{
      count = 1;
    }

    notifyListeners();
  }
}