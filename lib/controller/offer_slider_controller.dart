import 'package:flutter/cupertino.dart';

class OfferSliderController extends ChangeNotifier{
  int index = 0;

  changeIndex({required newIndex}){
    index = newIndex;
    notifyListeners();
}
}