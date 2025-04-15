import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController  extends ChangeNotifier{

  final int totalPages = 4;
 bool isLast = false;

 updatePage(int index) {
    isLast = index == totalPages - 1;
    notifyListeners();
  }


  }
